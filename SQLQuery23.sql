USE [silPolygons]
GO

select [x]  ,[y],[x],[y],[x]  ,[y],[x],[y] 
 
  from [dbo].[point];

select a.x ax  ,a.y ay,b.x bx ,b.y 'by',c.x cx,c.y cy,d.x dx, d.y dy, 

   'EXECUTE [dbo].[InsertRandomPoints] ;'

  from [dbo].[point]  a
  inner join [dbo].[point] b on b.[PointsId]<>a.[PointsId] 
    inner join [dbo].[point] c on c.[PointsId]<>a.[PointsId] 
	inner join [dbo].[point] d on d.[PointsId]<>a.[PointsId]

GO


