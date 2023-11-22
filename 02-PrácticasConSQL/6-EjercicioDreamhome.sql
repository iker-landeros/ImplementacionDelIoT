-- Iker Landeros | A01423214 | 06/10/23

-- DROP DATABASE dreamhome;

-- CREATE DATABASE dreamhome;
USE dreamhome;


-- Tablas independientes:
CREATE TABLE branch(
	branchNo VARCHAR(4),
    street VARCHAR(20),
    city VARCHAR(15),
    postcode VARCHAR(10),
    PRIMARY KEY(branchNo)
);

CREATE TABLE client(
	clientNo VARCHAR(4),
    fName VARCHAR(15),
    lName VARCHAR(15),
    telNo VARCHAR(15),
    prefType VARCHAR(8),
    maxRent INT,
    email VARCHAR(50),
    PRIMARY KEY(clientNo)
);

CREATE TABLE privateOwner(
	ownerNo VARCHAR(4),
    fName VARCHAR(15),
    lName VARCHAR(15),
    adress VARCHAR(50),
    telNo VARCHAR(15),
    email VARCHAR(50),
    password VARCHAR(25),
    PRIMARY KEY(ownerNo)
);


-- A partir de aquí, las tablas que dependen de otras
CREATE TABLE staff(
	staffNo VARCHAR(4),
    fName VARCHAR(15),
    lName VARCHAR(15),
    position VARCHAR(15),
    sex VARCHAR(1),
    dob DATE,
    salary INT,
    branchNo VARCHAR(4),
    PRIMARY KEY(staffNo),
    CONSTRAINT fk_branch_staff1
		FOREIGN KEY (branchNo) REFERENCES branch(branchNo)
);

CREATE TABLE propertyForRent(
	propertyNo VARCHAR(4),
    street VARCHAR(20),
    city VARCHAR(15),
    postcode VARCHAR(10),
    type VARCHAR(8),
    rooms INT,
    rent INT,
    ownerNo VARCHAR(4),
    staffNo VARCHAR(4),
    branchNo VARCHAR(4),
    PRIMARY KEY(propertyNo),
    CONSTRAINT fk_privateOwner_propertyForRent1
		FOREIGN KEY (ownerNo) REFERENCES privateOwner(ownerNo),
	CONSTRAINT fk_branch_propertyForRent1
		FOREIGN KEY (branchNo) REFERENCES branch(branchNo),
	CONSTRAINT fk_staff_propertyForRent1
		FOREIGN KEY (staffNo) REFERENCES staff(staffNo)
);

-- Cuando las tablas tienen como primary key varias tablas

CREATE TABLE viewing(
	clientNo VARCHAR(4),
    propertyNo VARCHAR(4),
    viewDate DATE,
    comment VARCHAR(100),
    PRIMARY KEY (clientNo, propertyNo, viewDate),
    CONSTRAINT fk_client_viewing1
		FOREIGN KEY (clientNo) REFERENCES client(clientNo),
	CONSTRAINT fk_propertyForRent_viewing1
		FOREIGN KEY (propertyNo) REFERENCES propertyForRent(propertyNo)    
);

CREATE TABLE registration(
	clientNo VARCHAR(4),
    branchNo VARCHAR(4),
    staffNo VARCHAR(4),
    dateJoined DATE,
    PRIMARY KEY (clientNo, branchNo),
    CONSTRAINT fk_client_registration1
		FOREIGN KEY (clientNo) REFERENCES client(clientNo),
	CONSTRAINT fk_branch_registration1
		FOREIGN KEY (branchNo) REFERENCES branch(branchNo),
	CONSTRAINT fk_staff_registration1
		FOREIGN KEY (staffNo) REFERENCES staff(staffNo)
);


-- INSERT, formato:
-- INSERT INTO nombreDeLaTabla(columnas) VALUES(valores);

INSERT INTO branch(branchNo, street, city, postcode)
VALUES("B005", "22 Deer Rd", "London", "SW1 4EH"),
	  ("B007", "16 Argyll St", "Aberdeen", "AB2 3SU"),
	  ("B003", "163 Main St", "Glasgow", "G11 9QX"),
	  ("B004", "32 Manse Rd", "Bristol", "BS99 1NZ"),
	  ("B002", "56 Clover Dr", "London", "NW10 6EU");
														
