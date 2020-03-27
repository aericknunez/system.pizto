<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

include_once 'application/common/Alerts.php';
include_once 'system/historial/Historial.php';


	echo '<div id="SyncMonitor">';	
	$historial = new Historial;
	$historial->SyncStatus("sync/database/");
	echo '</div>';

 ?>
