CREATE DATABASE EveningCoffee;
USE EveningCoffee;


--Create employee table
CREATE TABLE Employee (
	employee_id		INTEGER,
	first_name		VARCHAR(30),
	last_name		VARCHAR(30),
	hire_date		DATE,
	job_title		VARCHAR(30),
	shop_id			INTEGER,
	PRIMARY KEY(employee_id)
);

--Create Coffee Shop Table
CREATE TABLE Coffee_Shop(
	shop_id		INTEGER,
	shop_name	VARCHAR(50),
	city		VARCHAR(50),
	stateCode	CHAR(2),
	PRIMARY KEY(shop_id)
);

--Create Coffee Table
CREATE TABLE Coffee(
	coffee_id		INTEGER,
	shop_id			INTEGER,
	supplier_id		INTEGER,
	coffee_name		VARCHAR(30),
	price_per_pound	NUMERIC(5,2),
	PRIMARY KEY (coffee_id)
);

--Create Supplier Table
CREATE TABLE Supplier(
	supplier_id			INTEGER,
	company_name		VARCHAR(50),
	country				VARCHAR(30),
	sales_contact_name	VARCHAR(60),
	email				VARCHAR(50) NOT NULL,
	PRIMARY KEY(supplier_id)
	
);


--Populate Employee Table
INSERT INTO Employee VALUES ('3', 'Mike', 'McDon', '2021-02-03','Barrista','100');
INSERT INTO Employee VALUES ('2', 'Jennifer', 'Mactantosh', '2021-12-01','Driver','200');
INSERT INTO Employee VALUES ('1', 'Steven', 'Smith', '2019-05-08','Store Manager','300');

--Populate coffe shop table
INSERT INTO Coffee_Shop VALUES ('100','JauntCo', 'Sacramento', 'CA');
INSERT INTO Coffee_Shop VALUES ('200','Coffee Jaunt', 'Boulder', 'CO');
INSERT INTO Coffee_Shop VALUES ('300','Jaunting Bean', 'Reno', 'NV');

--Populate Coffee table
INSERT INTO Coffee VALUES ('1', '100', '2000', 'House Coffee', '112.25');
INSERT INTO Coffee VALUES ('2', '100', '1000', 'Guava Java', '200.62');
INSERT INTO Coffee VALUES ('3', '100', '3000', 'French Roast', '102.17');

--Populate Supplier Table
INSERT INTO Supplier VALUES ('1000', 'Java Farm', 'Brazil', 'April Ludgate', 'dontcarewhatever@javafarm.com');
INSERT INTO Supplier VALUES ('2000', 'Household Coffee Co.', 'France', 'Michael Scott', 'worldsbestboss@dunmiff.com');
INSERT INTO Supplier VALUES ('3000', 'American Homebrew', 'United States', 'Ron Swanson', 'dontrackme@aol.com');


--Add foreign keys
ALTER TABLE Coffee
	ADD FOREIGN KEY (shop_id) REFERENCES Coffee_Shop(shop_id);

ALTER TABLE Coffee
	ADD FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id);

ALTER TABLE Employee
	ADD FOREIGN KEY(shop_id) REFERENCES Coffee_Shop(shop_id);


--Create Index For coffee_name field
CREATE INDEX coffee_name_index ON Coffee  (coffee_name);


--Create concatonated view
SELECT CONCAT(first_name, ' ', last_name) 
AS employee_full_name, employee_id, hire_date, job_title shop_id 
FROM Employee;

SELECT coffee_name FROM Coffee WHERE price_per_pound < '200';



SELECT * FROM Employee
JOIN Coffee_Shop On Employee.shop_id = Coffee_Shop.shop_id
JOIN Coffee ON Coffee_Shop.shop_id = Coffee.shop_id;
