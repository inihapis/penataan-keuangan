<?php

session_start();

include('koneksi.php');

 define('LOG','log.txt');
function write_log($log){  
 $time = @date('[Y-d-m:H:i:s]');
 $op=$time.' '.$log."\n".PHP_EOL;
 $fp = @fopen(LOG, 'a');
 $write = @fwrite($fp, $op);
 @fclose($fp);
}

$id = (int) $_GET['id_pemasukan'];
$tgl = $_GET['tgl_pemasukan'];
$jumlah = abs((int) $_GET['jumlah']);
$sumber = abs((int) $_GET['id_sumber']);
$bank = abs((int) $_GET['id_bank']);

// Validasi format tanggal (harus YYYY-MM-DD)
if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $tgl)) {
    die("Format tanggal tidak valid!");
}

// Query update dengan prepared statement
$stmt = $koneksi->prepare("UPDATE pemasukan 
    SET tgl_pemasukan = ?, jumlah = ?, id_sumber = ?, id_bank = ? 
    WHERE id_pemasukan = ?");
$stmt->bind_param("siiii", $tgl, $jumlah, $sumber, $bank, $id);

// Eksekusi query
if ($stmt->execute()) {
    echo "Data berhasil diperbarui.";
} else {
    echo "Error: " . $stmt->error;
}

// Tutup statement
$stmt->close();


$stmt = $koneksi->prepare("UPDATE pemasukan 
SET tgl_pemasukan = ?, jumlah = ?, id_sumber = ?, id_bank = ? 
WHERE id_pemasukan = ?");
$stmt->bind_param("siiii", $tgl, $jumlah, $sumber, $bank, $id);

if ($stmt->execute()) {
    write_log("Nama Admin : ".$namaadmin." => Edit Pemasukan => ".$id." => Sukses Edit");
    header("location:pendapatan.php");
    exit();
} else {
    write_log("Nama Admin : ".$namaadmin." => Edit Pemasukan => ".$id." => Gagal Edit");
    echo "ERROR, data gagal diupdate: " . $stmt->error;
}

$stmt->close();
