SELECT c.country, o.status, COUNT(*) AS order_count, SUM(o.total_amount) AS revenue
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.country, o.status
ORDER BY revenue DESC;
