USE dqlab;

-- Fungsi Skalar Matematika - ABS()
SELECT StudentID, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) as MarkGrowth FROM students;

-- Fungsi Skalar Matematika - CEILING()
SELECT StudentID, FirstName, LastName, CEILING(Semester1) as Semester1, CEILING(Semester2) as Semester2, MarkGrowth FROM students;	

-- Fungsi Skalar Matematika - FLOOR()
SELECT StudentID, FirstName, LastName, FLOOR(Semester1) as Semester1, FLOOR(Semester2) as Semester2, MarkGrowth FROM students;	

-- Fungsi Skalar Matematika - ROUND()
SELECT StudentID, FirstName, LastName, ROUND(Semester1,1) as Semester1, ROUND(Semester1,0) as Semester2, MarkGrowth FROM students;	

-- Fungsi Skalar Matematika - SQRT( )
SELECT StudentID,FirstName, LastName, SQRT(Semester1) as Semester1, Semester2, MarkGrowth FROM students;	

-- fungsi MOD() untuk menghitung nilai sisa jika nilai Semester1 dibagi 2 dan fungsi EXP() untuk menghitung nilai eksponensial dari nilai MarkGrowth. Gunakan kedua fungsi tersebut dalam satu SELECT-Statement
SELECT StudentID, FirstName, LastName, MOD(Semester1,2) as Semester1, Semester2, EXP(MarkGrowth) FROM students;	

-- Fungsi Text - CONCAT( )
SELECT studentid, CONCAT(firstname, lastname) AS name, semester1,semester2, markgrowth FROM students;

-- Fungsi Text - SUBSTRING_INDEX( )
SELECT studentid, substring_index(Email, '@', 1) AS name FROM students;

-- Fungsi Text - SUBSTR()
SELECT studentid, substr(firstname, 2, 3) AS initial FROM students;

-- Fungsi Text - LENGTH()
SELECT studentid, firstname, LENGTH(firstname) AS total_char FROM students;

-- Fungsi Text - REPLACE()
SELECT studentid, email, REPLACE(email, 'yahoo', 'gmail') AS new_email FROM students;

-- Tugas Praktek - Fungsi Text
SELECT studentid, UPPER(firstname) AS firstname, LOWER(lastname) AS lastname FROM students;

-- Fungsi Aggregate - SUM()
SELECT SUM(semester1) AS total_1, SUM(semester2) AS total_2 FROM students;

-- Fungsi Aggregate - COUNT()
SELECT COUNT(firstname) AS total_student FROM students;

-- Fungsi Aggregate - AVG()
SELECT AVG(semester1) AS avg_1, AVG(semester2) AS avg_2 FROM students;

-- Tugas Praktek - Fungsi Aggregate
SELECT MIN(semester1) AS min1, MAX(semester1) AS max1, MIN(semester2) AS min2, MAX(semester2) AS max2 FROM students;

-- Group by Single Column
SELECT province, COUNT(DISTINCT order_id) AS total_order, SUM(item_price) AS total_price FROM sales_retail_2019 GROUP BY province;

-- Group by Multiple Column
SELECT
    province,
    brand,
    COUNT(DISTINCT order_id) AS total_order,
    SUM(item_price) AS total_price
FROM
    sales_retail_2019
GROUP BY
    province,
    brand;

-- Fungsi Aggregate dengan Grouping
SELECT
    province,
    COUNT(DISTINCT order_id) AS total_unique_order,
    SUM(item_price) AS revenue
FROM
    sales_retail_2019
GROUP BY
    province;

-- tugas praktek (group by)
-- menggunakan tabel sales_retail_2019
SELECT
    MONTH(order_date) AS order_month,
    SUM(item_price) AS total_price,
    CASE
        WHEN sum(item_price) >= 30000000000 THEN 'Target Achieved'
        WHEN sum(item_price) <= 25000000000 THEN 'Less performed'
        ELSE 'Follow Up'
    END AS remark
FROM
    sales_retail_2019
GROUP BY
    MONTH(order_date);


-- Proyek Pekerjaan - Analisis Penjualan Part 1
-- 1. Total jumlah seluruh penjualan (total/revenue).
SELECT sum(total) as total
FROM tr_penjualan;

-- 2. Total quantity seluruh produk yang terjual.
SELECT sum(qty) as qty
FROM tr_penjualan;

-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, sum(qty) as qty, sum(total) as total
FROM tr_penjualan
GROUP BY kode_produk;


-- Proyek Pekerjaan - Analisis Penjualan Part 2
-- 4. Rata - Rata total belanja per kode pelanggan
SELECT
    kode_pelanggan,
    AVG(total) AS avg_total
FROM
    tr_penjualan
GROUP BY
    kode_pelanggan;

/* 5. Selain itu,  jangan lupa untuk menambahkan kolom baru 
 dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 
 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K. */
SELECT
    kode_transaksi,
    kode_pelanggan,
    no_urut,
    kode_produk,
    nama_produk,
    qty,
    total,
    CASE
        WHEN total > 300000 THEN 'High'
        WHEN total < 100000 THEN 'Low'
        ELSE 'Medium'
    END AS kategori
FROM
    tr_penjualan;

















