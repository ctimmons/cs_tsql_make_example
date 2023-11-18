## cs_tsql_make_example

(NOTE: This repository has been archived.  I've discovered it's impossible to create a make-like utility for SQL Server because there isn't enough metadata to determine what needs to be re-compiled and in what order.)

Example program showing how to use the Utilities.Sql.SqlServer.Make class.

The program demonstrates how Make handles the dependencies between user-defined table types and stored procedures that depend on those types.  The *.sql filenames describe the dependencies.

#### Compile-time Dependencies

Utilities.Core and Utilities.Sql from [cs_utilities](https://github.com/ctimmons/cs_utilities).

#### Runtime Dependencies

The example connects to an SQL Server database and modifies it.  Either create a new database or choose an existing one.  Modify the connection string in Program.cs to point to that database.

A log file is created that contains all of the logging and error data.  The log file will be written to the standard temp folder, something like "C:\Users\username\AppData\Local\Temp\SQL Make Log.txt".

