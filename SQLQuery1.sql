use [silPolygons];
CREATE TABLE [rpoints]
(
[x] real NOT NULL ,
[y] real NOT NULL,

[PointsId] [smallint] IDENTITY (1, 1) NOT NULL ,
PRIMARY KEY  CLUSTERED 
	(
		[PointsId]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY]
GO
