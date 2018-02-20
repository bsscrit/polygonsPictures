USE [silPolygons]
GO

/****** Object:  Table [dbo].[point]    Script Date: 20.02.2018 20:04:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[point](
	[x] [real] NOT NULL,
	[y] [real] NOT NULL,
	[PointsId] [smallint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PointsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO


