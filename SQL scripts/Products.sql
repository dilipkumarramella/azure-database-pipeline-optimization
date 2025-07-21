CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
    category NVARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    first_available DATE
);
