USE Pubcrawl;
GO

EXEC [dbo].[Insert_Stop] @RouteID = 1,
	@StopNumber = 6,
	@Duration = 7,
	@VenueID = 4
GO