USE dqlab;

-- Mengecek Tabel orders_1
SELECT * FROM orders_1 LIMIT 5;

-- Mengecek Tabel orders_2
SELECT * FROM orders_2 LIMIT 5;

-- Mengecek Tabel customer
SELECT * FROM customer;

/* Total Penjualan dan Revenue pada 
 Quarter-1 (Jan, Feb, Mar) dan 
 Quarter-2 (Apr,Mei,Jun) */
 
 -- Total penjualan Revenue Quarter-1
SELECT SUM(quantity) AS total_penjualan, SUM(quantity*priceeach) AS revenue FROM orders_1
WHERE status = 'Shipped'
GROUP BY status;

-- Total penjulana Revenue Quarter-2
SELECT SUM(quantity) AS total_penjualan, SUM(quantity*priceeach) AS revenue FROM orders_2
WHERE status = 'Shipped'
GROUP BY status;


-- Menghitung Presentasi Penjualan
SELECT tabel_a.quarter, SUM(tabel_a.quantity) AS total_penjualan, 
  SUM(tabel_a.quantity*tabel_a.priceeach) AS revenue
  FROM(
	SELECT orderNumber,status,quantity,priceeach,'1' AS quarter 
	FROM orders_1
	UNION
	SELECT orderNumber,status,quantity,priceeach,'2' AS quarter 
	FROM orders_2
	)AS tabel_a
  WHERE status = 'Shipped'
  GROUP BY tabel_a.quarter
  
  
 -- Apakah jumlah customer xyz.com semakin bertambah?
 SELECT quarter,COUNT(DISTINCT(tabel_b.customerID))AS total_customers 
FROM(
  SELECT customerID,createDate,QUARTER(createDate) AS quarter 
  FROM customer
  WHERE createDate >= '01/01/2004' AND createDate <= '30/06/2004'
  )AS tabel_b
GROUP BY quarter;


-- Seberapa banyak customers tersebut yang sudah melakukan transaksi?
SELECT quarter,COUNT(DISTINCT(tabel_b.customerID))AS total_customers 
FROM(
  SELECT customerID,createDate,QUARTER(createDate) AS quarter 
  FROM customer
  WHERE createDate >= '01/01/2004' AND createDate <= '30/06/2004'
  )AS tabel_b
WHERE customerID IN(
  SELECT DISTINCT(orders_1.customerID)
  FROM orders_1
  UNION
  SELECT DISTINCT(orders_2.customerID)
  FROM orders_2)
GROUP BY quarter;


-- Category produk apa saja yang paling banyak di-order oleh customers di Quarter-2?
SELECT*
FROM(SELECT categoryID, COUNT(DISTINCT orderNumber) AS total_order, SUM(quantity) AS total_penjualan
	 FROM(SELECT productCode, orderNumber,quantity,status,LEFT(productCode,3)AS categoryID
		  FROM orders_2
		  WHERE status = 'Shipped')tabel_c
	 GROUP BY categoryID)tabel_a
ORDER BY total_order DESC


/* Seberapa banyak customers yang tetap aktif bertransaksi setelah transaksi pertamanya?
menghitung total transaksi*/

SELECT COUNT(DISTINCT customerID) as total_customers FROM orders_1;
-- output 25

SELECT quarter, COUNT(DISTINCT customerID)/25*100 AS Q2
FROM(
  SELECT*,'1' AS quarter
  FROM orders_1
  WHERE customerID IN(SELECT DISTINCT customerID FROM orders_2)
)tabel_a



 
 
 
 
 
 
 
 
 
 
 

