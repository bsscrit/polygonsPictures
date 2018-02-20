/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [x]
      ,[y]
      ,[PointsId]
  FROM [silPolygons].[dbo].[point]


select a.x ax  ,a.y ay,b.x bx ,b.y 'by',c.x cx,c.y cy,d.x dx, d.y dy, 

   'EXECUTE [dbo].[InsertRandomPoints] ;'

  from [dbo].[point]  a
  inner join [dbo].[point] b on b.[PointsId]<>a.[PointsId] 
    inner join [dbo].[point] c on c.[PointsId]<>a.[PointsId] and c.[PointsId]<>b.[PointsId]
	inner join [dbo].[point] d on d.[PointsId]<>a.[PointsId] and c.[PointsId]<>d.[PointsId]  d.[PointsId]<>b.[PointsId]
where 