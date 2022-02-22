USE PubCrawl
GO

CREATE TABLE [dbo].[Route_Stop] (
	[venue_id] int NOT NULL FOREIGN KEY REFERENCES [dbo].[Venue]([venue_id]),
    [route_id] int NOT NULL FOREIGN KEY REFERENCES [dbo].[Route]([route_id]),
    [duration] int NULL,
    [stop_number] int NOT NULL,
    CONSTRAINT [pk_route_stop_id] PRIMARY KEY CLUSTERED
    (
        ([route_stop_id],[stop_number]) ASC
    )
);

INSERT INTO [dbo].[Route_Stop]
    (
    [venue_id],
    [route_id],
    [duration],
    [stop_number]
    )
VALUES  (1 ,1 ,1, 1),
        (2, 1, 1, 2),
        (1, 2, 1, 1),
        (3, 2, 4, 2)
GO