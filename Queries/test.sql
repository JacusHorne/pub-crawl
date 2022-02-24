USE Pubcrawl;
GO

EXEC [dbo].[Insert_Stop] @RouteID = ,
	@VenueID = 3,
	@Duration = 5,
	@StopNumber = 2;
GO