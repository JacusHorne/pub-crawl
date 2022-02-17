USE master;  
GO  
CREATE DATABASE PubCrawl  
ON   
( NAME = pubcrawl_dat,  
    FILENAME = 'C:\tmp\pubcrawl\DATA\pubcrawl.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = pubcrawl_log,  
    FILENAME = 'C:\tmp\pubcrawl\DATA\pubcrawl.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB ) ;  
GO

USE PubCrawl;
GO

CREATE TABLE users (
	user_id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL
);