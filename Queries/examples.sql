USE Pubcrawl
GO

-- User defined functions

SELECT * FROM udf_Nearby_Venues(2, 5);
GO

SELECT * FROM udf_Nearby_Venues(18, 3);
GO

SELECT * FROM udf_Nearby_Venues(25, 2);
GO

SELECT * FROM udf_Find_Comment_Substring('little')
GO


-- Stored Procedures

EXEC [dbo].[usp_Ratings_By_Route] 2
GO

EXEC [dbo].[usp_Insert_Stop] @RouteID = 1, @VenueID = 2, @Duration = 1, @StopNumber = 3
GO

EXEC [dbo].[usp_Delete_Stop] @RouteID = 1, @StopNumber = 3
GO


-- Views

SELECT * FROM [v_Top_Routes]
GO

SELECT * FROM [v_Drink_Price]
GO

SELECT * FROM [v_Venue_Rating]
GO