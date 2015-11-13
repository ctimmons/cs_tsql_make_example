USE [make];
GO

IF OBJECT_ID(N'[dbo].[proc5_not_using_udtt1_nor_used_by_any_other_object]') IS NOT NULL
  DROP PROCEDURE [dbo].[proc5_not_using_udtt1_nor_used_by_any_other_object]; 
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, XACT_ABORT ON;
GO

CREATE PROCEDURE [dbo].[proc5_not_using_udtt1_nor_used_by_any_other_object]
AS
BEGIN
  RETURN 0;
END;

GO


