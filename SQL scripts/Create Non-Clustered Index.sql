CREATE NONCLUSTERED INDEX IDX_Orders_CustomerID
ON Orders (customer_id);


CREATE NONCLUSTERED INDEX IDX_Orders_ProductID
ON Orders (product_id);


CREATE NONCLUSTERED INDEX IDX_Orders_Status
ON Orders (status);
