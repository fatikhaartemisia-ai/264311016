2. Read
  -- [Read] Menampilkan Seluruh Isi Tabel Induk (nasabah1)
SELECT * FROM nasabah1;
-- [Update] Mengubah Nilai Data pada Tabel Transaksi (request_penjemputan)
UPDATE request_penjemputan 
SET status_request = 'Selesai' 
WHERE id_request = 3;
-- [Delete] Menghapus Baris Data pada Tabel Transaksi (request_penjemputan)
DELETE FROM request_penjemputan 
WHERE id_request = 3;
