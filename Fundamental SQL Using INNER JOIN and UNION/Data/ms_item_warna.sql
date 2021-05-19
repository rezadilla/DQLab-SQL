-- tabel ms_item_warna

USE dqlab

CREATE TABLE IF NOT EXISTS ms_item_warna (
	'nama_barang' VARCHAR(20) CHARACTER SET utf8,
	'warna' VARCHAR(20) CHARACTER SET utf8
);

INSERT INTO
	ms_item_warna
VALUES
	('apel', 'merah'),
    ('bayam', 'hijau'),
    ('daun bawang', 'hijau'),
    ('duku', 'kuning pekat'),
    ('durian', 'kuning'),
    ('gandum', 'coklat'),
    ('jambu air', 'merah'),
    ('jeruk', 'oranye');

