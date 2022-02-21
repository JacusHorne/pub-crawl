USE PubCrawl
GO

CREATE TABLE Route_Rating (
	user_id int NOT NULL FOREIGN KEY REFERENCES Users(user_id),
	route_id int NOT NULL FOREIGN KEY REFERENCES Route(route_id),
	rating int NOT NULL,
	comment varchar(255)
);

INSERT INTO Route_Rating
    (
    [user_id],
    [route_id],
    [rating],
    [comment]
    )
VALUES  (1,1, 1, 'Too little time to have drinks at all the bars.'),
        (2,2, 1, 'Horrible suggestion, poor service at X and O Bar.'),
        (3,2, 5, 'I had so much fun on this route, I might do it again next week..'),
        (4,2, 3, 'It was great.. I got home tipsy, sure wish I passed out.')
GO