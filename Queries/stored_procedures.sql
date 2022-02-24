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

/*
Proc that inserts a route stop into a route given a route ID, a venue ID, a duration and stop number.
*/

DROP PROCEDURE IF EXISTS [dbo].[Insert_Stop]
GO

CREATE PROCEDURE [dbo].[Insert_Stop]
(
	@RouteID int,
	@VenueID int,
	@Duration int,
	@StopNumber int = -1
)
AS
BEGIN

BEGIN TRANSACTION [Tran1]

BEGIN TRY
	DECLARE @Max int
	SELECT @Max = MAX([stop_number]) FROM [dbo].[Route_Stop] WHERE [dbo].[Route_Stop].[route_ID] = @RouteID
	SET @Max = @Max + 1
	IF @StopNumber > @Max OR @StopNumber < 1
	BEGIN
		SET @StopNumber = @Max 
	END

	UPDATE [dbo].[Route_Stop]
	SET
		[dbo].[Route_Stop].[stop_number] = [dbo].[Route_Stop].[stop_number] + 1
	WHERE
		[dbo].[Route_Stop].[stop_number] >= @StopNumber AND [dbo].[Route_Stop].[route_ID] = @RouteID
	
	INSERT INTO [dbo].[Route_Stop]
		([venue_id], [route_id], [duration], [stop_number])
	VALUES  
		(@VenueID,
			@RouteID,
			@Duration,
			@StopNumber)

	COMMIT TRANSACTION [Tran1]

END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION [Tran1]
END CATCH

END
GO

/*
Proc that removes a route stop from a route given a route ID and stop number.
*/

DROP PROCEDURE IF EXISTS [dbo].[Delete_Stop]
GO

CREATE PROCEDURE [dbo].[Delete_Stop]
(
	@RouteID int,
	@StopNumber int
)
AS
BEGIN

BEGIN TRANSACTION [Tran1]

BEGIN TRY

	DELETE FROM [dbo].[Route_Stop] 
	WHERE [dbo].[Route_Stop].[stop_number] = @StopNumber
		AND [dbo].[Route_Stop].[route_ID] = @RouteID

	UPDATE [dbo].[Route_Stop]
	SET
		[dbo].[Route_Stop].[stop_number] = [dbo].[Route_Stop].[stop_number] - 1
	WHERE
		[dbo].[Route_Stop].[stop_number] > @StopNumber AND [dbo].[Route_Stop].[route_ID] = @RouteID

	COMMIT TRANSACTION [Tran1]

END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION [Tran1]
END CATCH

END
GO