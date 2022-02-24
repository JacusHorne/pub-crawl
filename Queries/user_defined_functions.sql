/* 
    Function: udfNearbyVenues
    Description: Returns a list of venues and their distances from a given venue. The list is limited to venues in a close proximity to the given venue.
    Parameters: @venue_id - The ID of the venue to search from
                @distance - The max distance a venue can be from the given venue
    Return: A table of nearby venues and the distance from the given venue in km (rounded to 2dp).
*/
CREATE FUNCTION [dbo].[udfNearbyVenues] (
	@venue_id INT,
	@distance FLOAT=10
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
				ROUND(@venue_from.STDistance([location])/1000, 2)
		FROM Venue
		WHERE (@venue_from.STDistance([location])/1000) <= @distance AND [venue_id] != @venue_id;
		RETURN;
	END
GO

-- Examples
SELECT * FROM udfNearbyVenues(2, 5);
SELECT * FROM udfNearbyVenues(18, 3);
SELECT * FROM udfNearbyVenues(25, 2);