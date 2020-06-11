#task 1
CREATE DATABASE IF NOT EXISTS warehouse;

Use warehouse;

CREATE TABLE warehouse (
	warehouseNumber VARCHAR(25) NOT NULL,
    warehouseName TEXT NOT NULL,
    streetNumber INT NOT NULL,
    streetName TEXT NOT NULL,
    city ENUM('Brisbane', 'Sydney', 'Melbourne') NOT NULL, #warehouses only located in these cities
    suburb TEXT NOT NULL,
    #assuming there's also a restriction on states considering constraint on cities
    state ENUM('QLD', 'NSW', 'VIC'), 
    postcode INT(4) NOT NULL,
    warehouseHeadName TEXT NOT NULL,
    numberEmployees INT DEFAULT 1, #default number of employees
    PRIMARY KEY (warehouseNumber),
    UNIQUE(warehouseNumber)
);

CREATE TABLE publisher (
	publisherCode VARCHAR(25) NOT NULL, 
    publisherName TEXT NOT NULL,
    #assuming publishers location don't have the same restriction as the warehouses
    publisherCity ENUM('Brisbane', 'Sydney', 'Melbourne', 'Darwin', 'Perth', 'Adelaide', 'Canberra', 'Hobart') NOT NULL,
    #assuming mandatory in order to contact publishers
    publisherEmail VARCHAR(50) NOT NULL, 
    PRIMARY KEY (publisherCode),
    UNIQUE (publisherCode, publisherEmail)
);

CREATE TABLE author (
	authorNumber VARCHAR(15) NOT NULL, 
    authorName TEXT NOT NULL,
    #assuming mandatory in order to contact authors
    authorEmail VARCHAR(50) NOT NULL,
    PRIMARY KEY (authorNumber),
    UNIQUE (authorNumber, authorEmail)
);

CREATE TABLE item (
	itemCode CHAR(10) NOT NULL, #combination of 10 letters and numbers
	itemTitle TEXT NOT NULL,
	publisherCode VARCHAR(10) NOT NULL,
    itemType ENUM ('paperback', 'eBook', 'other') NOT NULL,
    #assuming all items have a price
    stockPrice DECIMAL(3, 2) NOT NULL, 
    ISBN CHAR(13) NOT NULL, #13 characters
    PRIMARY KEY (itemCode),
    UNIQUE (itemCode, publisherCode, ISBN),
    FOREIGN KEY (publisherCode) REFERENCES publisher (publisherCode)
);

CREATE TABLE itemWriters (
	itemCode CHAR(10) NOT NULL, #same itemCode as in items table
    authorNumber VARCHAR(15) NOT NULL,
    #assuming referencing placeholder for author contribution - default placeholder would be 1
    writerSeqNum INT DEFAULT 1, 
    PRIMARY KEY (itemCode, authorNumber),
    UNIQUE (itemCode, authorNumber),
    FOREIGN KEY (itemCode) REFERENCES item (itemCode),
    FOREIGN KEY (authorNumber) REFERENCES author (authorNumber)
);

CREATE TABLE inventory (
	itemCode VARCHAR(10) NOT NULL,
    warehouseNumber VARCHAR(5) NOT NULL,
     #assuming this is referring to stock available
    unitsOnHand INT NOT NULL,
    PRIMARY KEY (itemCode, warehouseNumber),
    UNIQUE (itemCode, warehouseNumber),
    FOREIGN KEY (warehouseNumber) REFERENCES warehouse (warehouseNumber)
);
    
    