3. Query Kompleks & Agregasi Laporan
SELECT 
    p.nama_petugas, 
    n.nama, 
    COUNT(rp.id_request) AS total_penjemputan
FROM request_penjemputan1 rp
JOIN petugas1 p ON rp.id_petugas = p.id_petugas
JOIN nasabah1 n ON rp.id_nasabah = n.id_nasabah
WHERE rp.status_request = 'Selesai'
GROUP BY p.id_petugas, p.nama_petugas, n.nama;
