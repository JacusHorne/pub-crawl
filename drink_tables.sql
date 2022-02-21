USE master
IF EXISTS(select * from sys.databases where name='PubCrawl')
DROP DATABASE PubCrawl

CREATE DATABASE PubCrawl;
GO

USE PubCrawl;
GO

CREATE TABLE [dbo].[Drink_Type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	CONSTRAINT [pk_drink_type] PRIMARY KEY CLUSTERED 
	(
		[type_id] ASC
	)
);
GO

CREATE TABLE [dbo].[Drink](
	[drink_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[type_id] [int] NOT NULL,
	CONSTRAINT [pk_drink] PRIMARY KEY CLUSTERED 
	(
		[drink_id] ASC
	),
	CONSTRAINT [fk_drink_drink_type] FOREIGN KEY ([type_id]) REFERENCES [dbo].[Drink_Type] ([type_id])
);
GO

CREATE TABLE [dbo].[Venue_Drink](
	[drink_id] [int] NOT NULL,
	[venue_id] [int] NOT NULL,
	[price] [money],
	[description] [varchar](100),
	CONSTRAINT [pk_venue_drink] PRIMARY KEY CLUSTERED 
	(
		[drink_id], [venue_id] ASC
	),
	CONSTRAINT [fk_venue_drink_drink] FOREIGN KEY (drink_id) REFERENCES [dbo].[Drink] ([drink_id])
);
GO

INSERT INTO [dbo].[Drink_Type] ([name])
VALUES ('Whiskey'), ('Wine'), ('Beer'), ('Cocktail'), ('Gin'), ('Brandy'), ('Rum'), ('Tequila'), ('Vodka'), ('Cider');
GO

INSERT INTO [dbo].[Drink] ([name], [type_id])
VALUES
	('Johnnie Walker Blue Label', 1),
	('Dominus Estate Napa Valley', 2),
	('Carling Black Label', 3),
	('Mojito', 4),
	('Gordon''s London Dry', 5),
	('Klipdrift Premium', 6),
	('Captain Morgan Spiced Gold', 7),
	('Cactus Jack', 8),
	('Skyy', 9),
	('Hunters Dry', 10);
GO