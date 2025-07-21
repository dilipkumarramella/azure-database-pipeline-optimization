SELECT TOP 50 c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;
