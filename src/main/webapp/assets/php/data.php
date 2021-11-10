<?php

$serverName = "localhost";
$username = "root";
$password = "";
$databaseName = "craigs_database";

$connection = mysqli_connect($serverName, $username, $password, $databaseName);
if (!$connection)  die("Connection failed: " . mysqli_connect_error());

mysqli_set_charset($connection, "utf8");

$queryData = mysqli_query( $connection, "SELECT id, title, latitude, longitude, address FROM items" );

//$data = mysqli_fetch_all( $queryData, MYSQLI_ASSOC );
// This is alternative if your server doesn't support "mysqli_fetch_all"
$data = mysqli_fetch_all_alt( $queryData );

mysqli_close($connection);

echo( json_encode($data) );

function mysqli_fetch_all_alt($result) {
    $select = array();
    while( $row = mysqli_fetch_assoc($result) ) {
        $select[] = $row;
    }
    return $select;
}