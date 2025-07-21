SELECT c.first_name, c.last_name, o.order_date, p.product_name, p.price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
WHERE o.status = 'Pending';
