<?php
  // header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
  // header("Expires: Sat, 1 Jul 2000 05:00:00 GMT"); // Fecha en el pasado
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

   <title><?php echo $_SESSION['config_sistema'] . " - " . TYPE; ?></title>

    <link rel="stylesheet" href="assets/css/font-awesome-582.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/mdb.min.css" rel="stylesheet">
    <style>
    	a:active {
		     position: relative;
		     top: 5px;
		}
    </style>
    <link href="assets/css/galeria.css" rel="stylesheet">

<!--     <style>body { overflow-x: hidden; padding-left: 15px; }</style>
 -->
</head>