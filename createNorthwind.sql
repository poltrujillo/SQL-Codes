DROP DATABASE IF EXISTS Northwind_Complet;

CREATE DATABASE IF NOT EXISTS Northwind_Complet DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE 'utf8_spanish_ci';

USE Northwind_Complet;

CREATE TABLE IF NOT EXISTS Suppliers(
    SupplierID INT AUTO_INCREMENT NOT NULL,
    CompanyName VARCHAR(50) NOT NULL,
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(5),
    Country VARCHAR(50) NOT NULL,
    Phone VARCHAR(9) NOT NULL,
    Fax VARCHAR(9),
    HomePage VARCHAR(50),
    PRIMARY KEY(SupplierID)
);

CREATE TABLE IF NOT EXISTS Employees(
    EmployeeID INT AUTO_INCREMENT NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Title VARCHAR(50),
    TitleOfCourtesy VARCHAR(50),
    BirthDate DATE NOT NULL,  
    HireDate DATE,
    Address VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(5),
    Country VARCHAR(50) NOT NULL,
    HomePage VARCHAR(50),
    Extension VARCHAR(50),
    Photo VARCHAR(50),
    Notes VARCHAR(50),
    ReportsTo INT,
    PhotoPath VARCHAR(50),
    PRIMARY KEY(EmployeeID)
);

ALTER TABLE Employees ADD FOREIGN KEY(ReportsTo) REFERENCES Employees(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS Customers(
    CustomerID INT AUTO_INCREMENT NOT NULL,
    CompanyName VARCHAR(50) NOT NULL,
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(5),
    Country VARCHAR(50) NOT NULL,
    Phone VARCHAR(9) NOT NULL,
    Fax VARCHAR(9),
    PRIMARY KEY(CustomerID)
);

CREATE TABLE IF NOT EXISTS Categories(
    CategoryID INT AUTO_INCREMENT NOT NULL,
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(200) DEFAULT 'Insert description here',
    Picture VARCHAR(50),
    PRIMARY KEY(CategoryID)
);

CREATE TABLE IF NOT EXISTS Products(
    ProductID INT AUTO_INCREMENT NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    SupplierID INT AUTO_INCREMENT NOT NULL,
    CategoryID INT AUTO_INCREMENT NOT NULL,
    QuantityPerUnit INT,
    UnitPrice INT,
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN,
    PRIMARY KEY(ProductID),
    FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Shippers(
    ShipperID INT AUTO_INCREMENT NOT NULL,
    CompanyName VARCHAR(50) NOT NULL,
    Phone VARCHAR(9),
    PRIMARY KEY(ShipperID)
);

CREATE TABLE IF NOT EXISTS Orders(
    OrderID INT AUTO_INCREMENT NOT NULL,
    CustomerID INT AUTO_INCREMENT NOT NULL,
    EmployeeID INT AUTO_INCREMENT NOT NULL,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipperVia INT,
    Freight VARCHAR(50),
    ShipName VARCHAR(50) NOT NULL,
    ShipAddress VARCHAR(50),
    ShipCity VARCHAR(50),
    ShipRegion VARCHAR(50),
    ShipPostalCode VARCHAR(5),
    ShipCountry VARCHAR(50) NOT NULL,
    PRIMARY KEY(OrderID),
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(ShipperVia) REFERENCES Shippers(ShipperID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS OrderDetails(
    OrderID INT AUTO_INCREMENT NOT NULL,
    ProductID INT AUTO_INCREMENT NOT NULL,
    UnitPrice INT NOT NULL,
    Quantity INT,
    Discount INT,
    PRIMARY KEY(OrderID, ProductID),
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID) ON UPDATE CASCADE ON DELETE CASCADE  
);

CREATE TABLE IF NOT EXISTS Region(
    RegionID INT AUTO_INCREMENT NOT NULL,
    RegionDescription VARCHAR(200) DEFAULT 'Insert description here',
    PRIMARY KEY(RegionID)
);

CREATE TABLE IF NOT EXISTS Territories(
    TerritoryID INT AUTO_INCREMENT NOT NULL,
    TerritoryDescription VARCHAR(200) DEFAULT 'Insert description here',
    RegionID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(TerritoryID),
    FOREIGN KEY(RegionID) REFERENCES Region(RegionID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS EmployeeTerriories(
    EmployeeID INT AUTO_INCREMENT NOT NULL,
    TerritoryID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(EmployeeID, TerritoryID),
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(TerritoryID) REFERENCES Territories(TerritoryID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CustomerDemographics(
    CustomerTypeID INT AUTO_INCREMENT NOT NULL,
    CustomerDesc VARCHAR(200) DEFAULT 'Insert description here',
    PRIMARY KEY(CustomerTypeID)
);

CREATE TABLE IF NOT EXISTS Cust_CustDemographics(
    CustomerID INT AUTO_INCREMENT NOT NULL,
    CustomerTypeID INT,
    PRIMARY KEY(CustomerID, CustomerTypeID),
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(CustomerTypeID) REFERENCES CustomerDemographics(CustomerTypeID) ON UPDATE CASCADE ON DELETE CASCADE
);