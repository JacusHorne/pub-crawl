USE master
IF EXISTS(select * from sys.databases where name='PubCrawl')
DROP DATABASE PubCrawl

CREATE DATABASE PubCrawl;
GO

USE PubCrawl;
GO

CREATE TABLE [dbo].[Venue](
	[venue_id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(255) NOT NULL,
	[logo] varchar(8000),
	[open_time] time NOT NULL,
	[close_time] time NOT NULL,
	[entrance_fee] money NOT NULL,
	[location] geography NOT NULL,
	[phone_number] char(10) NOT NULL,
	CONSTRAINT [pk_venue_id] PRIMARY KEY CLUSTERED 
	(
		[venue_id] ASC
	)
)
GO

INSERT INTO [dbo].[Venue] ([name], [logo], [open_time], [close_time], [entrance_fee], [location], [phone_number])
VALUES	('Milk and Honey Bar', 'https://milkhoneybar.co.za/wp-content/uploads/2018/07/mh_logo_400w.png', '12:00:00', '22:00:00', 0, geography::Point(-26.023714216056987, 28.01435819441324, 4326), '0114652394'),
		('Texan Wing Bar', 'https://www.texanwingbar.com/wp-content/uploads/2020/08/TWB-logo-Black.png', '12:00:00', '23:00:00', 0, geography::Point(-26.024367686413317, 28.013853419003674, 4326), '0104439150'),
		('Tiger''s Milk Cedar Square', 'https://tigersmilk.co.za/wp-content/uploads/2018/03/TM_logo.png', '11:00:00', '00:00:00', 0, geography::Point(-26.017105909898834, 28.000301413454874, 4326), '0102861030'),
		('Jozi Gin Bar Cedar', 'https://static.wixstatic.com/media/d799fb_9902658eb42d4449b1649f3767664cbf~mv2.png/v1/fill/w_252,h_103,al_c,q_85,usm_0.66_1.00_0.01/Screenshot%202020-02-26%20at%2010_41_22.webp', '12:00:00', '22:00:00', 0, geography::Point(-26.01636588366614, 27.999369340440904, 4326), '0100252913'),
		('Cubaña Fourways', 'https://www.cubana.co.za/wp-content/uploads/2020/12/Cubana-n-logo-455x1024.png', '12:00:00', '02:00:00', 0, geography::Point(-26.01614813326442, 27.99890172694808, 4326), '0114655790'),
		('Pedro Portia - Cigar & Champagne Lounge', 'http://pedroportia.co.za/wp-content/uploads/2021/08/pedro_portia-1024x657.png', '10:00:00', '22:00:00', 0, geography::Point(-26.017837786567195, 28.00096597667504, 4326), '0823900666'),
		('LAPA Pub Fourways', '', '11:00:00', '00:00:00', 0, geography::Point(-26.00828210628116, 28.00311715338788, 4326), '0110804110'),
		('Social On Main - Bryanston', 'http://socialonmain.co.za/wp-content/uploads/2014/07/som-logo.png', '12:00:00', '23:00:00', 0, geography::Point(-26.05249783228487, 28.02301418277045, 4326), '0766095585'),
		('Cotton Lounge', 'https://static.wixstatic.com/media/0c71e7_3caecef2e6bf4a2c92ef99e2b13210d6~mv2.jpeg/v1/fit/w_2500,h_1330,al_c/0c71e7_3caecef2e6bf4a2c92ef99e2b13210d6~mv2.jpeg', '13:00:00', '00:00:00', 0, geography::Point(-26.05303183928961, 28.023060004575854, 4326), '0114634040'),
		('Rockets Bryanston', 'https://www.rocketslife.tv/wp-content/uploads/2017/08/rockets_logow.png', '11:00:00', '21:30:00', 0, geography::Point(-26.062671102081108, 28.025791834347267, 4326), '0877272777'),
		('Hogshead Douglasdale', 'https://www.hogshead.co.za/images/douglasdale.png', '11:00:00', '02:00:00', 0, geography::Point(-26.039726389993135, 27.99434395578405, 4326), '0117044175'),
		('The Taphouse', '', '10:00:00', '23:00:00', 0, geography::Point(-26.142657995633964, 28.016621455786105, 4326), '0634336650'),
		('The Jolly Roger Parkhurst', 'http://jollyroger.co.za/wp-content/uploads/2020/09/Jolly-Roger-Logo.png', '06:00:00', '22:00:00', 0, geography::Point(-26.142412670089602, 28.016888267429515, 4326), '0114423954'),
		('Hudsons - The Burger Joint (Parkhurst)', 'https://theburgerjoint.co.za/wp-content/uploads/2015/09/logo-company.png', '12:00:00', '23:30:00', 0, geography::Point(-26.137731900303034, 28.01862545708941, 4326), '0112680713'),
		('La Parada Parkhurst', 'https://media-cdn.tripadvisor.com/media/photo-s/1b/25/1f/2b/img.jpg', '11:00:00', '23:00:00', 0, geography::Point(-26.137717665043294, 28.01792508462156, 4326), '0100356894'),
		('The Station Parkhurst', 'https://thestation.joburg/wp-content/uploads/2020/10/The-Station-Parkhurst_Logo.png', '11:00:00', '23:00:00', 0, geography::Point(-26.140024037110365, 28.01759655763556, 4326), '0878084793'),
		('Hogshead Illovo', 'https://www.hogshead.co.za/images/illovo.png', '11:00:00', '02:00:00', 0, geography::Point(-26.130461538032268, 28.04962319811458, 4326), '0112680871'),
		('86 Public Illovo', 'https://86public.co.za/wp-content/uploads/2018/05/86Public_Homepagelogo_Alternative_150x260_White.png', '10:00:00', '22:00:00', 0, geography::Point(-26.13023414714662, 28.049502669278798, 4326), '0681094904'),
		('Babylon The Joburg Bar', 'https://babylonbar.co.za/wp-content/uploads/2020/11/x-1024x314-1.png', '18:00:00', '06:00:00', 150, geography::Point(-26.130435567059255, 28.049529696265008, 4326), '0725094994'),
		('Beefcakes Johannesburg', 'https://uploads-ssl.webflow.com/5feb811cab0dff4f5e5be52b/62023da222530d015b3ffdde_18.png', '17:00:00', '00:00:00', 300, geography::Point(-26.130367699244747, 28.049872626950187, 4326), '0114475266'),
		('News Cafe Rivonia', 'https://static.wixstatic.com/media/e2e80a_1eda1370612946c2bb753021dd6aed69~mv2.png/v1/fill/w_246,h_82,al_c,q_85,usm_0.66_1.00_0.01/logo-white.webp', '07:00:00', '23:00:00', 0, geography::Point(-26.057496494421212, 28.060497455784404, 4326), '0112340164'),
		('Monkeybluz Restaurant and Cocktail Bar', 'https://gorhino.co.za/wp-content/uploads/2015/01/Monkeybluz-Logo.png', '10:00:00', '02:00:00', 0, geography::Point(-26.051990802459645, 28.059990844140895, 4326), '0787144351'),
		('Hubbly Lounge Egyptian Latino', '', '10:00:00', '02:00:00', 0, geography::Point(-26.055979607378784, 28.060965285923434, 4326), '0105952325'),
		('The Beach Rivonia', 'https://i0.wp.com/www.thebeachrivonia.co.za/wp-content/uploads/2020/09/cropped-Untitled-design1-8.png?fit=500%2C349&ssl=1', '13:00:00', '02:00:00', 0, geography::Point(-26.055715461270513, 28.061177540441854, 4326), '0832722107'),
		('Madison Avenue Rivonia', '', '20:00:00', '03:00:00', 100, geography::Point(-26.055804176677324, 28.061158082770365, 4326), '0828892386')
GO

-- STDistance
/* SELECT [name], geography::Point(-26.130461538032268, 28.04962319811458, 4326) AS [Texan], [location].STDistance(geography::Point(-26.130461538032268, 28.04962319811458, 4326)) AS [Meters]
FROM [dbo].[Venue];
*/