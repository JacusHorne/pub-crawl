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

--DROP FOREIGN KEYS

IF OBJECT_ID('fk_route_user', 'F') IS NOT NULL
ALTER TABLE [Route] DROP CONSTRAINT [fk_route_user]
GO

IF OBJECT_ID('fk_route_rating_user', 'F') IS NOT NULL
ALTER TABLE [Route_Rating] DROP CONSTRAINT [fk_route_rating_user]
GO

IF OBJECT_ID('fk_route_rating_route', 'F') IS NOT NULL
ALTER TABLE [Route_Rating] DROP CONSTRAINT [fk_route_rating_route]
GO

IF OBJECT_ID('fk_route_stop_venue', 'F') IS NOT NULL
ALTER TABLE [Route_Stop] DROP CONSTRAINT [fk_route_stop_venue]
GO

IF OBJECT_ID('fk_route_stop_route', 'F') IS NOT NULL
ALTER TABLE [Route_Stop] DROP CONSTRAINT [fk_route_stop_route]
GO

IF OBJECT_ID('fk_drink_type', 'F') IS NOT NULL
ALTER TABLE [Drink] DROP CONSTRAINT [fk_drink_type]
GO

IF OBJECT_ID('fk_venue_drink_drink', 'F') IS NOT NULL
ALTER TABLE [Venue_Drink] DROP CONSTRAINT [fk_venue_drink_drink]
GO

IF OBJECT_ID('fk_venue_drink_venue', 'F') IS NOT NULL
ALTER TABLE [Venue_Drink] DROP CONSTRAINT [fk_venue_drink_venue]
GO

IF OBJECT_ID('fk_venue_tag_tag', 'F') IS NOT NULL
ALTER TABLE [Venue_Tag] DROP CONSTRAINT [fk_venue_tag_tag]
GO

IF OBJECT_ID('fk_venue_tag_venue', 'F') IS NOT NULL
ALTER TABLE [Venue_Tag] DROP CONSTRAINT [fk_venue_tag_venue]
GO

--User table
IF OBJECT_ID('User', 'U') IS NOT NULL
DROP TABLE [dbo].[User]
GO

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
IF OBJECT_ID('Route', 'U') IS NOT NULL
DROP TABLE [dbo].[Route]
GO

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
IF OBJECT_ID('Route_Rating', 'U') IS NOT NULL
DROP TABLE [dbo].[Route_Rating]
GO

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
IF OBJECT_ID('Venue', 'U') IS NOT NULL
DROP TABLE [dbo].[Venue]
GO

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
IF OBJECT_ID('Route_Stop', 'U') IS NOT NULL
DROP TABLE [dbo].[Route_Stop]
GO

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
IF OBJECT_ID('Type', 'U') IS NOT NULL
DROP TABLE [dbo].[Type]
GO

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
IF OBJECT_ID('Drink', 'U') IS NOT NULL
DROP TABLE [dbo].[Drink]
GO

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
IF OBJECT_ID('Venue_Drink', 'U') IS NOT NULL
DROP TABLE [dbo].[Venue_Drink]
GO

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
IF OBJECT_ID('Tag', 'U') IS NOT NULL
DROP TABLE [dbo].[Tag]
GO

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
IF OBJECT_ID('Venue_Tag', 'U') IS NOT NULL
DROP TABLE [dbo].[Venue_Tag]
GO

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