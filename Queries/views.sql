
USE PubCrawl
GO

CREATE VIEW [top_routes]
AS
SELECT
	[route].[name],
	AVG([route_rating].[rating]) AS [rating]
FROM [dbo].[Route] AS [route], [dbo].[Route_Rating] AS [route_rating]
WHERE [route].[route_id] = [route_rating].[route_id]
GROUP BY [route].[name]
ORDER BY [rating] DESC OFFSET 0 ROWS;
GO

-- Average drink price
CREATE VIEW vDrinkPrice
AS
	SELECT d.[name], AVG(vd.[price]) AS average_price
	FROM [dbo].[Drink] d
		JOIN [dbo].[Venue_Drink] vd ON d.[drink_id] = vd.[drink_id]
	GROUP BY d.[name]
GO

-- Average venue rating (keep rounding?)
CREATE VIEW vVenueRating
AS
	SELECT v.[name], AVG(rr.[rating]) AS average_rating
	FROM [dbo].[Venue] v
		JOIN [dbo].[Route_Stop] rs ON v.[venue_id] = rs.[venue_id]
		JOIN [dbo].[Route] r ON rs.[route_id] = r.[route_id]
		JOIN [dbo].[Route_Rating] rr ON r.[route_id] = rr.[route_id]
	GROUP BY v.[name]
GO
