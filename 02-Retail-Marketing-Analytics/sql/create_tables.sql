CREATE TABLE Products (
    ProductID VARCHAR(20),
    ProductName VARCHAR(255),
    Category VARCHAR(50),
    Subcategory VARCHAR(50)
);

CREATE TABLE Customers (
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    Region VARCHAR(50)
);

CREATE TABLE Regions (
    Region VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID VARCHAR(50),
    OrderDate DATE,
    ShipDate DATE,
    CustomerID VARCHAR(20),
    ProductID VARCHAR(50),
    Quantity INT,
    Sales DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    Region VARCHAR(50)
);
