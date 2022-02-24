USE Pubcrawl
GO

DROP FUNCTION IF EXISTS [dbo].[udf_Nearby_Venues]
DROP FUNCTION IF EXISTS [dbo].[udf_Find_Comment_Substring]
GO

/* 
    Function: udfNearbyVenues
    Description: Returns a list of venues and their distances from a given venue. The list is limited to venues in a close proximity to the given venue.
    Parameters: @venue_id - The ID of the venue to search from
                @distance - The max distance a venue can be from the given venue
    Return: A table of nearby venues and the distance from the given venue in km (rounded to 2dp).
*/
CREATE FUNCTION [dbo].[udf_Nearby_Venues] (
	@venue_id INT,
	@distance FLOAT = 10
)
RETURNS @Venues TABLE
(
	[Name] VARCHAR(200),
	[Distance (km)] FLOAT
)
AS 
	BEGIN
		DECLARE @venue_from GEOGRAPHY;
		SELECT @venue_from = [location] FROM Venue WHERE [venue_id] = @venue_id;
		INSERT INTO @Venues
		SELECT 
				[name], 
				ROUND(@venue_from.STDistance([location]) / 1000, 2)
		FROM Venue
		WHERE (@venue_from.STDistance([location]) / 1000) <= @distance AND [venue_id] != @venue_id;
		RETURN;
	END
GO

/*
    INPUT: A word to search for in route_ratings.comment

    OUTPUT: User id, name and comment.
*/

CREATE FUNCTION [dbo].[udf_Find_Comment_Substring]
(
    @word VARCHAR(255)

)
Returns @Route_Ratings_search TABLE
(
    [name] VARCHAR(50),
    [comment] VARCHAR(255)
)
AS
    BEGIN
        INSERT INTO @Route_Ratings_search
        SELECT u.[name], rr.[comment]
        FROM [dbo].[Route_Rating] rr
        INNER JOIN [dbo].[User] u
        ON rr.[user_id] = u.[user_id]
        WHERE [comment] LIKE '%' + @word + '%';


        RETURN;
    END
GO