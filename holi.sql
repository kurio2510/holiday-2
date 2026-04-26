USE HOLIDAY;
-- 1."Nước giải khát" category price 10k–50k in stock
SELECT p.*,c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = N'Nước giải khát'
AND p.Price BETWEEN 10000 AND 50000
AND p.StockQuantity > 0;

-- 2. last name "Nguyen" OR living in Hanoi
SELECT c.CustomerID,c.FullName,c.Address
FROM Customers c
WHERE c.FullName LIKE N'Nguyễn%'
OR c.Address LIKE N'%Hà Nội%';

-- 3. Order Big to Small
SELECT o.OrderID,o.OrderDate,o.Status,c.FullName AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;

-- 4. details
SELECT c.FullName AS CustomerName,o.OrderDate,p.ProductName,od.Quantity,od.UnitPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderID = @OrderID;

-- 5.never placed any order
SELECT c.CustomerID,c.FullName,c.Address
FROM Customers c
WHERE NOT EXISTS (
SELECT 1
FROM Orders o
WHERE o.CustomerID = c.CustomerID
);
