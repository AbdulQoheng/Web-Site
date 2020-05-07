<?php
    
    $host = "localhost";
	$username = "root";
	$password = "";
	$database = "db_website";
	$koneksi = mysqli_connect($host, $username, $password, $database);

	if (!$koneksi) {
        echo "Server not connected";
    }

    function potongteks($teks, $jumlah_karakter){
        $karakter = $teks{$jumlah_karakter-1};
        while($karakter != ' '){
            $karakter = $teks{--$jumlah_karakter};
        }
        return substr($teks, 0, $jumlah_karakter);
    }
    
    function query($sql){
        global $koneksi;
        $hasil = mysqli_query($koneksi, $sql);
        $array_artikel = array();
        while($data_artikel = mysqli_fetch_assoc($hasil)){
            $array_artikel[] = $data_artikel;
        }
        return $array_artikel;
    }

?>