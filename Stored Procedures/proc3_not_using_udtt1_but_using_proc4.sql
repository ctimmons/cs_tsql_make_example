USE [make];
GO

IF OBJECT_ID(N'[dbo].[proc3_not_using_udtt1_but_using_proc4]') IS NOT NULL
  DROP PROCEDURE [dbo].[proc3_not_using_udtt1_but_using_proc4]; 
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, XACT_ABORT ON;
GO

CREATE PROCEDURE [dbo].[proc3_not_using_udtt1_but_using_proc4]
AS
BEGIN
  EXEC [dbo].[proc1_using_udtt4];
  RETURN 0;
END;

GO

