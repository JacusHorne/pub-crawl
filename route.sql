USE PubCrawl
GO

CREATE TABLE Route (
	route_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	name varchar(50) NOT NULL,
	user_id int NOT NULL FOREIGN KEY REFERENCES Users(user_id)
);

INSERT INTO Route
    (
    [name],
    [user_id]
    )
VALUES  ('test1', 1),
        ('test2', 1),
        ('test3', 5),
        ('test4', 3)
GO