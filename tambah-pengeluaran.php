<?php
//include('dbconnected.php');
include('koneksi.php');

$tgl_pengeluaran = $_GET['tgl_pengeluaran'];
$jumlah = $_GET['jumlah'];
$sumber = $_GET['sumber'];
$bank = $_GET['bank']; // Ambil ID bank dari form input

//query insert
$query = mysqli_query($koneksi, "INSERT INTO `pengeluaran` (`tgl_pengeluaran`, `jumlah`, `id_sumber`, `id_bank`) 
VALUES ('$tgl_pengeluaran', '$jumlah', '$sumber', '$bank')");

if ($query) {
    // Redirect ke halaman pendapatan
    header("location:pengeluaran.php");
} else {
    echo "ERROR, data gagal disimpan: " . mysqli_error($koneksi);
}
?>
