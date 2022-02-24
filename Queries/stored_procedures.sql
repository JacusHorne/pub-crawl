USE Pubcrawl;
GO

/*
Proc that takes a route_id as an input and then returns the ratings for that 
route along with the comments and the name of the user who left the review
in descending order.
*/


DROP PROCEDURE IF EXISTS dbo.Ratings
GO

CREATE PROCEDURE dbo.Ratings
(
	@RouteID	int
)
AS
BEGIN;

BEGIN TRY

SELECT dbo.[User].[name],dbo.Route_Rating.rating, dbo.Route_Rating.comment FROM dbo.Route_Rating
INNER JOIN [dbo].[User]
ON dbo.Route_Rating.user_id = dbo.[User].user_id
WHERE route_id = @RouteID
ORDER BY dbo.Route_Rating.rating DESC;

END TRY
BEGIN CATCH
	PRINT 'Error occurred in ' + ERROR_PROCEDURE() + ' ' + ERROR_MESSAGE();
	RETURN -1;
END CATCH

END;
GO