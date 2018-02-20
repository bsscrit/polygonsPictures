USE [silPolygons]
GO

/****** Object:  StoredProcedure [dbo].[InsertRandomPoints]    Script Date: 20.02.2018 20:07:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertRandomPoints] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  insert into [dbo].[point]( [x], [y]) values (  RAND(), RAND())
END

GO


