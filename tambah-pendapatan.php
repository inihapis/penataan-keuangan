<?php
//include('dbconnected.php');
include('koneksi.php');

$tgl_pemasukan = $_GET['tgl_pemasukan'];
$jumlah = $_GET['jumlah'];
$sumber = $_GET['sumber'];
$bank = $_GET['bank']; // Ambil ID bank dari form input

//query insert
$query = mysqli_query($koneksi, "INSERT INTO `pemasukan` (`tgl_pemasukan`, `jumlah`, `id_sumber`, `id_bank`) VALUES ('$tgl_pemasukan', '$jumlah', '$sumber', '$bank')");

if ($query) {
    // Redirect ke halaman pendapatan
    header("location:pendapatan.php");
} else {
    echo "ERROR, data gagal disimpan: " . mysqli_error($koneksi);
}
?>