INSERT INTO staff(staffNo, fName, lName, position, sex, dob, salary, branchNo)
VALUES("SL21", "John", "White", "Manager", "M", "1945-10-01", 30000, "B005"),
	  ("SG37", "Ann", "Beech", "Assistant", "F", "1960-11-10", 12000, "B003"),
      ("SG14", "David", "Ford", "Supervisor", "M", "1958-03-24", 18000, "B003"),
      ("SA9", "Mary", "Howe", "Assistant", "F", "1970-02-19", 9000, "B007"),
      ("SG5", "Susan", "Brand", "Manager", "F", "1940-06-03", 24000, "B003"),
      ("SL41", "Julie", "Lee", "Assistant", "F", "1965-06-13", 9000, "B005");
      
INSERT INTO privateOwner(ownerNo, fName, lName, adress, telNo, email, password)
VALUES("CO46", "Joe", "Keogh", "2 Fergus Dr, Aberdeen AB2 7SX", "01224-861212", "jkeogh@lhh.com", "********"),
	  ("CO87", "Carol", "Farrel", "6 Achray St, Glasgow G32 9DX", "0141-357-7419", "cfarrel@gmail.com", "********"),
      ("CO40", "Tina", "Murphy", "63 Well St, Glasgow G42", "0141-943-1728", "tinam@hotmail.com", "********"),
      ("CO93", "Tony", "Shaw", "12 Park Pl, Glasgow G4 0QR", "0141-225-7025", "tony.shaw@ark.com", "********");
      
INSERT INTO propertyForRent(propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
VALUES("PA14", "16 Holhead", "Aberdeen", "AB7 5SU", "House", 6, 650, "CO46", "SA9", "B007"),
	  ("PL94", "6 Argyll St", "London", "NW2", "Flat", 4, 400, "CO87", "SL41", "B005"),
      ("PG4", "6 Lawrence St", "Glasgow", "G11 9QX", "Flat", 3, 350, "CO40", null, "B003"),
      ("PG36", "2 Manor Rd", "Glasgow", "G32 4QX", "Flat", 3, 375, "CO93", "SG37", "B003"),
      ("PG21", "18 Dale Rd", "Glasgow", "G12", "House", 5, 600, "CO87", "SG37", "B003"),
      ("PG16", "5 Novar Dr", "Glasgow", "G12 9AX", "Flat", 4, 450, "CO93", "SG14", "B003");
      
INSERT INTO client(clientNo, fName, lName, telNo, prefType, maxRent, email)
VALUES("CR76", "John", "Kay", "0207-774-5632", "Flat", 425, "john.kay@gmail.com"),
	  ("CR56", "Aline", "Stewart", "0141-848-1825", "Flat", 350, "astewart@hotmail.com"),
      ("CR74", "Mike", "Ritchie", "01475-392178", "House", 750, "mritchie01@yahoo.co.uk"),
      ("CR62", "Mary", "Tregear", "01224-196720", "Flat", 600, "maryt@hotmail.co.uk");

INSERT INTO viewing(clientNo, propertyNo, viewDate, comment)
VALUES("CR56", "PA14", "2013-05-24", "too small"),
	  ("CR76", "PG4", "2013-04-20", "too remote"),
      ("CR56", "PG4", "2013-05-26", null),
      ("CR62", "PA14", "2013-05-14", "no dining room"),
      ("CR56", "PG36", "2013-04-28", null);

INSERT INTO registration(clientNo, branchNo, staffNo, dateJoined)
VALUES("CR76", "B005", "SL41", "2013-01-02"),
	  ("CR56", "B003", "SG37", "2012-03-11"),
      ("CR74", "B003", "SG37", "2011-11-16"),
      ("CR62", "B007", "SA9", "2012-03-12");


-- Función SELECT
-- Formato:
-- SELECT columnas FROM tabla;
USE dreamhome;
SELECT * FROM staff;
SELECT * FROM branch;
SELECT * FROM client;
SELECT * FROM privateOwner;
SELECT * FROM propertyForRent;
SELECT * FROM viewing;
SELECT * FROM registration;


