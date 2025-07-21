SELECT c.customer_id, c.first_name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_spent DESC;
