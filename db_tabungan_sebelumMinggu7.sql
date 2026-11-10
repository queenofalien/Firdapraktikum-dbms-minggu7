-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 04, 2026 at 03:18 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tabungan`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tabungan`
--

CREATE TABLE `jenis_tabungan` (
  `kode_jenis` char(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_jenis` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `setoran_awal_min` decimal(15,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_tabungan`
--

INSERT INTO `jenis_tabungan` (`kode_jenis`, `nama_jenis`, `setoran_awal_min`) VALUES
('01', 'Tabungan Reguler', '50000'),
('02', 'Tabungan Pelajar', '10000'),
('03', 'Tabungan Berjangka', '1000000');

-- --------------------------------------------------------

--
-- Table structure for table `kartu_atm`
--

CREATE TABLE `kartu_atm` (
  `no_kartu` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  `no_rekening` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_terbit` date NOT NULL,
  `tanggal_kadaluarsa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kartu_atm`
--

INSERT INTO `kartu_atm` (`no_kartu`, `no_rekening`, `tanggal_terbit`, `tanggal_kadaluarsa`) VALUES
('9000000000000001', '001-01-0001', '2024-06-10', '2029-06-30'),
('9000000000000002', '001-01-0003', '2024-07-01', '2029-07-31'),
('9000000000000003', '001-01-0006', '2024-08-20', '2029-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `kode_layanan` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_layanan` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_bulanan` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`kode_layanan`, `nama_layanan`, `biaya_bulanan`) VALUES
('EST', 'E-Statement', '0'),
('MBL', 'Mobile Banking', '5000'),
('SMS', 'Notifikasi SMS', '2500');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `no_rekening` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_nasabah` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kota_kab` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kelurahan` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `tanggal_buka` date NOT NULL,
  `saldo_akhir` decimal(15,0) NOT NULL DEFAULT '0',
  `status_aktif` enum('aktif','nonaktif') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'aktif',
  `kode_jenis` char(2) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`no_rekening`, `nama_nasabah`, `email`, `jenis_kelamin`, `alamat`, `kota_kab`, `kelurahan`, `tanggal_lahir`, `tanggal_buka`, `saldo_akhir`, `status_aktif`, `kode_jenis`) VALUES
('001-01-0001', 'Bambang Susilo', NULL, 'Laki-laki', 'Jl. Melati No. 25', 'Kota Pekalongan', 'Kauman', '2010-08-04', '2024-06-03', '500000', 'aktif', '01'),
('001-01-0002', 'Mawar Melati', NULL, 'Perempuan', 'Jl. Toba No. 20', 'Kota Pekalongan', 'Kauman', '2004-06-10', '2024-06-20', '1000000', 'aktif', '01'),
('001-01-0003', 'Bobi Nasution', NULL, 'Laki-laki', 'Jl. Kenanga No. 1', 'Kota Pekalongan', 'Medono', '2008-04-02', '2024-06-25', '2000000', 'aktif', '01'),
('001-01-0004', 'Nurul Sintya', NULL, 'Perempuan', 'Jl. Kenanga No. 5', 'Kota Pekalongan', 'Medono', '2006-08-09', '2024-08-10', '1500000', 'aktif', '01'),
('001-01-0005', 'Kenan Sudrajat', NULL, 'Laki-laki', 'Jl. Melati No. 1', 'Kabupaten Pekalongan', 'Kutosari', '2007-01-03', '2024-08-12', '5000000', 'aktif', '01'),
('001-01-0006', 'Siti Nurbaya', NULL, 'Perempuan', 'Jl. Anggrek No. 12', 'Kabupaten Pekalongan', 'Harjosari', '1999-10-08', '2024-08-15', '3500000', 'aktif', '01'),
('001-02-0007', 'Bayu Anggara', NULL, 'Laki-laki', 'Jl. Cempaka No. 7', 'Kota Pekalongan', 'Kauman', '2008-03-15', '2024-08-28', '100000', 'aktif', '02'),
('002-01-0008', 'Dewi Lestari', NULL, 'Perempuan', 'Jl. Mawar No. 3', 'Kabupaten Pekalongan', 'Kutosari', '1995-12-20', '2024-08-30', '750000', 'aktif', '01'),
('003-01-0011', 'Fajar Nugroho', NULL, 'Laki-laki', 'Jl. Pelangi No. 4', 'Kota Pekalongan', 'Pabean', '2002-05-12', '2024-09-02', '600000', 'aktif', '01'),
('003-01-0013', 'Hendra Wijaya', NULL, 'Laki-laki', 'Jl. Dahlia No. 2', 'Kota Pekalongan', 'Medono', '1988-01-30', '2024-09-12', '1300000', 'aktif', '01'),
('003-02-0012', 'Gita Permata', NULL, 'Perempuan', 'Jl. Seruni No. 9', 'Kabupaten Pekalongan', 'Kutosari', '2009-09-21', '2024-09-05', '350000', 'aktif', '02'),
('003-03-0014', 'Indah Permatasari', NULL, 'Perempuan', 'Jl. Kamboja No. 15', 'Kabupaten Pekalongan', 'Harjosari', '1992-11-14', '2024-09-15', '1500000', 'aktif', '03');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah_layanan`
--

CREATE TABLE `nasabah_layanan` (
  `no_rekening` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `kode_layanan` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_aktivasi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nasabah_layanan`
--

INSERT INTO `nasabah_layanan` (`no_rekening`, `kode_layanan`, `tanggal_aktivasi`) VALUES
('001-01-0001', 'MBL', '2024-07-15'),
('001-01-0001', 'SMS', '2024-06-05'),
('001-01-0003', 'MBL', '2024-07-02'),
('001-01-0006', 'EST', '2024-08-18'),
('002-01-0008', 'SMS', '2024-09-06'),
('003-01-0011', 'MBL', '2024-09-10'),
('003-01-0011', 'SMS', '2024-09-05'),
('003-01-0013', 'MBL', '2024-09-14'),
('003-02-0012', 'SMS', '2024-09-06'),
('003-03-0014', 'EST', '2024-09-16');

-- --------------------------------------------------------

--
-- Table structure for table `pemasukkan`
--

CREATE TABLE `pemasukkan` (
  `id_pemasukkan` int NOT NULL,
  `tanggal_waktu` datetime NOT NULL,
  `no_rekening` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `saldo_masuk` decimal(15,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemasukkan`
--

INSERT INTO `pemasukkan` (`id_pemasukkan`, `tanggal_waktu`, `no_rekening`, `saldo_masuk`) VALUES
(1, '2024-07-01 11:36:13', '001-01-0001', '200000'),
(2, '2024-07-08 11:36:13', '001-01-0003', '500000'),
(3, '2024-07-17 11:37:45', '001-01-0002', '15000'),
(4, '2024-08-22 06:37:45', '001-01-0004', '1000000'),
(5, '2024-08-22 06:40:42', '001-01-0006', '50000'),
(6, '2024-08-22 06:40:42', '001-01-0003', '250000'),
(7, '2024-08-22 06:41:16', '001-01-0005', '300000'),
(8, '2024-08-22 06:41:16', '001-01-0001', '400000'),
(9, '2024-09-02 09:15:30', '001-02-0007', '100000'),
(10, '2024-09-05 14:20:10', '002-01-0008', '750000'),
(11, '2024-09-02 08:15:00', '003-01-0011', '500000'),
(12, '2024-09-05 10:30:00', '003-02-0012', '250000'),
(13, '2024-09-12 09:05:00', '003-01-0013', '1000000'),
(14, '2024-09-15 15:20:00', '003-03-0014', '2000000'),
(15, '2024-09-23 08:40:00', '003-02-0012', '150000'),
(16, '2024-09-25 16:25:00', '003-01-0011', '400000'),
(17, '2024-09-30 09:30:00', '003-01-0013', '600000');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int NOT NULL,
  `tanggal_waktu` datetime NOT NULL,
  `no_rekening` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `saldo_keluar` decimal(15,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `tanggal_waktu`, `no_rekening`, `saldo_keluar`) VALUES
(1, '2024-07-10 10:05:00', '001-01-0001', '50000'),
(2, '2024-07-20 13:30:15', '001-01-0003', '200000'),
(3, '2024-08-01 08:45:30', '001-01-0002', '5000'),
(4, '2024-08-23 15:10:45', '001-01-0004', '300000'),
(5, '2024-08-25 16:25:00', '001-01-0005', '100000'),
(6, '2024-09-10 09:50:20', '002-01-0008', '150000'),
(7, '2024-09-09 13:45:00', '003-01-0011', '100000'),
(8, '2024-09-18 11:10:00', '003-02-0012', '50000'),
(9, '2024-09-20 14:00:00', '003-01-0013', '300000'),
(10, '2024-09-27 10:00:00', '003-03-0014', '500000'),
(11, '2024-10-02 13:15:00', '003-01-0011', '200000');

-- --------------------------------------------------------

--
-- Table structure for table `telepon_nasabah`
--

CREATE TABLE `telepon_nasabah` (
  `no_rekening` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `no_telepon` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `telepon_nasabah`
--

INSERT INTO `telepon_nasabah` (`no_rekening`, `no_telepon`) VALUES
('003-01-0011', '081300000011'),
('003-01-0011', '085700000011'),
('003-01-0013', '081300000013'),
('003-01-0013', '085700000013'),
('003-02-0012', '081300000012'),
('003-03-0014', '081300000014');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_audit_saldo`
-- (See below for the actual view)
--
CREATE TABLE `v_audit_saldo` (
`no_rekening` char(11)
,`nama_nasabah` varchar(100)
,`saldo_tersimpan` decimal(15,0)
,`saldo_hitung` decimal(38,0)
,`selisih` decimal(39,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kartu_status`
-- (See below for the actual view)
--
CREATE TABLE `v_kartu_status` (
`no_rekening` char(11)
,`nama_nasabah` varchar(100)
,`no_kartu_tersamar` varchar(19)
,`status_kartu` varchar(17)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kontak_nasabah`
-- (See below for the actual view)
--
CREATE TABLE `v_kontak_nasabah` (
`no_rekening` char(11)
,`nama_nasabah` varchar(100)
,`no_telepon_tersamar` varchar(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_mutasi`
-- (See below for the actual view)
--
CREATE TABLE `v_mutasi` (
`tanggal_waktu` datetime
,`no_rekening` char(11)
,`jenis` varchar(5)
,`nominal` decimal(15,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nasabah_aktif`
-- (See below for the actual view)
--
CREATE TABLE `v_nasabah_aktif` (
`no_rekening` char(11)
,`nama_nasabah` varchar(100)
,`email` varchar(100)
,`status_aktif` enum('aktif','nonaktif')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nasabah_layanan`
-- (See below for the actual view)
--
CREATE TABLE `v_nasabah_layanan` (
`nama_nasabah` varchar(100)
,`nama_layanan` varchar(60)
,`tanggal_aktivasi` date
,`biaya_bulanan` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nasabah_petugas`
-- (See below for the actual view)
--
CREATE TABLE `v_nasabah_petugas` (
`no_rekening` char(11)
,`nama_nasabah` varchar(100)
,`nama_jenis` varchar(50)
,`kelurahan` varchar(60)
,`kota_kab` varchar(60)
,`status_aktif` enum('aktif','nonaktif')
,`saldo_akhir` decimal(15,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pemantauan`
-- (See below for the actual view)
--
CREATE TABLE `v_pemantauan` (
`no_rekening` char(11)
,`nama_nasabah` varchar(100)
,`alasan` varchar(44)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ringkasan_jenis`
-- (See below for the actual view)
--
CREATE TABLE `v_ringkasan_jenis` (
`nama_jenis` varchar(50)
,`jumlah_nasabah` bigint
,`total_saldo` decimal(37,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_saldo_per_kelurahan`
-- (See below for the actual view)
--
CREATE TABLE `v_saldo_per_kelurahan` (
`kelurahan` varchar(60)
,`kota` varchar(60)
,`jumlah_nasabah` bigint
,`total_saldo` decimal(37,0)
);

-- --------------------------------------------------------

--
-- Structure for view `v_audit_saldo`
--
DROP TABLE IF EXISTS `v_audit_saldo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_audit_saldo`  AS SELECT `n`.`no_rekening` AS `no_rekening`, `n`.`nama_nasabah` AS `nama_nasabah`, `n`.`saldo_akhir` AS `saldo_tersimpan`, (coalesce(`m`.`total`,0) - coalesce(`k`.`total`,0)) AS `saldo_hitung`, (`n`.`saldo_akhir` - (coalesce(`m`.`total`,0) - coalesce(`k`.`total`,0))) AS `selisih` FROM ((`nasabah` `n` left join (select `pemasukkan`.`no_rekening` AS `no_rekening`,sum(`pemasukkan`.`saldo_masuk`) AS `total` from `pemasukkan` group by `pemasukkan`.`no_rekening`) `m` on((`n`.`no_rekening` = `m`.`no_rekening`))) left join (select `pengeluaran`.`no_rekening` AS `no_rekening`,sum(`pengeluaran`.`saldo_keluar`) AS `total` from `pengeluaran` group by `pengeluaran`.`no_rekening`) `k` on((`n`.`no_rekening` = `k`.`no_rekening`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_kartu_status`
--
DROP TABLE IF EXISTS `v_kartu_status`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kartu_status`  AS SELECT `n`.`no_rekening` AS `no_rekening`, `n`.`nama_nasabah` AS `nama_nasabah`, (case when (`k`.`no_kartu` is null) then NULL else concat(left(`k`.`no_kartu`,4),' **** **** ',right(`k`.`no_kartu`,4)) end) AS `no_kartu_tersamar`, (case when (`k`.`no_kartu` is null) then 'Belum punya kartu' when (`k`.`tanggal_kadaluarsa` >= '2029-07-15') then 'Aktif' else 'Kadaluarsa' end) AS `status_kartu` FROM (`nasabah` `n` left join `kartu_atm` `k` on((`n`.`no_rekening` = `k`.`no_rekening`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_kontak_nasabah`
--
DROP TABLE IF EXISTS `v_kontak_nasabah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kontak_nasabah`  AS SELECT `n`.`no_rekening` AS `no_rekening`, `n`.`nama_nasabah` AS `nama_nasabah`, concat(left(`t`.`no_telepon`,4),'****',right(`t`.`no_telepon`,3)) AS `no_telepon_tersamar` FROM (`nasabah` `n` join `telepon_nasabah` `t` on((`n`.`no_rekening` = `t`.`no_rekening`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_mutasi`
--
DROP TABLE IF EXISTS `v_mutasi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mutasi`  AS SELECT `pemasukkan`.`tanggal_waktu` AS `tanggal_waktu`, `pemasukkan`.`no_rekening` AS `no_rekening`, 'Setor' AS `jenis`, `pemasukkan`.`saldo_masuk` AS `nominal` FROM `pemasukkan` union all select `pengeluaran`.`tanggal_waktu` AS `tanggal_waktu`,`pengeluaran`.`no_rekening` AS `no_rekening`,'Tarik' AS `Tarik`,-(`pengeluaran`.`saldo_keluar`) AS `-saldo_keluar` from `pengeluaran`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_nasabah_aktif`
--
DROP TABLE IF EXISTS `v_nasabah_aktif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nasabah_aktif`  AS SELECT `nasabah`.`no_rekening` AS `no_rekening`, `nasabah`.`nama_nasabah` AS `nama_nasabah`, `nasabah`.`email` AS `email`, `nasabah`.`status_aktif` AS `status_aktif` FROM `nasabah` WHERE (`nasabah`.`status_aktif` = 'aktif') WITH CASCADED CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `v_nasabah_layanan`
--
DROP TABLE IF EXISTS `v_nasabah_layanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nasabah_layanan`  AS SELECT `n`.`nama_nasabah` AS `nama_nasabah`, `l`.`nama_layanan` AS `nama_layanan`, `nl`.`tanggal_aktivasi` AS `tanggal_aktivasi`, `l`.`biaya_bulanan` AS `biaya_bulanan` FROM ((`nasabah` `n` join `nasabah_layanan` `nl` on((`n`.`no_rekening` = `nl`.`no_rekening`))) join `layanan` `l` on((`nl`.`kode_layanan` = `l`.`kode_layanan`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_nasabah_petugas`
--
DROP TABLE IF EXISTS `v_nasabah_petugas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nasabah_petugas`  AS SELECT `n`.`no_rekening` AS `no_rekening`, `n`.`nama_nasabah` AS `nama_nasabah`, `j`.`nama_jenis` AS `nama_jenis`, `n`.`kelurahan` AS `kelurahan`, `n`.`kota_kab` AS `kota_kab`, `n`.`status_aktif` AS `status_aktif`, `n`.`saldo_akhir` AS `saldo_akhir` FROM (`nasabah` `n` join `jenis_tabungan` `j` on((`n`.`kode_jenis` = `j`.`kode_jenis`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_pemantauan`
--
DROP TABLE IF EXISTS `v_pemantauan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pemantauan`  AS SELECT `n`.`no_rekening` AS `no_rekening`, `n`.`nama_nasabah` AS `nama_nasabah`, (case when ((not exists(select 1 from `pengeluaran` `p` where (`p`.`no_rekening` = `n`.`no_rekening`))) and (not exists(select 1 from `nasabah_layanan` `nl` where (`nl`.`no_rekening` = `n`.`no_rekening`)))) then 'Belum pernah menarik dan belum punya layanan' when (not exists(select 1 from `pengeluaran` `p` where (`p`.`no_rekening` = `n`.`no_rekening`))) then 'Belum pernah menarik' else 'Belum punya layanan' end) AS `alasan` FROM `nasabah` AS `n` WHERE (exists(select 1 from `pengeluaran` `p` where (`p`.`no_rekening` = `n`.`no_rekening`)) is false OR exists(select 1 from `nasabah_layanan` `nl` where (`nl`.`no_rekening` = `n`.`no_rekening`)) is false)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_ringkasan_jenis`
--
DROP TABLE IF EXISTS `v_ringkasan_jenis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ringkasan_jenis`  AS SELECT `j`.`nama_jenis` AS `nama_jenis`, count(`n`.`no_rekening`) AS `jumlah_nasabah`, coalesce(sum(`n`.`saldo_akhir`),0) AS `total_saldo` FROM (`jenis_tabungan` `j` left join `nasabah` `n` on((`j`.`kode_jenis` = `n`.`kode_jenis`))) GROUP BY `j`.`kode_jenis`, `j`.`nama_jenis``nama_jenis`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_saldo_per_kelurahan`
--
DROP TABLE IF EXISTS `v_saldo_per_kelurahan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_saldo_per_kelurahan`  AS SELECT `nasabah`.`kelurahan` AS `kelurahan`, `nasabah`.`kota_kab` AS `kota`, count(0) AS `jumlah_nasabah`, sum(`nasabah`.`saldo_akhir`) AS `total_saldo` FROM `nasabah` GROUP BY `nasabah`.`kelurahan`, `nasabah`.`kota_kab``kota_kab`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_tabungan`
--
ALTER TABLE `jenis_tabungan`
  ADD PRIMARY KEY (`kode_jenis`);

--
-- Indexes for table `kartu_atm`
--
ALTER TABLE `kartu_atm`
  ADD PRIMARY KEY (`no_kartu`),
  ADD UNIQUE KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`kode_layanan`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`no_rekening`),
  ADD KEY `fk_nasabah_jenis` (`kode_jenis`);

--
-- Indexes for table `nasabah_layanan`
--
ALTER TABLE `nasabah_layanan`
  ADD PRIMARY KEY (`no_rekening`,`kode_layanan`),
  ADD KEY `fk_nl_layanan` (`kode_layanan`);

--
-- Indexes for table `pemasukkan`
--
ALTER TABLE `pemasukkan`
  ADD PRIMARY KEY (`id_pemasukkan`),
  ADD KEY `fk_masuk_nasabah` (`no_rekening`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `fk_keluar_nasabah` (`no_rekening`);

--
-- Indexes for table `telepon_nasabah`
--
ALTER TABLE `telepon_nasabah`
  ADD PRIMARY KEY (`no_rekening`,`no_telepon`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemasukkan`
--
ALTER TABLE `pemasukkan`
  MODIFY `id_pemasukkan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kartu_atm`
--
ALTER TABLE `kartu_atm`
  ADD CONSTRAINT `fk_kartu_nasabah` FOREIGN KEY (`no_rekening`) REFERENCES `nasabah` (`no_rekening`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `fk_nasabah_jenis` FOREIGN KEY (`kode_jenis`) REFERENCES `jenis_tabungan` (`kode_jenis`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `nasabah_layanan`
--
ALTER TABLE `nasabah_layanan`
  ADD CONSTRAINT `fk_nl_layanan` FOREIGN KEY (`kode_layanan`) REFERENCES `layanan` (`kode_layanan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nl_nasabah` FOREIGN KEY (`no_rekening`) REFERENCES `nasabah` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemasukkan`
--
ALTER TABLE `pemasukkan`
  ADD CONSTRAINT `fk_masuk_nasabah` FOREIGN KEY (`no_rekening`) REFERENCES `nasabah` (`no_rekening`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `fk_keluar_nasabah` FOREIGN KEY (`no_rekening`) REFERENCES `nasabah` (`no_rekening`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `telepon_nasabah`
--
ALTER TABLE `telepon_nasabah`
  ADD CONSTRAINT `fk_telp_nasabah` FOREIGN KEY (`no_rekening`) REFERENCES `nasabah` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
