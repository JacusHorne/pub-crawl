USE PubCrawl
GO

CREATE VIEW top_routes
AS
SELECT route.route_id,
	name,
	AVG(route_rating.rating)
FROM Route as route, Route_Rating AS route_rating
WHERE route_rating.route_id = route_rating.route_id
GROUP BY route_name;
GO