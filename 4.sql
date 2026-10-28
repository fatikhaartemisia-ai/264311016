- 1. Membuat Tabel Master Nasabah 
-- (Catatan: Disesuaikan dengan atribut yang ada pada proyek kelompok Anda)
CREATE TABLE Nasabah (
    id_nasabah INT AUTO_INCREMENT,
    nama_nasabah VARCHAR(100) NOT NULL,
    no_telp_nasabah VARCHAR(15) NOT NULL,
    alamat_nasabah TEXT NOT NULL,
    CONSTRAINT pk_nasabah PRIMARY KEY (id_nasabah)
);

-- 2. Membuat Tabel Master Kurir (Entitas Baru)
CREATE TABLE Kurir (
    id_kurir INT AUTO_INCREMENT,
    nama_kurir VARCHAR(100) NOT NULL,
    no_telepon_kurir VARCHAR(15) UNIQUE NOT NULL,
    status_ketersediaan VARCHAR(20) DEFAULT 'Tersedia',
    CONSTRAINT pk_kurir PRIMARY KEY (id_kurir),
    -- Validasi agar status kurir tidak bisa diisi sembarangan
    CONSTRAINT chk_status_kurir CHECK (status_ketersediaan IN ('Tersedia', 'Sibuk', 'Off'))
);

-- 3. Membuat Tabel Transaksi Request Penjemputan (Entitas Baru Penghubung)
CREATE TABLE Request_Penjemputan (
    id_request INT AUTO_INCREMENT,
    tanggal_request DATE NOT NULL,
    alamat_jemput TEXT NOT NULL,
    status_jemput VARCHAR(20) DEFAULT 'Pending',
    id_nasabah INT NOT NULL, 
    id_kurir INT DEFAULT NULL, -- NULL berarti request belum diambil oleh kurir manapun
    CONSTRAINT pk_request PRIMARY KEY (id_request),
    
    -- Hubungan Foreign Key ke Tabel Nasabah
    CONSTRAINT fk_request_nasabah 
        FOREIGN KEY (id_nasabah) REFERENCES Nasabah(id_nasabah) 
        ON DELETE CASCADE,
        
    -- Hubungan Foreign Key ke Tabel Kurir
    CONSTRAINT fk_request_kurir 
        FOREIGN KEY (id_kurir) REFERENCES Kurir(id_kurir) 
        ON DELETE SET NULL,
        
    -- Validasi alur status penjemputan sampah
    CONSTRAINT chk_status_jemput CHECK (status_jemput IN ('Pending', 'Diproses', 'Selesai', 'Dibatalkan'))
);
