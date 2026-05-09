CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    Age INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE
);

INSERT INTO Customers (CustomerID, Name, Country, Age) VALUES
(1,'Elie','Lebanon',25),(2,'John','USA',30),(3,'Antonia','France',28),
(4,'Ali','UAE',35),(5,'Christina','Spain',27),(6,'David','UK',32),
(7,'Lina','Germany',29),(8,'Omar','Egypt',33),(9,'Sophie','Italy',26),
(10,'Chris','Canada',31),(11,'Nour','Lebanon',24),(12,'James','USA',40),
(13,'Emma','France',22),(14,'Youssef','Morocco',36),(15,'Anna','Sweden',28),
(16,'Mark','USA',34),(17,'Sara','Lebanon',26),(18,'Lucas','Brazil',29),
(19,'Maya','India',27),(20,'Noah','USA',33),(21,'Leo','France',31),
(22,'Amal','Lebanon',30),(23,'Zara','UK',25),(24,'Paul','Germany',38),
(25,'Rami','Lebanon',29),(26,'Nina','Italy',24),(27,'Tariq','UAE',35),
(28,'Victor','Spain',32),(29,'Dina','Egypt',28),(30,'George','Canada',36),
(31,'Sam','USA',41),(32,'Hana','Japan',23),(33,'Ivan','Russia',37),
(34,'Fatima','Morocco',34),(35,'Khaled','Lebanon',39),(36,'Lara','France',26),
(37,'Adam','USA',28),(38,'Mila','Germany',27),(39,'Yara','Lebanon',25),
(40,'Olivier','France',33),(41,'Aliya','India',31),(42,'Pedro','Brazil',30),
(43,'Hassan','Lebanon',38),(44,'Carla','Spain',29),(45,'Jad','Lebanon',27),
(46,'Nabil','Egypt',35),(47,'Liam','UK',32),(48,'Mona','UAE',28),
(49,'Ryan','USA',36),(50,'Lea','France',24);

SELECT * FROM Customers;

SELECT Name, Country FROM Customers;

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1,'iPhone 14','Electronics',999),(2,'Samsung S22','Electronics',850),
(3,'MacBook Air','Electronics',1200),(4,'Dell Laptop','Electronics',950),
(5,'AirPods','Accessories',200),(6,'Headphones','Accessories',150),
(7,'Keyboard','Accessories',80),(8,'Mouse','Accessories',40),
(9,'Office Chair','Furniture',300),(10,'Desk','Furniture',400),
(11,'Monitor','Electronics',250),(12,'Printer','Electronics',180),
(13,'Tablet','Electronics',600),(14,'Smart Watch','Electronics',350),
(15,'Camera','Electronics',700),(16,'Backpack','Accessories',60),
(17,'Notebook','Stationery',10),(18,'Pen Pack','Stationery',5),
(19,'Gaming Console','Electronics',500),(20,'TV 55 inch','Electronics',900);

SELECT * FROM Products;

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate) VALUES
(1,1,1,2,'2024-01-05'),(2,2,3,1,'2024-01-06'),(3,3,2,3,'2024-01-07'),
(4,4,5,1,'2024-01-08'),(5,5,10,2,'2024-01-09'),(6,6,7,4,'2024-01-10'),
(7,7,6,2,'2024-01-11'),(8,8,8,1,'2024-01-12'),(9,9,4,2,'2024-01-13'),
(10,10,1,1,'2024-01-14'),

(11,11,2,2,'2024-01-15'),(12,12,3,1,'2024-01-16'),(13,13,5,3,'2024-01-17'),
(14,14,9,1,'2024-01-18'),(15,15,11,2,'2024-01-19'),(16,16,12,1,'2024-01-20'),
(17,17,14,2,'2024-01-21'),(18,18,15,1,'2024-01-22'),(19,19,16,3,'2024-01-23'),
(20,20,17,5,'2024-01-24'),

(21,21,18,6,'2024-01-25'),(22,22,19,1,'2024-01-26'),(23,23,20,2,'2024-01-27'),
(24,24,4,1,'2024-01-28'),(25,25,2,2,'2024-01-29'),(26,26,3,1,'2024-01-30'),
(27,27,6,4,'2024-02-01'),(28,28,7,2,'2024-02-02'),(29,29,8,3,'2024-02-03'),
(30,30,9,1,'2024-02-04'),

(31,31,10,2,'2024-02-05'),(32,32,11,1,'2024-02-06'),(33,33,12,3,'2024-02-07'),
(34,34,13,2,'2024-02-08'),(35,35,14,1,'2024-02-09'),(36,36,15,2,'2024-02-10'),
(37,37,16,1,'2024-02-11'),(38,38,17,4,'2024-02-12'),(39,39,18,5,'2024-02-13'),
(40,40,19,2,'2024-02-14'),

(41,41,20,1,'2024-02-15'),(42,42,1,2,'2024-02-16'),(43,43,2,3,'2024-02-17'),
(44,44,3,1,'2024-02-18'),(45,45,4,2,'2024-02-19'),(46,46,5,1,'2024-02-20'),
(47,47,6,2,'2024-02-21'),(48,48,7,3,'2024-02-22'),(49,49,8,1,'2024-02-23'),
(50,50,9,2,'2024-02-24');

SELECT COUNT(*) FROM Orders;
SELECT * FROM Orders;

SELECT Name, Country
FROM Customers;

SELECT SUM(Quantity) AS Total
FROM Orders;

SELECT ProductID, SUM(Quantity)
FROM Orders
GROUP BY ProductID;

SELECT 
    ProductID, 
    SUM(Quantity) AS TotalSold
FROM Orders
GROUP BY ProductID;

SELECT ProductID, SUM(Quantity) AS Total
FROM Orders
GROUP BY ProductID
ORDER BY Total DESC;

SELECT o.ProductID, p.ProductName
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID;

SELECT p.ProductName, SUM(o.Quantity) AS Total
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total DESC;

SELECT 
    p.ProductName,
    SUM(o.Quantity) AS TotalSold
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

SELECT 
    p.ProductName,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

SELECT 
    c.Name,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY c.Name
ORDER BY TotalSpent DESC;

SELECT *
FROM Customers
WHERE Country = 'Lebanon';

SELECT *
FROM Products
WHERE Price > 500;

SELECT *
FROM Orders
WHERE Quantity >= 3;

SELECT 
    c.Name,
    p.ProductName,
    o.Quantity
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID
JOIN Products p
ON o.ProductID = p.ProductID
WHERE c.Country = 'Lebanon';

SELECT 
    p.ProductName,
    SUM(o.Quantity) AS TotalSold
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID
WHERE p.Category = 'Electronics'
GROUP BY p.ProductName;

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

SELECT COUNT(*) AS TotalOrders
FROM Orders;

SELECT COUNT(*) AS LebanonCustomers
FROM Customers
WHERE Country = 'Lebanon';

SELECT ProductID, COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY ProductID;

SELECT AVG(Price) AS AveragePrice
FROM Products;

SELECT MIN(Price) AS CheapestProduct
FROM Products;

SELECT MAX(Price) AS MostExpensive
FROM Products;

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM Orders
GROUP BY ProductID
HAVING SUM(Quantity) > 5;

SELECT *
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;

SELECT *
FROM Orders o
LEFT JOIN Products p
ON o.ProductID = p.ProductID;

SELECT *
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);

SELECT TOP 5
    c.Name AS Customer,
    c.Country,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.Name, c.Country
ORDER BY TotalSpent DESC;
