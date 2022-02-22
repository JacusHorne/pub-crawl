USE Pub_Crawl
GO

CREATE TABLE Tag (
	tag_id int NOT NULL PRIMARY KEY,
	name varchar(50) NOT NULL
);

INSERT INTO Tag
    (
    [tag_id],
    [name]
    )
VALUES (1, 'Bar'),
	(2, 'Restaurant'),
	(3, 'Open Late'),
	(4, 'Kid Friendly'),
	(5, 'Club'),
	(6, 'Live Music')
GO