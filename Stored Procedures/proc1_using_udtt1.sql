USE [make];
GO

IF OBJECT_ID(N'[dbo].[proc1_using_udtt1]') IS NOT NULL
  DROP PROCEDURE [dbo].[proc1_using_udtt1]; 
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, XACT_ABORT ON;
GO

CREATE PROCEDURE [dbo].[proc1_using_udtt1]
AS
BEGIN
  DECLARE @t dbo.udtt1_used_by_procs;
  INSERT INTO @t ([id], [name]) VALUES (42, 'Hello, world!');
  SELECT [id] FROM @t;
  RETURN 0;
END;

GO
