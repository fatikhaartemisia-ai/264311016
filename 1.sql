1. Create
  -- 1. Tabel Induk 1: nasabah1
CREATE TABLE nasabah1 (
    id_nasabah INT AUTO_INCREMENT PRIMARY KEY,
    nama_nasabah VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    no_telepon VARCHAR(15) NOT NULL
) ENGINE=InnoDB;

-- 2. Tabel Induk 2: petugas1
CREATE TABLE petugas1 (
    id_petugas INT AUTO_INCREMENT PRIMARY KEY,
    nama_petugas VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(15) NOT NULL
) ENGINE=InnoDB;

-- 3. Tabel Transaksi: request_penjemputan1
CREATE TABLE request_penjemputan1 (
    id_request INT AUTO_INCREMENT PRIMARY KEY,
    id_nasabah INT NOT NULL,
    id_petugas INT NOT NULL,
    tanggal_request DATE NOT NULL,
    status_request VARCHAR(20) NOT NULL,
    CONSTRAINT fk_request_nasabah1 FOREIGN KEY (id_nasabah) REFERENCES nasabah1(id_nasabah) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_request_petugas1 FOREIGN KEY (id_petugas) REFERENCES petugas1(id_petugas) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Insert Tabel nasabah1
INSERT INTO nasabah1 (nama, alamat, no_telepon) VALUES
('Ahmad Fauzi', 'Jl. Merdeka No. 10, Madiun', '081234567890'),
('Siti Aminah', 'Jl. Pahlawan No. 25, Madiun', '081987654321'),
('Budi Santoso', 'Jl. Diponegoro No. 5, Madiun', '081122334455');

-- Insert Tabel petugas1
INSERT INTO petugas1 (nama_petugas, no_telepon) VALUES
('Joko Widodo', '085611223344'),
('Dewi Lestari', '085755667788'),
('Rian Utama', '085999887766');

-- Insert Tabel request_penjemputan (Transaksi)
INSERT INTO request_penjemputan1 (id_nasabah, id_petugas, tanggal_request, status_request) VALUES
(1, 1, '2026-06-01', 'Selesai'),
(2, 2, '2026-06-02', 'Selesai'),
(3, 3, '2026-06-03', 'Pending');

