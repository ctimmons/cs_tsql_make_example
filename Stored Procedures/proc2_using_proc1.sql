﻿USE [make];
GO

IF OBJECT_ID(N'[dbo].[proc2_using_proc1]') IS NOT NULL
  DROP PROCEDURE [dbo].[proc2_using_proc1]; 
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, XACT_ABORT ON;
GO

CREATE PROCEDURE [dbo].[proc2_using_proc1]
AS
BEGIN
  EXEC [dbo].[proc1_using_udtt1];
  RETURN 0;
END;

GO