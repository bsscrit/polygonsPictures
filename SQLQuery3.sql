-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION isUnderFlourThird
(  @x1 real, @y1 real,
  @x2 real, @y2 real,
  @x real, @y real
)
RETURNS  int  
AS
BEGIN
	DECLARE @exp float;
	DECLARE @result int;
	-- Fill the table variable with the rows for your result set
	 set	@exp =(@x-@x1)*(@y2-@y1) - (@y-@y1)*(@x2-@x1);
    
	 set	@result =
	 (case  
			when (@exp>=0) then 1
			else -1
		END
	)
	RETURN( @result)
END
GO