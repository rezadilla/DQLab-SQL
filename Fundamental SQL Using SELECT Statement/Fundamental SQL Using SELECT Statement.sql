USE dqlab;

-- Mengambil seluruh kolom pada table ms_produk
SELECT*FROM ms_produk;

-- Mengambil Satu Kolom dari Tabel ms_produk
SELECT nama_produk FROM ms_produk;

-- Mengambil lebih dari satu kolom
SELECT kode_produk, nama_produk FROM ms_produk;

-- Membatasi Pengambilan Jumlah Row Data
SELECT nama_produk FROM ms_produk limit 5;

-- Penggunaan SELECT DISTINCT statement
SELECT DISTINCT nama_customer, alamat FROM ms_pelanggan;

-- Menggunakan prefix pada nama kolom
SELECT ms_produk.nama_produk FROM ms_produk;

-- Menampilkan kolom kode_produk dari table ms_produk dengan penulisan menggunakan prefix nama table
SELECT ms_produk.kode_produk FROM ms_produk;

-- Menggunkan alias pada kolom
SELECT kode_produk AS product_code FROM ms_produk; 

-- memberikan alias pada dua kolom berikut: 1. no_urut menjadi nomor. 2. nama_produk menjadi nama.
SELECT no_urut AS nomor, nama_produk as nama FROM ms_produk;

-- Menghilangkan keyword AS
SELECT kode_produk product_code FROM ms_produk;

-- Memberikan alias pada dua kolom berikut tanpa menggunakan keyword AS: 1. no_urut menjadi nomor. 2. nama_produk menjadi nama.
SELECT no_urut nomor, nama_produk nama FROM ms_produk;

-- Menggunkan prefix dan alias
SELECT ms_produk.nama_produk AS nama from ms_produk;

-- Menampilkan kolom harga dari ms_produk dengan nama alias harga_jual lengkap dengan prefix.
SELECT ms_produk.harga AS harga_jual from ms_produk;

-- Menggunakan alias pada tabel
SELECT * FROM ms_produk AS t2;

-- Prefix dengan alias tabel
SELECT t2.kode_produk, t2.nama_produk FROM ms_produk AS t2;

-- Menggunakan WHERE
SELECT*FROM ms_produk WHERE nama_produk = 'Tas Travel Organizer DQLab';

-- Menggunakan Operand OR
SELECT
    *
FROM
    ms_produk
WHERE
    nama_produk = 'Gantungan Kunci DQLab'
    OR nama_produk = 'Tas Travel Organizer DQLab'
    OR nama_produk = 'Flashdisk DQLab 64 GB';

-- Filter untuk Angka
SELECT*FROM ms_produk WHERE harga > 50000;

-- Menggunakan Operand AND
SELECT * FROM ms_produk WHERE nama_produk = 'Gantungan Kunci DQLab' AND harga > 50000;

-- Proyek dari Cabang A
SELECT
    kode_pelanggan,
    nama_produk,
    qty,
    harga,
    qty * harga AS total
FROM
    tr_penjualan
WHERE
    qty * harga >= 100000
ORDER BY
    total DESC;

