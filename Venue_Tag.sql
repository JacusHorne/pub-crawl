USE Pub_Crawl
GO

CREATE TABLE Venue_Tag (
	tag_id int NOT NULL,
	venue_id int NOT NULL,
	PRIMARY KEY (tag_id, venue_id)
);

INSERT INTO Venue_Tag
    (
    [tag_id],
    [venue_id]
    )
VALUES (1, 1),
	(1, 2),
	(3, 1)
GO