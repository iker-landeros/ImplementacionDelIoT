-- Iker Landeros | A01423214 | 03/11/23

-- DROP DATABASE empleados;

-- CREATE DATABASE empleados;
USE empleados;


-- Tablas independientes:
CREATE TABLE employee(
	eID INT,
    eLast VARCHAR(7),
    eFirst VARCHAR(8),
    eTitle VARCHAR(30),
    eSalary INT,
    PRIMARY KEY(eID)
);

CREATE TABLE trainingCourse(
	cID VARCHAR(4),
    cTitle VARCHAR(30),
    cHours INT,
    areaID VARCHAR(2),
    PRIMARY KEY(cID)
);

CREATE TABLE technologyArea(
	aID VARCHAR(2),
    aTitle VARCHAR(30),
    aURL VARCHAR(70),
    leadID INT,
    PRIMARY KEY(aID)
);

-- Esta tabla tiene como primary key varias columnas de tablas distintas

CREATE TABLE takes(
	eID INT,
    cID VARCHAR(4),
    tYear INT,
    tMonth INT,
    tDay INT,
    PRIMARY KEY (eID,cID),
    CONSTRAINT fk_employee_takes1
		FOREIGN KEY (eID) REFERENCES employee(eID),
	CONSTRAINT fk_trainingCourse_takes1
		FOREIGN KEY (cID) REFERENCES trainingCourse(cID)    
);

-- INSERT, formato:
-- INSERT INTO nombreDeLaTabla(columnas) VALUES(valores);

INSERT INTO employee(eID, eLast, eFirst, eTitle,eSalary)
VALUES(111, "Last111", "First111", "Database Administrator", 751119),
	  (222, "Last222", "First222", "Software Engineer", 51722),
	  (321, "Last321", "First321", "Database Administrator", 68321),
	  (333, "Last333", "First333", "Sr Software Engineer", 60333),
	  (345, "Last345", "First345", "Sr Software Engineer", 59345),
	  (369, "Last369", "First369", "Software Engineer", 36369),
	  (444, "Last444", "First444", "Software Engineer", 44444),
	  (456, "Last456", "First456", "Software Engineer", 45456),
	  (555, "Last555", "First555", "Sr Software Engineer", 55555),
	  (654, "Last654", "First564", "Coach", 60654),
	  (666, "Last666", "First666", "Coach", 66666),
	  (678, "Last678", "First678", "Coach", 67678),
	  (693, "Last693", "First693", "Coach", 69693),
	  (777, "Last777", "First777", "Database Administrator", 77777),
	  (789, "Last789", "First789", "Database Administrator", 78789),
	  (888, "Last888", "First888", "Database Administrator", 88888),
	  (963, "Last963", "First963", "Manager", 98963),
	  (987, "Last987", "First987", "Manager", 99987),
	  (999, "Last999", "First999", "Manager",100999);
														
INSERT INTO trainingCourse(cID, cTitle, cHours, areaID)
VALUES("DB01", "Microsoft Access", 8, "DB"),
	  ("DB02", "Query Languages", 16, "DB"),
      ("DB03", "Database Modeling", 8, "DB"),
      ("DB04", "Transactions", 8, "DB"),
      ("JA01", "Introduction to Java", 8, "JA"),
      ("JA02", "JavaBeans", 16, "JA"),
      ("JA03", "Enterprise JavaBeans", 32, "JA"),
      ("JA04", "JDBC", 8, "JA"),
      ("SE01", "Patterns", 16, "SE"),
      ("SE02", "Validation & Verification", 32, "SE"),
      ("SE03", "Software Components", 40, "SE"),
      ("WW01", "Dynamic HTML", 8, "WW"),
      ("WW02", "XML", 16, "WW"),
      ("WW03", "XSLT", 24, "WW");
      
INSERT INTO technologyArea(aID, aTitle, aURL, leadID)
VALUES("DB", "Database", "http://www.company.intranet/technology/db", 321),
	  ("JA", "Java", "http://www.company.intranet/technology/java", 333),
      ("SE", "Software Engineering", "http://www.company.intranet/technology/software-engineering", 345),
      ("WW", "Web", "http://www.company.intranet/technology/web", 369);

