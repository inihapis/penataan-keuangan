-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 10 Mar 2025 pada 08.18
-- Versi server: 8.0.30
-- Versi PHP: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keuangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `nama` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `pass`) VALUES
(1, 'saiful', 'saiful@mail.com', 'tes123'),
(2, 'contoh', 'contoh@mail.com', 'tes123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `id_bank` int NOT NULL,
  `nama_bank` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `bank`
--

INSERT INTO `bank` (`id_bank`, `nama_bank`) VALUES
(1, 'mandiri'),
(2, 'BRI'),
(3, 'BCA'),
(4, 'BNI'),
(5, 'BSI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan`
--

CREATE TABLE `catatan` (
  `id_catatan` int NOT NULL,
  `catatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catatan`
--

INSERT INTO `catatan` (`id_catatan`, `catatan`) VALUES
(1, 'Besok, Hari minggu akan ada kunjungan dari pihak dinas untuk mengecek kinerja karyawan.'),
(2, 'Hari Kamis jam 8 akan ada rapat, diharapkan kepada semua karyawan agar dapat berhadir.'),
(3, 'Tingkatkan lagi pendapatan, dan minimalkan pengeluaran'),
(4, 'tgl 6 domain dan hosting banyak yang akan expired, dan harus diperpanjang lagi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hutang`
--

CREATE TABLE `hutang` (
  `id_hutang` int NOT NULL,
  `jumlah` int NOT NULL,
  `tgl_hutang` date NOT NULL,
  `alasan` text NOT NULL,
  `penghutang` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hutang`
--

INSERT INTO `hutang` (`id_hutang`, `jumlah`, `tgl_hutang`, `alasan`, `penghutang`) VALUES
(5, 0, '2019-10-19', '', ''),
(6, 0, '2019-10-20', '', ''),
(9, 0, '2019-10-23', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int NOT NULL,
  `nama` varchar(40) NOT NULL,
  `posisi` varchar(40) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `umur` int NOT NULL,
  `kontak` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `posisi`, `alamat`, `umur`, `kontak`) VALUES
(6, 'contoh', 'Bendahara', 'Bandung', 17, '08333333333');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id_pemasukan` int NOT NULL,
  `tgl_pemasukan` date NOT NULL,
  `jumlah` int NOT NULL,
  `id_sumber` int NOT NULL,
  `id_bank` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemasukan`
--

INSERT INTO `pemasukan` (`id_pemasukan`, `tgl_pemasukan`, `jumlah`, `id_sumber`, `id_bank`) VALUES
(1, '2025-03-10', 500000, 1, 1),
(26, '2025-03-10', 1000000, 1, 1),
(27, '2024-12-17', 500000, 1, 4),
(28, '2024-12-20', 5000000, 1, 0),
(29, '2024-12-20', 1000000, 5, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int NOT NULL,
  `tgl_pengeluaran` date NOT NULL,
  `jumlah` int NOT NULL,
  `id_sumber` int NOT NULL,
  `id_bank` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `tgl_pengeluaran`, `jumlah`, `id_sumber`, `id_bank`) VALUES
(21, '2024-12-12', 500000, 1, 3),
(22, '2024-12-12', 100000, 1, 1),
(23, '2024-12-18', 300000, 1, 5),
(24, '2024-12-19', 50000, 1, 1),
(25, '2025-03-10', 1000000, 1, 4),
(26, '2024-12-20', 1000000, 6, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sumber`
--

CREATE TABLE `sumber` (
  `id_sumber` int NOT NULL,
  `nama` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sumber`
--

INSERT INTO `sumber` (`id_sumber`, `nama`) VALUES
(1, 'Buat Web Pemerintah'),
(2, 'Desain Poster Lomba'),
(3, 'Instalasi Softwre'),
(4, 'Instalasi OS'),
(5, 'Buat Video Animasi'),
(6, 'Domain'),
(7, 'Hosting'),
(8, 'Listrik'),
(9, 'Air'),
(10, 'Wifi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uang`
--

CREATE TABLE `uang` (
  `id_uang` int NOT NULL,
  `tgl_uang` date NOT NULL,
  `id_pengeluaran` int DEFAULT NULL,
  `id_pendapatan` int DEFAULT NULL,
  `jumlah` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `uang`
--

INSERT INTO `uang` (`id_uang`, `tgl_uang`, `id_pengeluaran`, `id_pendapatan`, `jumlah`) VALUES
(1, '2019-10-23', NULL, 1, 500000),
(2, '2019-10-24', 2, NULL, 10000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indeks untuk tabel `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id_catatan`);

--
-- Indeks untuk tabel `hutang`
--
ALTER TABLE `hutang`
  ADD PRIMARY KEY (`id_hutang`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`),
  ADD KEY `id_sumber` (`id_sumber`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `id_sumber` (`id_sumber`);

--
-- Indeks untuk tabel `sumber`
--
ALTER TABLE `sumber`
  ADD PRIMARY KEY (`id_sumber`);

--
-- Indeks untuk tabel `uang`
--
ALTER TABLE `uang`
  ADD PRIMARY KEY (`id_uang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id_catatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `hutang`
--
ALTER TABLE `hutang`
  MODIFY `id_hutang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id_pemasukan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `sumber`
--
ALTER TABLE `sumber`
  MODIFY `id_sumber` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `uang`
--
ALTER TABLE `uang`
  MODIFY `id_uang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
