SELECT * FROM branch;

-- INSERT INTO branch(branchNo, street, city, postcode)
-- VALUES ("B010", "25 Dog Rd", "London", "SW2 5TG");

-- Sentencia UPDATE
-- UPDATE tabla SET columna = valor WHERE condición;

UPDATE branch SET city = "Liverpool" WHERE branchNo = "B010";

-- Sentencia DELETE
-- DELETE FROM tabla WHERE condicion;

DELETE FROM branch WHERE branchNo = "B010";

-- Sentencia SELECT
-- SELECT columnas FROM tablas WHERE condicion
-- GROUP BY columnas HAVING condicion ORDER BY columnas;

-- 5 tipos de Condiciones:
-- 1. Comparación
-- 2. Pertenencia
-- 3. Rango
-- 4. Patrón
-- 5. Nula

-- 1. Comparación
-- Operadores: < > <= >= != OR AND ... 
-- branchNo = "B010" AND city = "London"
--
-- 2. Pertenencia
-- Que el valor de una columna o celda pertenezca a un conjunto de datos
-- city IN("London", "Glasgow", "Liverpool")
--
-- 3. Rango
-- salary BETWEEN 5000 AND 40000
USE dreamhome;
SELECT * FROM staff WHERE salary BETWEEN 9000 and 90000;
--
-- 4. Patrón
-- LIKE
-- % Cualquier cantidad de caracteres
-- ? Opcional, representa un caracter que puede o no estar
-- _ Representa un caracter que tenga que estar

-- Empleados cuyo apellido contenga 'ch'
SELECT * FROM staff WHERE lName LIKE "%ch%";
-- Empleados cuyo apellido termina en "d"
SELECT * FROM staff WHERE lName LIKE "%d";
-- Empleados cuyo apellido tenga cuatro letras
SELECT * FROM staff WHERE lName LIKE "____";

-- 5. Nula
-- NO HACER COMPARACIONES CON NULL
SELECT * FROM viewing WHERE comment IS NULL;

-- Nombre de los empleados que...
-- SELECT fName, lName FROM staff WHERE ...
--
--
-- Ejercicios:
-- Propiedades que no tienen un empleado asignado
SELECT * FROM propertyForRent WHERE staffNo IS NULL;
--
-- Empleados nacidos en la década de los 70
SELECT * FROM staff WHERE dob BETWEEN "1970-01-01" AND "1979-12-31";
--
-- Nombre de los supervisores y gerentes
-- SELECT fName, lName, position FROM staff WHERE position = "Supervisor" OR position = "Manager";
SELECT fName, lName, position FROM staff WHERE position IN("Supervisor", "Manager");


-- Funciones
-- OPERADORES RELACIONALES
-- Funciones que actúan sobre un solo valor, una celda
SELECT SHA2("1234",224);
SELECT UPPER(fName) FROM staff;
SELECT SUBSTRING(fName,2) FROM staff;
-- Para fechas, usar YEAR, MONTH, DAY
SELECT * FROM staff WHERE YEAR(dob) BETWEEN 1970 AND 1979;

-- FUNCIONES DE AGREGACIÓN
-- Funciones que actúan sobre uno o más valores, una celda, una columna o varias filas
-- COUNT, SUM, MIN, MAX
-- ¿Cuántos empleados tiene la sucursal B005?
SELECT COUNT(branchNo) FROM staff WHERE branchNo = "B005";
SELECT COUNT(*) FROM staff WHERE branchNo = "B005";

-- ¿Cuánto ganan los empleados de la sucursal B005?
SELECT SUM(salary) FROM staff WHERE branchNo = "B005";

-- ¿Cuánto ganan los empleados de cada sucursal;
SELECT branchNo, SUM(salary) FROM staff GROUP BY branchNo;

-- Ordenamiento
SELECT branchNo, SUM(salary) FROM staff GROUP BY branchNo ORDER BY branchNo DESC; -- Descendiente

