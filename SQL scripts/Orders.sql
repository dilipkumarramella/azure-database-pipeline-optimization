CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE NOT NULL,
    order_quantity INT NOT NULL,
    total_amount DECIMAL(10,2),
    status NVARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
