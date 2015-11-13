using System;
using System.Data.SqlClient;
using System.IO;

using Utilities.Core;
using Utilities.Sql.SqlServer;

namespace cs_tsql_make_example
{
  public class Program
  {
    private static Log _log;

    public static void Main(String[] args)
    {
      /* Modify the connection to point to the appropriate server and database. */
      using (var connection = new SqlConnection("Server=(local);Database=make;Trusted_Connection=True;"))
      {
        connection.Open();

        var logFilename = Path.Combine(Path.GetTempPath(), "SQL Make Log.txt");
        using (var sw = new StreamWriter(logFilename))
        {
          _log = new Log(sw);

          var make = new Make(connection);

          /* Use the AddFolder and/or AddFile methods to specify files for the
             make process.  Duplicate full paths are ignored. */

          make.AddFolder(@"..\..\Stored Procedures");
          make.AddFolder(@"..\..\Udtts");

          /* Optional event handlers.
          
             Make outputs a large amount of logging data
             that's useful for debugging. */
          make.LogEvent += make_LogEvent;

          /* Make traps ALL exceptions and routes them through the ErrorEvent
             handler. The Make algorithm will stop on the first exception it
             encounters and raise this event. */
          make.ErrorEvent += make_ErrorEvent;

          make.Run();
        }
      }
    }

    private static void make_ErrorEvent(object sender, MakeErrorEventArgs e)
    {
      _log.WriteLine(LogEntryType.Error, e.GetException().GetAllExceptionMessages());
    }

    private static void make_LogEvent(object sender, LogEventArgs e)
    {
      _log.WriteLine(LogEntryType.Info, e.GetMessage());
    }
  }
}
