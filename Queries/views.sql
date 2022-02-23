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