/* Retorna un recompte de quants distribuidors (shippers) hi ha. */
-- 1.
SELECT COUNT(ShipperID) FROM Shippers;

/* Calcula quants proveïdors (suppliers) hi ha per ciutat. */
-- 2.
SELECT COUNT(SupplierID) FROM Suppliers GROUP BY City;

/* Calcula quants productes són distribuits pel shipper número 3. */
-- 3.
SELECT COUNT(ProductID) FROM Products WHERE ShipperID = 3;

/* Crea un informe amb el nom del distribuidor, nom del proveidor,
nom de la categoria i el recompte de productes que coincideixen. */
-- 4.
SELECT sup.CompanyName, sh.CompanyName, c.CategoryName, COUNT(p.ProductID)
    FROM  Suppliers AS sup,
        Shippers AS sh,
        Categories AS cat,
        Products AS prod,
        OrderDetails AS od,
        Orders AS ord
    WHERE sup.SupplierID = prod.SupplierID
        AND cat.CategoryID = prod.CategoryID
        AND prod.ProductID = od.ProductID
        AND od.OrderID = ord.OrderID
        AND ord.ShipVia = sh.ShipperID
    GROUP BY sup.CompanyName, sh.CompanyName, cat.CategoryName;

/* Mostra un informe amb el nom dels clients (customers.companyname)
que han rebut més de tres paquets provinents del shipper número 3. */
-- 5.
SELECT c.CompanyName 
    FROM customers AS c, shippers AS s, orders AS o 
    WHERE ShipperID = 3 
    AND (SELECT COUNT(o.OrderID) FROM orders AS o, customers AS c, shippers AS s WHERE shipvia = 3) > 3 
    GROUP BY c.CompanyName;

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
    FROM Territories AS terr,
        Region AS reg
    WHERE terr.RegionID = r.RegionID
    GROUP BY reg.RegionID;

/* Calcula la mitjana de comandes (orders) servides per cada shipper. */
-- 9.
SELECT ShipVia, COUNT(OrderID) FROM Orders
    GROUP BY ShipVia;

/* Compta quants empleats hi ha per cada territori. Mostra TerritoryDescription i el recompte. */
-- 10.
SELECT t.TerritoryDescription, COUNT(e.EmployeeID)
    FROM Employees AS emp,
        Territories AS terr,
        EmployeeTerritories AS et
    WHERE emp.EmployeeID = et.EmployeeID
        AND terr.TerritoryID = et.TerritoryID
    GROUP BY terr.TerritoryID;

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