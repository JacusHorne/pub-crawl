USE Pubcrawl;
GO

/*
Proc that takes a route_id as an input and then returns the ratings for that 
route along with the comments and the name of the user who left the review
in descending order.
*/


DROP PROCEDURE IF EXISTS [dbo].[usp_Ratings_By_Route]
GO

CREATE PROCEDURE [dbo].[usp_Ratings_By_Route]
(
	@RouteID	int
)
AS
BEGIN;

BEGIN TRY

SELECT u.[name], rr.[rating], rr.[comment] 
FROM [dbo].[Route_Rating] rr
INNER JOIN [dbo].[User] u
ON rr.[user_id] = u.[user_id]
WHERE [route_id] = @RouteID
ORDER BY rr.[rating] DESC;

END TRY
BEGIN CATCH
	PRINT 'Error occurred in ' + ERROR_PROCEDURE() + ' ' + ERROR_MESSAGE();
	RETURN -1;
END CATCH

END;
GO


EXEC [dbo].[usp_Ratings_By_Route] 2 
GO