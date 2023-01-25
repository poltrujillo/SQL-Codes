/* Create an SQL query that returns all columns of all products. */
-- 1
SELECT * FROM Products;

/* Return only the "description" column of the Categories table */
-- 2
SELECT Description FROM Categories;

/* Return the information of all the clients using the Customers table */
-- 3
SELECT * FROM Customers;

/* Return the CategoryName and Description columns of the Categories table */
-- 4
SELECT CategoryName, Description FROM Categories;

/* Return the Description column of the Categories table but only the CategoryName = "Grains/Cereals" row */
-- 5
SELECT Description FROM Categories 
    WHERE CategoryName = "Grains/Cereals";

/* Develop a query that returns all the data related to the Products table with CategoryID = 1 */
-- 6
SELECT * FROM Products 
    WHERE CategoryID = 1;

/* Return the ProductID of the product with "Filo Mix" in its name. */
-- 7
SELECT ProductID FROM Products 
    WHERE ProductName = "Filo Mix";

/* Return all the data of the Product table within the SupplierID = 3.*/
-- 8
SELECT * FROM Products 
    WHERE SupplierID = 3;

/* Return all the products of the CategoryID = 2 with a price > 20 */
-- 9
SELECT * FROM Products 
    WHERE CategoryID = 2 AND UnitPrice > 20;

/* Make a query that returns the data of all German customers. */
-- 10
SELECT * FROM Customers 
    WHERE Country = "Germany";

/* Returns the name and date of birth of the employee Steven Buchanan using the
Employees table. */
-- 11
SELECT FirstName, BirthDate FROM Employees;

/* We want a list of the names of all Japanese suppliers. Use the table
suppliers */
-- 12
SELECT CompanyName FROM Suppliers 
    WHERE Country = "Japan";

/* We now want a list of contact persons for UK suppliers and yours
phone Use the Suppliers table. */
-- 13
SELECT ContactName, Phone FROM Suppliers 
    WHERE Country = "UK";

/* Find the name of the shipping company that has the phone number = (503) 555-3199. use
the Shippers table. */
-- 14
SELECT CompanyName FROM Shippers 
    WHERE Phone = "(503) 555-3199";

/* Display the price and weight of ProductID = 69. */
-- 15
SELECT QuantityPerUnit, UnitPrice FROM Products 
    WHERE ProductID = "69"; 

/* Returns a list of all information for all customers sorted by country of
origin alphabetically. */
--16 
SELECT * FROM Customers ORDER BY Country ASC;

/* Count how many products there are in category 2 that have a price > 20. */
--17 
SELECT COUNT(*) FROM Products 
    WHERE CategoryID = 2 AND UnitPrice > 20;

/* Make a query that returns the number of the most expensive product in the Products table. */
--18 
SELECT MAX(UnitPrice) FROM Products;

/* Returns the average price from the Products table. */
--19 
SELECT AVG(UnitPrice) FROM Products;

/* Shows the date of the first l'ordre created. Use the Orders table. */ 
--20 
SELECT MIN(OrderDate) FROM Orders;  

/* Show the price of Order 10255 (Price x quantity of all products). */
--21 
SELECT SUM(UnitPrice * Quantity) FROM OrderDetails 
    WHERE OrderID = 10255;

/* Shows the number of products in each Order. */
--22 
SELECT OrderID, COUNT(ProductID) FROM OrderDetails GROUP BY OrderID;  

/* Show the number of products in each Order as long as they are more than 3. */
--23 
SELECT OrderID, COUNT(ProductID) FROM OrderDetails GROUP BY OrderID HAVING COUNT(ProductID) > 3;  

/* Show suppliers in Cities starting with B that have products
with a price greater than 50. */
--24 
SELECT CompanyName, City FROM Suppliers AS s, Products AS p 
    WHERE City LIKE "B%" AND s.SupplierID = P.SupplierID AND UnitPrice > 50;

/* Show customers from a country with more than 7 letters. */
-- 25
SELECT CompanyName FROM Customers
    WHERE LENGTH(Country) > 7;

/* Mostra les ordres d’avui. */
-- 26
SELECT * FROM Orders
    WHERE OrderDate = CURRENT_DATE();

/* Show February 1997 orders from employee 2. */
-- 27
SELECT * FROM Orders
    WHERE YEAR(OrderDate) = 1997
        AND MONTH(OrderDate) = 2
        AND EmployeeID = 2;
   
    -- Possible answer:  WHERE OrderDate BETWEEN "1997-02-01" AND "1997-02-31" AND EmployeeID = 2;

/* Show average orders per year. */
-- 28
SELECT AVG(CountOrders) FROM (SELECT COUNT(OrderID) FROM Orders GROUP BY YEAR(OrderDate));

/* Show your cheapest and most expensive product price (2 separate Selects). */
-- 29
SELECT MIN(UnitPrice) FROM Products;
SELECT MAX(UnitPrice) FROM Products;

/* The Order IDs of 4 or more different products, also indicating the name of the
customer */
-- 30
SELECT OrderID, COUNT(ProductID) FROM OrderDetails GROUP BY OrderID HAVING COUNT(ProductID) > 3;  

/* Show the order with the most products. */
-- 31
SELECT OrderID, SUM(Quantity) FROM OrderDetails GROUP BY OrderID ORDER BY SUM(Quantity) DESC LIMIT 1;

/* Show the oldest and youngest employee (2 separate Selects). */
-- 32
SELECT MAX(BirthDate) FROM Employees;
SELECT MIN(BirthDate) FROM Employees;

/* Returns the address, city, zip code and country of all customers (all together with a
rural area). */
-- 33
SELECT CONCAT(Address, ", ", City, ", ", PostalCode, ", ", Country) FROM Customers;