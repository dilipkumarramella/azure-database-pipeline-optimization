SELECT category, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY category
ORDER BY total_revenue DESC;
