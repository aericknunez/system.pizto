<?php
include_once '../../application/common/Helpers.php'; // [Para todo]
include_once '../../application/includes/variables_db.php';
include_once '../../application/common/Mysqli.php';
include_once '../../application/includes/DataLogin.php';
$db = new dbConn();
$seslog = new Login();
$seslog->sec_session_start();


if($_REQUEST["fecha"] != NULL){
  $fecha = $_REQUEST["fecha"];
} else {
  $fecha = date("d-m-Y");
}



if ($seslog->login_check() == TRUE) {

include_once '../../application/common/Fechas.php';
include_once '../../application/common/Alerts.php';


if($fecha != NULL){


// $objPHPExcel->getColumnDimension('C')->setAutoSize(true);


$a = $db->query("SELECT * FROM ticket WHERE fecha = '$fecha' and td = ".$_SESSION["td"]." order by time desc");


    if($a->num_rows > 0){

require_once '../../application/common/PHPExcel.php';

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Hibrido")
                      ->setLastModifiedBy("Hibrido")
                      ->setTitle("Office 2007 XLSX Documento de reporte")
                      ->setSubject("Office 2007 XLSX Documento de reporte")
                      ->setDescription("Documento generado por Hibrido y su sistema Pizto.")
                      ->setKeywords("office 2007 openxml")
                      ->setCategory("Archivo de Reporte");



$objPHPExcel->getDefaultStyle()->getFont()->setName('Arial')
                                          ->setSize(12);

// Add encabezado
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'CANTIDAD')
            ->setCellValue('B1', 'PRODUCTO')
            ->setCellValue('C1', 'FACTURA')
            ->setCellValue('D1', 'FECHA')
            ->setCellValue('E1', 'PAGO')
            ->setCellValue('F1', 'PRECIO DE VENTA')
            ->setCellValue('G1', 'TOTAL');
 


$fila = 1;   
   foreach ($a as $b) {

$fila = $fila + 1; 
$objPHPExcel->setActiveSheetIndex(0)
          ->setCellValue('A' . $fila, $b["cant"])
          ->setCellValue('B' . $fila, $b["producto"])
          ->setCellValue('C' . $fila, $b["num_fac"])
          ->setCellValue('D' . $fila, $b["fecha"] . ' - '. $b["hora"])
          ->setCellValue('E' . $fila, Helpers::TipoPago($b["tipo_pago"]))
          ->setCellValue('F' . $fila, $b["pv"])
          ->setCellValue('G' . $fila, $b["total"]);
 

        } 




$columnas = array('A','B','C','D','E','F','G');
$numeros = array('F','G');

// establece ceros numerocico las filas numerocas
foreach($numeros as $columnID) {
$objPHPExcel->getActiveSheet()->getStyle($columnID . '2:' . $columnID.$fila)
    ->getNumberFormat()
    ->setFormatCode(
        '$0.00'
    );
}

// establece auto dimension a las columnas
foreach($columnas as $columnID) {
    $objPHPExcel->getActiveSheet()->getColumnDimension($columnID)
        ->setAutoSize(true);
}


// estableces como texto
$range = 'B2'.':B'.$fila;
$objPHPExcel->getActiveSheet()
       ->getStyle($range)
       ->getNumberFormat()
       ->setFormatCode( PHPExcel_Style_NumberFormat::FORMAT_TEXT );

// // formula de sumatoria
$filax = $fila + 1;
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('F'. $filax, "TOTAL: ");
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('G'. $filax, "=SUM(G2:G".$fila.")");

$objPHPExcel->getActiveSheet()->getStyle('G'. $filax)
    ->getNumberFormat()
    ->setFormatCode(
        '$0.00'
    );




// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Lista de Productos Vendidos');


// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);


$objPHPExcel->getActiveSheet()->getStyle("A1:G1")->getFont()->setBold(true);
// Redirect output to a client’s web browser (Excel2007)
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="ProductosVendidos-'.$fecha.'.xlsx"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->setPreCalculateFormulas(true);
$objWriter->save('php://output');
exit;





} // si hay registros
   $a->close();         


} // termina fecha


} else {
    
header("location: ../../");
}
/////////
$db->close();
?>