-- Alias AS
SELECT branchNo, SUM(salary) AS totalSalary FROM staff GROUP BY branchNo ORDER BY totalSalary DESC;

-- ¿Qué sucursales pagan, en total, más de 30,000?
SELECT branchNo, SUM(salary) AS totalSalary FROM staff GROUP BY branchNo HAVING SUM(salary)>30000;

-- SUBCONSULTAS: Usar el resultado de una consulta como tabla
-- ¿Cuál es la sucursal que, en total, paga más a sus empleados?
SELECT branchNo FROM (SELECT branchNo, SUM(salary) AS totalSalary FROM staff GROUP BY branchNo) AS branchSalary
WHERE totalSalary = (
SELECT MAX(totalSalary) FROM (SELECT branchNo, SUM(salary) AS totalSalary FROM staff GROUP BY branchNo) AS branchSalary
);

-- ¿Cuántos empleados tiene la sucursal de Glasgow?
SELECT COUNT(staff.staffNo) FROM staff,branch WHERE staff.branchNo = branch.branchNo AND city = "Glasgow";

SELECT COUNT(staffNo) FROM staff AS s, branch AS b WHERE b.branchNo = s.staffNo AND city = "Glasgow";


-- LEFT JOIN & RIGHT JOIN
-- Producto                 	Categoría
-- id, nombre, categoría	    id, 
-- 1, Camisa, 1             	1, Ropa
-- 2, Tenis, 2              	2, Zapatos
-- 3, Celular, null
-- 4, Short, 1

--        <--												-->
-- Producto LEFT JOIN Categoría						Producto RIGHT JOIN Categoría
-- 1, Camisa, 1, 1, Ropa							1, Camisa, 1, 1, Ropa
-- 2, Tenis, 2, 2, Zapatos							4, Short, 1, 1, Ropa
-- 3, Celular, null, null, null						2, Tenis, 2, 2, Zapatos
-- 4, Short, 1, 1, Ropa

USE dreamhome;
-- Sucursales sin empleados
SELECT branch.branchNo FROM branch LEFT JOIN staff ON branch.branchNo = staff.branchNo WHERE staffNo is NULL;

SELECT branchNo FROM branch WHERE branchNo NOT IN ("B005", "B007", "B003");


-- Nombre del cliente que está dispuesto a pagar la mayor cantidad de la renta
SELECT * from client;
SELECT fName,lName,maxRent FROM client;
SELECT fName,lName,maxRent FROM client WHERE maxRent = (SELECT MAX(maxRent) FROM client);


-- Sucursal que maneja propiedades en Londres
SELECT * from branch;
SELECT branchNo, city FROM branch WHERE city IN ("London");
SELECT branch.branchNo FROM branch JOIN propertyForRent ON branch.branchNo = propertyForRent.branchNo WHERE propertyForRent.city = "London";

-- Nombre de los dueños con propiedades en Aberdeen
-- 1. privateOwner, propertyForRent --> privateOwner.ownerNo = propertyForRent.ownerNo
-- 2. fName, lName
-- 3. propertyForRent.city = "Aberdeen"
SELECT * FROM privateOwner;
SELECT privateOwner.fName, privateOwner.lName FROM privateOwner JOIN propertyForRent ON privateOwner.ownerNo = propertyForRent.ownerNo WHERE propertyForRent.city = "Aberdeen";

-- Nombre de los clientes que han visitado más de una propiedad
-- 1. client.viewing --> client.clientNo = viewing.clientNo
-- 2. fName, lName, COUNT(viewing.clientNo)
-- 4. GROUP BY client.fName, client.lName
-- 5. HAVING COUNT(viewing.clientNo) > 1;

SELECT client.fName, client.lName, COUNT(viewing.clientNo)
FROM client JOIN viewing ON client.clientNo = viewing.clientNo
GROUP BY client.fName, client.lName
HAVING COUNT(viewing.clientNo) > 1;