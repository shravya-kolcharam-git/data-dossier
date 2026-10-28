CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  country CHAR(2)
);
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  total DECIMAL(10,2),
  placed_at TIMESTAMP
);
INSERT INTO customers VALUES (1,'a@example.com','DE');
INSERT INTO customers VALUES (2,'b@example.com',NULL);
SELECT c.country, SUM(o.total) FROM orders o JOIN customers c ON c.customer_id = o.customer_id GROUP BY c.country;
