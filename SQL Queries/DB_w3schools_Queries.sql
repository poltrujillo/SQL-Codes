/* Fes una query en SQL que mostri totes les columnes de tots els productes per
pantalla. És a dir retorna totes les columnes i totes les files de la taula Products. */
-- 1
SELECT * FROM Products;

/* Mostra només la columna descripció de la taula Categories. */
-- 2
SELECT Description FROM Categories;

/* Retorna la informació de tots els clients per pantalla usant la taula Customers. */
-- 3
SELECT * FROM Customers;

/* Mostra ara les columnes CategoryName i Description de la taula Categories. */
-- 4
SELECT CategoryName, Description FROM Categories;

/* Mostra ara només la columna descripció de la taula Categories i només per la fila on CategoryName = “Grains/Cereals”. */
-- 5
SELECT Description FROM Categories 
    WHERE CategoryName = "Grains/Cereals";

/* Desenvolupa una consulta que retorni tota la informació relativa a tots els
productes de la taula Products que tenen categoria = 1. */
-- 6
SELECT * FROM Products 
    WHERE CategoryID = 1;

/* Retorna el ProductID del producte que té “Filo Mix” per nom. */
-- 7
SELECT ProductID FROM Products 
    WHERE ProductName = "Filo Mix";

/* Mostra tota la info de tots els productes del SupplierID número 3. Usa la taula
Products. */
-- 8
SELECT * FROM Products 
    WHERE SupplierID = 3;

/* Retorna tots els productes de la categoria 2 que tenen un preu > 20. */
-- 9
SELECT * FROM Products 
    WHERE CategoryID = 2 AND UnitPrice > 20;

/* Fes una query que retorni les dades de tots els clients alemanys. */
-- 10
SELECT * FROM Customers 
    WHERE Country = "Germany";

/* Retorna el nom i la data de naixement de l’empleat Steven Buchanan usant la
taula Employees. */
-- 11
SELECT FirstName, BirthDate FROM Employees;

/* Volem un llistat dels noms de tots els proveïdors japonesos. Usa la taula
Suppliers. */
-- 12
SELECT CompanyName FROM Suppliers 
    WHERE Country = "Japan";

/* Volem ara un llistat de les persones de contacte dels proveïdors britànics i el seu
telèfon. Usa la taula Suppliers. */
-- 13
SELECT ContactName, Phone FROM Suppliers 
    WHERE Country = "UK";

/* Troba el nom de l’empresa d’enviaments que té el telèfon = (503) 555-3199. Usa
la taula Shippers. */
-- 14
SELECT CompanyName FROM Shippers 
    WHERE Phone = "(503) 555-3199";

/* Mostra el preu i el pes del ProductID = 69.
 */
-- 15
SELECT QuantityPerUnit, UnitPrice FROM Products 
    WHERE ProductID = "69"; 

/* Retorna un llistat de tota la informació de tots els clients ordenats pel país de
procedència alfabèticament. */
--16 
SELECT * FROM Customers ORDER BY Country ASC;

/* Fes el recompte de quants productes hi ha de la categoria 2 que tenen un preu > 20. */
--17 
SELECT COUNT(*) FROM Products 
    WHERE CategoryID = 2 AND UnitPrice > 20;

/* Fes una query que retorni la xifra del producte més car de la taula Products. */
--18 
SELECT MAX(UnitPrice) FROM Products;

/* Retorna el preu mig de la taula Products. */
--19 
SELECT AVG(UnitPrice) FROM Products;

/* Mostra la data de la primera l’ordre creada. Usa la taula Orders. */ 
--20 
SELECT MIN(OrderDate) FROM Orders;  

/* Mostra el preu de la Order 10255 (Price x quantitat de tots els productes). */
--21 
SELECT SUM(UnitPrice * Quantity) FROM OrderDetails 
    WHERE OrderID = 10255;

/* Mostra el numero de productes de cada Order. */
--22 
SELECT OrderID, COUNT(ProductID) FROM OrderDetails GROUP BY OrderID;  

/* Mostra el numero de productes de cada Order sempre que siguin mes de 3. */
--23 
SELECT OrderID, COUNT(ProductID) FROM OrderDetails GROUP BY OrderID HAVING COUNT(ProductID) > 3;  

/* Mostra els suppliers de les Ciutats que comencen per B que tenen productes
amb un preu major a 50. */
--24 
SELECT CompanyName, City FROM Suppliers AS s, Products AS p 
    WHERE City LIKE "B%" AND s.SupplierID = P.SupplierID AND UnitPrice > 50;

/* Mostra els clients d’un país amb més de 7 lletres. */
-- 25
SELECT CompanyName FROM Customers
    WHERE LENGTH(Country) > 7;

/* Mostra les ordres d’avui. */
-- 26
SELECT * FROM Orders
    WHERE OrderDate = CURRENT_DATE();

/* Mostra les ordres de febrer del 1997 del empleat 2. */
-- 27
SELECT * FROM Orders
    WHERE YEAR(OrderDate) = 1997
        AND MONTH(OrderDate) = 2
        AND EmployeeID = 2;
   
    -- Possible resposta:  WHERE OrderDate BETWEEN "1997-02-01" AND "1997-02-31" AND EmployeeID = 2;

/* Mostra la mitja de ordres per any. */
-- 28
SELECT AVG(CountOrders) FROM (SELECT COUNT(OrderID) FROM Orders GROUP BY YEAR(OrderDate));

/* Mostra el seu preu del producte més barat i el més car (2 Selects separats). */
-- 29
SELECT MIN(UnitPrice) FROM Products;
SELECT MAX(UnitPrice) FROM Products;

/* Les ID’s de les Ordres de 4 productes diferents o més indicant també el nom del
client. */
-- 30
SELECT OrderID, COUNT(ProductID) FROM OrderDetails GROUP BY OrderID HAVING COUNT(ProductID) > 3;  

/* Mostra l’ordre amb més quantitat de productes. */
-- 31
SELECT OrderID, SUM(Quantity) FROM OrderDetails GROUP BY OrderID ORDER BY SUM(Quantity) DESC LIMIT 1;

/* Mostra l’empleat més gran i el més petit (2 Selects separats). */
-- 32
SELECT MAX(BirthDate) FROM Employees;
SELECT MIN(BirthDate) FROM Employees;

/* Retorna l’adreça, ciutat, codi postal i país de tots els clients (tot junts amb un
camp). */
-- 33
SELECT CONCAT(Address, ", ", City, ", ", PostalCode, ", ", Country) FROM Customers;