USE [silPolygons]
GO
declare @lengh int
declare @number int
declare @x float
declare @y float
declare @l1 int
select @lengh =count(*) from point
select @number = a.PointsId from point a where a.PointsId=ROUND(RAND()*@lengh,0)
select @x=point.x, @y=point.y from point where  PointsId=@number
select @l1= count(*)from [dbo].[prices]
select @l1,@x,@y,@number,@lengh

select
'INSERT INTO [dbo].[prices]
           ([priceid]
           ,[t1]
           ,[t1m]
           ,[t2]
           ,[t2m]
           ,[t3]
           ,[t3m]
           ,[t4]
           ,[t4m]
           ,[t5]
           ,[t5m])
     VALUES
           ('+
cast(a.priceid+1 as varchar)+','+cast(a.t1*1.09*(1+@x*@y) as varchar)+','+
cast(a.t1m*1.09*(1+@x*@y) as varchar)+','+cast(a.t2*1.09*(1+@x*@y) as varchar)+','+
cast(a.t2m*1.09*(1+@x*@y) as varchar)+','+cast(a.t3*1.09*(1+@x*@y) as varchar)+','+
cast(a.t2m*1.09*(1+@x*@y) as varchar)+','+cast(a.t4*1.09*(1+@x*@y) as varchar)+','+
cast(a.t4m*1.09*(1+@x*@y) as varchar)+','+cast(a.t5*1.09*(1+@x*@y) as varchar)+','+	
cast(a.t5m*1.09*(1+@x*@y) as varchar)+')'
from prices a where a.priceid=@l1
GO


