/**
* Ellie Parobek
* ISTE230-01
* HW 7
*/

CREATE DATABASE parobek_ACMEOnline;

USE parobek_ACMEOnline;

# Part 1

CREATE TABLE category(
	Category_Name VARCHAR(35),
	ShippingPerPound DECIMAL(4, 2),
	OffersAllowed ENUM('Y', 'N'),
	PRIMARY KEY (Category_Name)
);

CREATE TABLE item(
	Item_Number INT UNSIGNED AUTO_INCREMENT,
	Item_Name VARCHAR(35) NOT NULL,
	Description VARCHAR(255),
	Model VARCHAR(50) NOT NULL, 
	Price DECIMAL(8, 2) NOT NULL,
	Category_Name VARCHAR(35),
	PRIMARY KEY (Item_Number),
	FOREIGN KEY (Category_Name) REFERENCES category(Category_Name)
);

CREATE TABLE offer(
	OfferCode VARCHAR(15),
	Discount_Amt VARCHAR(35) NOT NULL,
	MinAmount DECIMAL(4, 2),
	ExpirationDate DATE,
	PRIMARY KEY (OfferCode)
);

CREATE TABLE customer(
	CustomerID INT UNSIGNED AUTO_INCREMENT,
	CustomerName VARCHAR(50) NOT NULL,
	Address VARCHAR(150) NOT NULL,
	Email VARCHAR(80),
	IsBusiness TINYINT(1) NOT NULL DEFAULT 0,
	IsHome TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (CustomerID)
);

CREATE TABLE ordered(
	OrderID INT UNSIGNED AUTO_INCREMENT,
	Total_Cost DECIMAL (10, 2),
	CustomerID INT UNSIGNED,
	OfferCode VARCHAR(15),
	PRIMARY KEY (OrderID),
	FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
	FOREIGN KEY (OfferCode) REFERENCES offer(OfferCode)
);

CREATE TABLE line_item(
	Item_Number INT UNSIGNED,
	OrderID INT UNSIGNED,
	Quantity VARCHAR(255),
	Shipping_Amount DECIMAL(6, 2),
	PRIMARY KEY (Item_Number, OrderID),
	FOREIGN KEY (Item_Number) REFERENCES item(Item_Number),
	FOREIGN KEY (OrderID) REFERENCES ordered(OrderID)
);

CREATE TABLE business(
	CustomerID INT UNSIGNED,
	PaymentTerms VARCHAR(50) NOT NULL,
	PRIMARY KEY (CustomerID),
	FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)	
);

CREATE TABLE home(
	CustomerID INT UNSIGNED,
	CreditCardNum CHAR(16) NOT NULL,
	CardExpirationDate CHAR(6) NOT NULL,
	PRIMARY KEY (CustomerID),
	FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)	
);

CREATE TABLE purchase_contact(
	ContactName VARCHAR(50),
	CustomerID INT UNSIGNED,
	ContactPhone CHAR(12) NOT NULL,
	PRIMARY KEY (ContactName, CustomerID),
	FOREIGN KEY (CustomerID) REFERENCES business(CustomerID)	
);

CREATE TABLE guarantee(
	OrderID INT UNSIGNED,
	CustomerID INT UNSIGNED,
	URL VARCHAR(50),
	RefundAmount DECIMAL(12, 2),
	PRIMARY KEY (OrderID, CustomerID),
	FOREIGN KEY (OrderID) REFERENCES ordered(OrderID),
	FOREIGN KEY (CustomerID) REFERENCES home(CustomerID)	
);

# Part 2 

# Insert Categories
INSERT INTO category
VALUES ('Books', '0.99', 'Y');

INSERT INTO category
VALUES ('Home', '1.99', 'Y');

INSERT INTO category
VALUES ('Jewelry', '0.99', 'N');

INSERT INTO category
VALUES ('Toys', '0.99', 'Y');

# Insert Items
INSERT INTO item(Item_Name, Description, Model, Price, Category_Name)
VALUES ('Cabbage Patch Doll', 'Baby boy doll', 'Boy', '39.95', 'Toys');

INSERT INTO item(Item_Name, Description, Model, Price, Category_Name)
VALUES ('The Last Lecture', 'Writeen by Randy Pausch', 'Hardcover', '9.95', 'Books');

INSERT INTO item(Item_Name, Description, Model, Price, Category_Name)
VALUES ('Keurig Beverage Maker', 'Keurig Platinum Edition Beverage Maker in Red', 'Platinum Edition', '299.95', 'Home');

INSERT INTO item(Item_Name, Description, Model, Price, Category_Name)
VALUES ('lct diamond rng in white gold', 'diamond is certified vvs, D, round', '64gt32', '4000.00', 'Jewelry');

#Insert Offers
INSERT INTO offer
VALUES ('345743213', '20% off', '20.00', '2013-12-31');

INSERT INTO offer
VALUES ('4567890123', '30% off', '30.00', '2013-12-31');

# Part 3

# Customer Janine Jeffers
START TRANSACTION;

INSERT INTO customer(CustomerID, CustomerName, Address, Email, IsHome)
VALUES ('1', 'Janine Jeffers', '152 Lomb Memorial Dr., Rochester, NY  14623', 'jxj1234@rit.edu', '1');

INSERT INTO home(CustomerID, CreditCardNum, CardExpirationDate)
VALUES ('1', '1234567890123456', '012014');

INSERT INTO ordered(Total_Cost, OfferCode)
VALUES ('00004919.75', '4567890123');

INSERT INTO line_item
VALUES ('4', '1', '1', '0.99');

INSERT INTO line_item
VALUES ('2', '1', '2', '3.99');

INSERT INTO line_item(Item_Number, OrderID, Quantity)
VALUES ('3', '1', '3');

COMMIT;

# Customer Joey John Barber Shop
START TRANSACTION;

INSERT INTO customer(CustomerID, CustomerName, Address, Email, IsBusiness)
VALUES ('2', 'Joey John Barber Shop', '15 John St., Rochester, NY 14623', ' jj1978@hotmail.com', '1');

INSERT INTO business(CustomerID, PaymentTerms)
VALUES ('2', '30/90 days');

INSERT INTO ordered(CustomerID, Total_Cost, OfferCode)
VALUES ('2', '00000299.95', '345743212');

INSERT INTO line_item(Item_Number, OrderID, Quantity)
VALUES ('3', '2', '1');

INSERT INTO purchase_contact(CustomerID, ContactName, ContactPhone)
VALUES('2', 'Joey James', '585-475-1234');

COMMIT;