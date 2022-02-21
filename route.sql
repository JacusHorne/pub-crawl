USE PubCrawl
GO

CREATE TABLE [dbo].[Route] (
	[route_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) NOT NULL,
	[user_id] int NOT NULL FOREIGN KEY REFERENCES [dbo].[Users]([user_id]),
    CONSTRAINT [pk_route_id] PRIMARY KEY CLUSTERED
    (
        [route_id] ASC
    )
);

INSERT INTO [dbo].[Route]
    (
    [name],
    [user_id]
    )
VALUES  ('test1', 1),
        ('test2', 1),
        ('test3', 5),
        ('test4', 3)
GO