USE Pubcrawl;
GO

EXEC [dbo].[Insert_Stop] @RouteID = 2,
	@Duration = 7,
	@VenueID = 4
GO