INSERT INTO takes(eID, cID, tYear, tMonth, tDay)
VALUES(321, "JA01", 2000, 7, 24),
	  (333, "JA04", 2000, 7, 27),
      (333, "SE01", 2000, 6, 1),
      (345, "SE01", 2000, 6, 1),
      (345, "SE02", 2000, 6, 2),
	  (345, "WW01", 2000, 8, 1),
      (369, "JA04", 2000, 7, 27),
      (369, "WW01", 2000, 8, 1),
      (369, "WW02", 2000, 8, 2),
      (369, "WW03", 2000, 8, 3),
      (444, "DB01", 2000, 5, 1),
      (444, "DB02", 2000, 9, 15),
      (456, "JA01", 2001, 1, 15),
	  (456, "WW01", 2001, 3, 1),
      (555, "DB03", 2000, 9, 22),
      (666, "JA01", 2000, 1, 1),
      (678, "JA01", 2000, 1, 1),
      (678, "JA02", 2000, 1, 2),
      (693, "JA01", 2000, 7, 24),
      (693, "JA02", 2000, 1, 2),
      (693, "JA03", 2000, 12, 12),
	  (693, "JA04", 2000, 12, 4),
      (777, "DB01", 2000, 5, 1),
      (777, "DB02", 2000, 9, 15),
      (777, "DB03", 2000, 9, 22),
      (777, "DB04", 2000, 9, 29),
      (789, "WW01", 2001, 3, 1),
      (888, "DB01", 2000, 5, 1),
      (888, "JA01", 2000, 7, 24),
      (888, "SE01", 2000, 6, 1),
      (888, "WW01", 2000, 8, 1),
      (987, "JA01", 2000, 7, 24),
      (999, "DB01", 2000, 5, 1),
      (999, "SE01", 2000, 6, 1);

-- Función SELECT
-- Formato:
-- SELECT columnas FROM tabla;
USE empleados;
SELECT * FROM employee;
SELECT * FROM takes;
SELECT * FROM trainingCourse;
SELECT * FROM technologyArea;


-- CONSULTAS

-- ¿Qué cursos se ofrecen en el área de Bases de datos?
SELECT cTitle FROM trainingCourse WHERE areaID = "DB";

-- ¿Qué empleados han tomado un curso del área de Bases de datos?
-- "Trampa"
SELECT eID FROM takes WHERE cID LIKE "DB%";
-- Con JOIN
SELECT e.eID
FROM employee e
INNER JOIN takes t ON e.eID = t.eID
INNER JOIN trainingCourse c ON t.cID = c.cID
INNER JOIN technologyArea a ON c.areaID = a.aID
WHERE a.aTitle = 'Database';

-- ¿Qué empleados no han tomado ningún curso?
-- SELECT eID FROM takes;
SELECT eID FROM employee WHERE eID NOT IN (SELECT eID FROM takes);

-- ¿Qué empleados han tomado un curso en más de un área tecnológica?
SELECT t.eID
FROM takes t JOIN trainingCourse tC ON t.cID = tC.cID
GROUP BY t.eID
HAVING COUNT(tC.areaID) > 1;

-- ¿Qué empleados tienen el menor salario?
SELECT eID, eSalary FROM employee WHERE eSalary = (SELECT MIN(eSALARY) FROM employee);

-- ¿Qué empleados tomaron todos los cursos del área de Bases de datos?
SELECT e.eID
FROM employee e
INNER JOIN takes t ON e.eID = t.eID
INNER JOIN trainingCourse c ON t.cID = c.cID
INNER JOIN technologyArea a ON c.areaID = a.aID
WHERE a.aTitle = 'Database'
GROUP BY e.eID
HAVING COUNT(c.areaID) = 4;

-- ¿Cuál es la cantidad de horas de curso tomadas por todos los empleados, separadas por área?
-- TOTAL DE HORAS
SELECT SUM(cHours)
FROM takes t JOIN trainingCourse tC ON t.cID = tC.cID;
-- TOTAL DE DB, JA, SE y WW
SELECT SUM(cHOURS)
FROM takes t JOIN trainingCourse tC ON t.cID = tC.cID WHERE tC.areaID = "DB";
SELECT SUM(cHOURS)
FROM takes t JOIN trainingCourse tC ON t.cID = tC.cID WHERE tC.areaID = "JA";
SELECT SUM(cHOURS)
FROM takes t JOIN trainingCourse tC ON t.cID = tC.cID WHERE tC.areaID = "SE";
SELECT SUM(cHOURS)
FROM takes t JOIN trainingCourse tC ON t.cID = tC.cID WHERE tC.areaID = "WW";

SELECT tC.areaID AS AreaID, SUM(tC.cHours) AS TotalHoras
FROM takes t JOIN trainingCourse tC ON tC.cID = t.cID
GROUP BY tC.areaID
ORDER BY TotalHoras;

-- ¿Qué empleados han tomado cursos después del 4 de diciembre del 2000?
SELECT e.eID
FROM employee e JOIN takes t ON e.eID = t.eID
WHERE DATE(CONCAT(t.tYear, '-', t.tMonth, '-', t.tDay)) > DATE('2000-12-04');
SELECT *
FROM employee e JOIN takes t ON e.eID = t.eID;