ALTER TABLE nasabah ADD total_poin INT NOT NULL DEFAULT 0;

CREATE TABLE hadiah (
  id_hadiah       INT AUTO_INCREMENT PRIMARY KEY,
  nama_hadiah     VARCHAR(100) NOT NULL,
  poin_dibutuhkan INT NOT NULL,
  stok            INT NOT NULL DEFAULT 0
);

CREATE TABLE penukaran_poin (
  id_penukaran      INT AUTO_INCREMENT PRIMARY KEY,
  tanggal_penukaran DATETIME DEFAULT CURRENT_TIMESTAMP,
  jumlah            INT NOT NULL DEFAULT 1,
  status_penukaran  ENUM('diproses','selesai','dibatalkan') DEFAULT 'diproses',
  id_pengguna       INT NOT NULL,
  id_hadiah         INT NOT NULL,
  FOREIGN KEY (id_pengguna) REFERENCES nasabah(id_pengguna),
  FOREIGN KEY (id_hadiah)   REFERENCES hadiah(id_hadiah)
);

-- CRUD
INSERT INTO hadiah (nama_hadiah, poin_dibutuhkan, stok) VALUES
('Beras 1 kg', 100, 20), ('Pulsa 10rb', 150, 50), ('Minyak goreng 1 L', 200, 10);
INSERT INTO penukaran_poin (jumlah, id_pengguna, id_hadiah) VALUES (2, 1, 1);
SELECT * FROM hadiah WHERE stok > 0;
UPDATE penukaran_poin SET status_penukaran = 'selesai' WHERE id_penukaran = 1;
DELETE FROM penukaran_poin WHERE status_penukaran = 'dibatalkan';

-- JOIN + WHERE + GROUP BY + agregat
SELECT n.id_pengguna, pg.nama,
       COUNT(pp.id_penukaran)             AS jumlah_transaksi,
       SUM(pp.jumlah * h.poin_dibutuhkan) AS total_poin_dipakai
FROM penukaran_poin pp
JOIN nasabah  n  ON n.id_pengguna  = pp.id_pengguna
JOIN pengguna pg ON pg.id_pengguna = n.id_pengguna
JOIN hadiah   h  ON h.id_hadiah    = pp.id_hadiah
WHERE pp.status_penukaran = 'selesai'
GROUP BY n.id_pengguna, pg.nama
ORDER BY total_poin_dipakai DESC;
