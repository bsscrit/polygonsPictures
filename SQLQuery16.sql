/****** Script for SelectTopNRows command from SSMS  ******/



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
           (4,0.237784,0.2,0.03,0.5,0.89,1,3.15,3.15,9.81,10.1      )
SELECT TOP 1000 [priceid]
      ,[t1]
      ,[t1m]
      ,[t2]
      ,[t2m]
      ,[t3]
      ,[t3m]
      ,[t4]
      ,[t4m]
      ,[t5]
      ,[t5m]
  FROM [silPolygons].[dbo].[prices]