SELECT top 5
    c.CustomerID,
    c.Name AS CustomerName,
    SUM(so.TotalAmount) AS TotalSpent
FROM customer c
JOIN SalesOrder so
    ON c.CustomerID = so.CustomerID
GROUP BY 
    c.CustomerID, 
    c.Name
ORDER BY 
    TotalSpent DESC


SELECT
    s.SupplierID,
    s.Name AS SupplierName,
    COUNT(p.ProductID) AS ProductCount
FROM supplier s
JOIN purchaseorder po ON s.SupplierID = po.SupplierID
JOIN purchaseorderdetail pod ON po.OrderID = pod.OrderID
JOIN product p ON pod.ProductID = p.ProductID
GROUP BY s.SupplierID, s.Name
HAVING COUNT(p.ProductID) > 5;


SELECT
    p.ProductID,
    p.Name AS ProductName,
    SUM(sod.Quantity) AS TotalOrderQuantity
FROM product p
JOIN salesorderdetail sod ON p.ProductID = sod.ProductID
LEFT JOIN returndetail rd ON p.ProductID = rd.ProductID
WHERE rd.ProductID IS NULL
GROUP BY p.ProductID, p.Name;


SELECT
    c.CategoryID,
    c.Name AS CategoryName,
    p.Name AS ProductName,
    p.Price
FROM product p
JOIN category c ON p.CategoryID = c.CategoryID
WHERE p.Price = (
    SELECT MAX(p3.Price)
    FROM product p3
    WHERE p3.CategoryID = p.CategoryID
);


SELECT
    so.OrderID,
    c.Name AS CustomerName,
    p.Name AS ProductName,
    cat.Name AS CategoryName,
    s.Name AS SupplierName,
    sod.Quantity
FROM salesorder so
JOIN customer c ON so.CustomerID = c.CustomerID
JOIN salesorderdetail sod ON so.OrderID = sod.OrderID
JOIN product p ON sod.ProductID = p.ProductID
JOIN category cat ON p.CategoryID = cat.CategoryID
JOIN purchaseorderdetail pod ON p.ProductID = pod.ProductID
JOIN purchaseorder po ON pod.OrderID = po.OrderID
JOIN supplier s ON po.SupplierID = s.SupplierID;



        
