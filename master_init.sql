-- Create a new database called 'Pubcrawl'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'Pubcrawl'
)
CREATE DATABASE Pubcrawl
GO

USE PubCrawl;
GO

--User table
CREATE TABLE [dbo].[User] (
	[user_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) NOT NULL,
	[email] varchar(50) NOT NULL,
    CONSTRAINT [pk_user_id] PRIMARY KEY CLUSTERED
    (
        [user_id] ASC
    )
);
GO

--Route table
CREATE TABLE [dbo].[Route] (
	[route_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) NOT NULL,
	[user_id] int NOT NULL,
    CONSTRAINT [pk_route_id] PRIMARY KEY CLUSTERED
    (
        [route_id] ASC
    ),
	CONSTRAINT [fk_route_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User]([user_id])
);
GO

--Route_Rating table

CREATE TABLE [dbo].[Route_Rating] (
	[user_id] int NOT NULL,
	[route_id] int NOT NULL,
	[rating] int NOT NULL,
	[comment] varchar(255),
	CONSTRAINT [pk_route_rating] PRIMARY KEY CLUSTERED
	(
		[user_id], [route_id] ASC
	),
	CONSTRAINT [fk_route_rating_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User]([user_id]),
	CONSTRAINT [fk_route_rating_route] FOREIGN KEY ([route_id]) REFERENCES [dbo].[Route]([route_id]),
);
GO

--Venue table

CREATE TABLE [dbo].[Venue](
	[venue_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(255) NOT NULL,
	[logo_link] varchar(8000),
	[entrance_fee] money NOT NULL,
	[location] geography NOT NULL,
	[phone_number] char(10) NOT NULL,
	CONSTRAINT [pk_venue_id] PRIMARY KEY CLUSTERED 
	(
		[venue_id] ASC
	)
)
GO

--Route_Stop

CREATE TABLE [dbo].[Route_Stop] (
	[venue_id] int NOT NULL,
    [route_id] int NOT NULL,
    [duration] int NULL,
    [stop_number] int NOT NULL,
    CONSTRAINT [pk_route_stop_id] PRIMARY KEY CLUSTERED
    (
        [route_id], [stop_number] ASC
    ),
	CONSTRAINT [fk_route_stop_venue] FOREIGN KEY ([venue_id]) REFERENCES [dbo].[Venue]([venue_id]),
	CONSTRAINT [fk_route_stop_route] FOREIGN KEY ([route_id]) REFERENCES [dbo].[Route]([route_id])
);
GO

--Type table

CREATE TABLE [dbo].[Type](
	[type_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(20) NOT NULL,
	CONSTRAINT [pk_type] PRIMARY KEY CLUSTERED 
	(
		[type_id] ASC
	)
);
GO

-- Drink table

CREATE TABLE [dbo].[Drink](
	[drink_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(60) NOT NULL,
	[type_id] int NOT NULL,
	CONSTRAINT [pk_drink] PRIMARY KEY CLUSTERED 
	(
		[drink_id] ASC
	),
	CONSTRAINT [fk_drink_type] FOREIGN KEY ([type_id]) REFERENCES [dbo].[Type] ([type_id])
);
GO


--Venue_Drink table

CREATE TABLE [dbo].[Venue_Drink](
	[drink_id] int NOT NULL,
	[venue_id] int NOT NULL,
	[price] money,
	[description] varchar(100),
	CONSTRAINT [pk_venue_drink] PRIMARY KEY CLUSTERED 
	(
		[drink_id], [venue_id] ASC
	),
	CONSTRAINT [fk_venue_drink_drink] FOREIGN KEY ([drink_id]) REFERENCES [dbo].[Drink] ([drink_id]),
	CONSTRAINT [fk_venue_drink_venue] FOREIGN KEY ([venue_id]) REFERENCES [dbo].[Venue] ([venue_id])
);
GO

--Tag table

CREATE TABLE [dbo].[Tag] (
	[tag_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) NOT NULL,
	CONSTRAINT [pk_tag] PRIMARY KEY CLUSTERED
	(
		[tag_id] ASC
	)
);
GO

--Venue_Tag table

CREATE TABLE [dbo].[Venue_Tag] (
	[tag_id] int NOT NULL,
	[venue_id] int NOT NULL,
	CONSTRAINT [pk_venue_tag] PRIMARY KEY CLUSTERED
	(
		[tag_id], [venue_id] ASC
	),
	CONSTRAINT [fk_venue_tag_tag] FOREIGN KEY ([tag_id]) REFERENCES [dbo].[Tag]([tag_id]),
	CONSTRAINT [fk_venue_tag_venue] FOREIGN KEY ([venue_id]) REFERENCES [dbo].[Venue]([venue_id])
);
GO