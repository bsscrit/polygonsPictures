/****** Script for SelectTopNRows command from SSMS  ******/


declare @lengh int
declare @number int
declare @x float
declare @y float
select  @lengh = count(*) from [dbo].[point]
select  @lengh
select @number =a.[PointsId] from [dbo].[point] a where a.[PointsId]= cast(RAND()*@lengh as int)
select @number
select @x=[x],@y=[y] from [dbo].[point] where [PointsId]= @number
select @x,@y
declare @l1 int
select  @l1 = count(*) from [dbo].[prices]
select
'
INSERT INTO [dbo].[prices]
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
           ('+cast( @l1+1 as varchar)+cast( a.[t1]*1.09*(1+@x*@y)
		   as varchar)+','+ cast(a.[t1m]*1.09*(1+@x*@y)as varchar)+','+cast(a.[t2]as varchar)
		   +','+  cast(a.[t2m]*1.09*(1+@x*@y)as varchar)+','
		   +cast(a.[t3]*1.09*(1+@x*@y)as varchar)+','+cast(a.[t3m]*1.09*(1+@x*@y)as varchar)
		   +','+cast(a.[t4]*1.09*(1+@x*@y)as varchar)+
		   ','+cast(a.[t4]*1.09*(1+@x*@y)as varchar)+','+cast(a.[t5]*1.09*(1+@x*@y)as varchar)
		   +',' 
		   +cast(a.[t5m]as varchar)+')'
  FROM [silPolygons].[dbo].[prices] a where a.[PriceId] =@l1 

