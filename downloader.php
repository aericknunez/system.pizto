<?php
$info = new SplFileInfo($_REQUEST["data"]);
$ext = $info->getExtension();

$nombre =  $_REQUEST["name"] . ".". $ext;

/// type
/// 1 . back up // system/bdbackup/backup/
if($_REQUEST["type"] == 1) $t = "system/bdbackup/backup/" .$_SESSION["td"] . "/";


$filename = $t . $_REQUEST["data"]; 
$size = filesize($filename); 
header("Content-Transfer-Encoding: binary"); 
header("Content-type: application/force-download"); 
header("Content-Disposition: attachment; filename=$nombre"); 
header("Content-Length: $size"); 
readfile("$filename"); 

?>  