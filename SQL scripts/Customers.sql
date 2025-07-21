CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE,
    country NVARCHAR(50),
    phone NVARCHAR(20),
    created_date DATE
);
