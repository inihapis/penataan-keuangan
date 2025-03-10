<?php
// include('dbconnected.php');
include('koneksi.php');

// Ambil data dari GET
$id = (int) $_GET['id_pengeluaran'];
$tgl = $_GET['tgl_pengeluaran'];
$jumlah = abs((int) $_GET['jumlah']);
$sumber = abs((int) $_GET['id_sumber']);
$bank = abs((int) $_GET['id_bank']);

// Validasi format tanggal (harus YYYY-MM-DD)
if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $tgl)) {
    die("Format tanggal tidak valid!");
}

// Query update dengan prepared statement
$stmt = $koneksi->prepare("UPDATE pengeluaran
    SET tgl_pengeluaran = ?, jumlah = ?, id_sumber = ?, id_bank = ? 
    WHERE id_pengeluaran = ?");
$stmt->bind_param("siiii", $tgl, $jumlah, $sumber, $bank, $id);

// Eksekusi query
if ($stmt->execute()) {
    write_log("Nama Admin : ".$namaadmin." => Edit Pengeluaran => ".$id." => Sukses Edit");
    header("location:pengeluaran.php");
    exit();
} else {
    write_log("Nama Admin : ".$namaadmin." => Edit Pengeluaran => ".$id." => Gagal Edit");
    echo "ERROR, data gagal diupdate: " . $stmt->error;
}

// Tutup statement
$stmt->close();

// Definisikan fungsi write_log jika belum ada
function write_log($message) {
    $log_file = 'log.txt'; // Nama file log
    $current_time = date('Y-m-d H:i:s'); // Waktu saat ini
    $formatted_message = $current_time . " - " . $message . PHP_EOL; // Format pesan log
    file_put_contents($log_file, $formatted_message, FILE_APPEND); // Menulis ke file log
}
?>