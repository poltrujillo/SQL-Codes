-- LINKED TO THE northwind.png DATABASE

/* Return the count of the total existing shippers. */
-- 1.

SELECT COUNT(*) FROM Shippers;

/* Return how many suppliers exist in each city */
-- 2.

SELECT COUNT(*), City FROM Suppliers GROUP BY City;

/* Return how many products are distributed by the shipper number 3 */
-- 3.

SELECT COUNT(ProductID) FROM Orders AS o, OrderDetails AS od
    WHERE o.OrderID = od.OrderID AND ShipperVia = 3;

/* Crea un informe amb el nom del distribuidor, nom del proveidor,
nom de la categoria i el recompte de productes que coincideixen. */
-- 4.

SELECT s.CompanyName, sh.CompanyName, c.CategoryName, COUNT(p.ProductID)
    FROM  Suppliers AS s,
        Shippers AS sh,
        Categories AS c,
        Products AS p,
        OrderDetails AS od,
        Orders AS o
    WHERE s.SupplierID = p.SupplierID
        AND c.CategoryID = p.CategoryID
        AND p.ProductID = od.ProductID
        AND od.OrderID = o.OrderID
        AND o.ShipperVia = sh.ShipperID
    GROUP BY s.CompanyName, sh.CompanyName, c.CategoryName;

/* Mostra un informe amb el nom dels clients (customers.companyname)
que han rebut més de tres paquets provinents del shipper número 3. */
-- 5.

SELECT c.CompanyName 
    FROM customers AS c, Shippers AS sh, Orders AS o 
        WHERE c.CustomerID = o.CustomerID AND ShipperVia = 3 
        GROUP BY c.CustomerID HAVING COUNT(o.OrderID) > 3;
    
/* Mostra un recompte de les ordres que ha rebut cada customer
ordenant pel recompte de forma descendent. */
-- 6.

SELECT c.CompanyName, COUNT(o.OrderID)
    FROM Orders AS o,
        Customers AS c
    WHERE o.CustomerID = c.CustomerID
    GROUP BY c.CompanyName;

/* Mostra un recompte de clients (customers) per codi postal sempre i quant
n'hi hagi més d'un al mateix codi postal. */
-- 7.

SELECT PostalCode, COUNT(CustomerID) FROM customers
    GROUP BY PostalCode
    HAVING COUNT(CustomerID) > 1;    

/* Compta quants territoris diferents hi ha per cada regió. Mostra RegionDescription i el recompte. */
-- 8.

SELECT r.RegionDescription, COUNT(t.TerritoryID)
    FROM Territories AS t,
         Region AS r
    WHERE t.RegionID = r.RegionID
    GROUP BY r.RegionID;

/* Calcula la mitjana de comandes (orders) servides per cada shipper. */
-- 9.

SELECT ShipperVia, COUNT(OrderID) FROM Orders
    GROUP BY ShipperVia;

/* Compta quants empleats hi ha per cada territori. Mostra TerritoryDescription i el recompte. */
-- 10.

SELECT t.TerritoryDescription, COUNT(e.EmployeeID)
    FROM Employees AS e,
        Territories AS t,
        EmployeeTerritories AS et
    WHERE e.EmployeeID = et.EmployeeID
        AND t.TerritoryID = et.TerritoryID
    GROUP BY t.TerritoryID;

/* Compta quants empleats hi ha per cada regió. Mostra RegionDescription i el recompte. */
-- 11.

SELECT r.RegionDescription, COUNT(e.EmployeeID)
    FROM Employees AS e,
        Territories AS t,
        Region AS r,
        EmployeeTerritories AS et
    WHERE e.EmployeeID = et.EmployeeID
        AND t.TerritoryID = et.TerritoryID
        AND t.RegionID = r.RegionID
    GROUP BY e.EmployeeID;

/* Retorna només el nom de la regió (region.description) que té més empleats. */
-- 12.

SELECT r.regiondescription 
    FROM Region r, 
        Territories t, 
        employeeterritories et, 
        Employees e 
    WHERE r.RegionID = t.RegionID 
        AND t.TerritoryID = et.TerritoryID 
        AND et.EmployeeID = e.EmployeeID 
    GROUP BY r.RegionDescription
    HAVING MAX(e.EmployeeID)
    LIMIT 1;

/* Retorna el recompte de productes per categoria. */
-- 13.

SELECT c.CategoryName, COUNT(p.ProductID)
    FROM Products AS p,
        Categories AS c
    WHERE p.CategoryID = c.CategoryID
    GROUP BY c.CategoryName
    ORDER BY c.CategoryName ASC;

/* Calcula quants productes pot servir cada distribuïdor. Mostra el CompanyName i el recompte de productes. */
-- 14.

SELECT s.CompanyName, COUNT(p.ProductID)
    FROM Suppliers AS sup,
        Products AS p
    WHERE s.SupplierID = p.SupplierID
    GROUP BY s.CompanyName
    ORDER BY s.CompanyName ASC;

/* Calcula quants empleats hi ha per Ciutat contractats a partir de l'any 1993. */
-- 15.

SELECT City, COUNT(EmployeeID) FROM Employees
    GROUP BY City
    ORDER BY City ASC;