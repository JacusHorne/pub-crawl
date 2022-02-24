
USE PubCrawl
GO

DROP VIEW IF EXISTS [dbo].[v_Top_Routes] 
DROP VIEW IF EXISTS [dbo].[v_Drink_Price]
DROP VIEW IF EXISTS [dbo].[v_Venue_Rating]
GO

CREATE VIEW [v_Top_Routes]
AS
	SELECT r.[name], AVG(rr.[rating]) AS [average_rating]
	FROM [dbo].[Route] r, [dbo].[Route_Rating] rr
	WHERE r.[route_id] = rr.[route_id]
	GROUP BY r.[name]
	ORDER BY [average_rating] 
	DESC OFFSET 0 ROWS;
GO

-- Average drink price
CREATE VIEW [v_Drink_Price]
AS
	SELECT d.[name], AVG(vd.[price]) AS [average_price]
	FROM [dbo].[Drink] d
		JOIN [dbo].[Venue_Drink] vd ON d.[drink_id] = vd.[drink_id]
	GROUP BY d.[name];
GO

-- Average venue rating
CREATE VIEW [v_Venue_Rating]
AS
	SELECT v.[name], AVG(rr.[rating]) AS [average_rating]
	FROM [dbo].[Venue] v
		JOIN [dbo].[Route_Stop] rs ON v.[venue_id] = rs.[venue_id]
		JOIN [dbo].[Route] r ON rs.[route_id] = r.[route_id]
		JOIN [dbo].[Route_Rating] rr ON r.[route_id] = rr.[route_id]
	GROUP BY v.[name];
GO


SELECT * FROM [v_Top_Routes]
SELECT * FROM [v_Drink_Price]
SELECT * FROM [v_Venue_Rating]