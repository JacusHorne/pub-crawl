USE Pubcrawl
GO

-- User defined functions

SELECT * FROM [dbo].[udf_Nearby_Venues](2, 5);
GO

SELECT * FROM [dbo].[udf_Nearby_Venues](18, 3);
GO

SELECT * FROM [dbo].[udf_Nearby_Venues](25, 2);
GO

SELECT * FROM [dbo].[udf_Find_Comment_Substring]('little')
GO


-- Stored Procedures

EXEC [dbo].[usp_Ratings_By_Route] 2
GO

EXEC [dbo].[usp_Insert_Stop] @route_id = 1, @venue_id = 2, @duration = 1, @stop_number = 3
GO

EXEC [dbo].[usp_Delete_Stop] @route_id = 1, @stop_number = 3
GO


-- Views

SELECT * FROM [dbo].[v_Top_Routes]
GO

SELECT * FROM [dbo].[v_Drink_Price]
GO

SELECT * FROM [dbo].[v_Venue_Rating]
GO