SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;


DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS ServicesCategories;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS ServicesCities;
DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS OngoingOpps;


CREATE TABLE Services (
	serviceID INTEGER AUTO_INCREMENT,
	name VARCHAR(60),
	description LONGTEXT,
	websiteURL VARCHAR(150),
	donateURL VARCHAR(150),
	getServicesURL VARCHAR(150),
	PRIMARY KEY (serviceID)
);


CREATE TABLE Categories (
	categoryID INTEGER AUTO_INCREMENT,
	categoryName VARCHAR(60),
	PRIMARY KEY (categoryID)
);

CREATE TABLE Cities (
	cityID INTEGER AUTO_INCREMENT,
	cityName VARCHAR(60),
	PRIMARY KEY (cityID)
);

CREATE TABLE ServicesCities (
	serviceID INTEGER NOT NULL,
	cityID INTEGER NOT NULL,
	PRIMARY KEY (serviceID, cityID),
	FOREIGN KEY (serviceID) 
		REFERENCES Services(serviceID)
		ON DELETE CASCADE,	
	FOREIGN KEY (cityID) 
		REFERENCES Cities(cityID) 
		ON DELETE CASCADE
);

CREATE TABLE ServicesCategories (
	serviceID INTEGER NOT NULL,
	categoryID INTEGER NOT NULL,
	PRIMARY KEY (serviceID, categoryID),
	FOREIGN KEY (serviceID) 
		REFERENCES Services(serviceID) 
		ON DELETE CASCADE,
	FOREIGN KEY (categoryID) 
		REFERENCES Categories(categoryID) 
		ON DELETE CASCADE
);

CREATE TABLE Events (
	eventID INTEGER AUTO_INCREMENT,
	name VARCHAR(60),
	description LONGTEXT,
	eventDate DATE,
	city VARCHAR(50),
	categoryID INTEGER,
	serviceID INTEGER,
	applyURL VARCHAR(150),
	cityID INTEGER,
	PRIMARY KEY (eventID),
	FOREIGN KEY (serviceID)
		REFERENCES Services(serviceID) 
		ON DELETE SET NULL,
	FOREIGN KEY (categoryID) 
		REFERENCES Categories(categoryID) 
		ON DELETE SET NULL,
	FOREIGN KEY (cityID)
		REFERENCES Cities(cityID)
		ON DELETE SET NULL
);


CREATE TABLE OngoingOpps (
	opportunityID INTEGER AUTO_INCREMENT,
	name VARCHAR(60),
	serviceID INTEGER,
	description LONGTEXT,
	applyURL VARCHAR(150),
	displayUntil DATE,
	imageURL VARCHAR(150),
	categoryID INTEGER,
	cityID INTEGER,
	PRIMARY KEY (opportunityID),
	FOREIGN KEY (serviceID)
		REFERENCES Services(serviceID)
		ON DELETE SET NULL,
	FOREIGN KEY (categoryID)
		REFERENCES Categories(categoryID)
		ON DELETE SET NULL,
	FOREIGN KEY (cityID)
		REFERENCES Cities(cityID)
		ON DELETE SET NULL
);

-- SAMPLE DATA:

INSERT INTO Services (name, description, websiteURL, donateURL, getServicesURL)
VALUES ("Housing Works", 
	"Housing Works is the local housing authority for Deschutes, Crook and Jefferson counties. We provide affordable housing, rental assistance and new beginnings for low-and moderate-income Central Oregonians",
	"https://housing-works.org/",
	NULL,
	"https://housing-works.org/find-housing-2/")
;

INSERT INTO Cities (cityName)
VALUES ("Bend"),
		("Sisters"),
		("La Pine"),
		("Redmond"),
		("Madras"),
		("Prineville")






SET FOREIGN_KEY_CHECKS = 1;
COMMIT;


