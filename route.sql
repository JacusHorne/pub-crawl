USE PubCrawl
GO

CREATE TABLE Route (
	route_id int NOT NULL PRIMARY KEY,
	name varchar(50) NOT NULL,
	user_id int NOT NULL FOREIGN KEY REFERENCES Users(user_id)
);

INSERT INTO Route
    (
    [route_id],
    [name],
    [user_id]
    )
VALUES  (1, 'test1', 1),
        (2, 'test2', 1),
        (3, 'test3', 5),
        (4, 'test4', 3)
GO