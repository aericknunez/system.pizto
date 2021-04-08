 <?php  
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\Printer;



class Impresiones{
    public function __construct() { 
     } 


 
 public function Ticket($efectivo, $numero){
 
}









 public function Factura($efectivo, $numero){
  $db = new dbConn();

}   /// termina FACTURA





 public function CreditoFiscal($data){
  $db = new dbConn();

}










 public function ImprimirAntes($efectivo, $numero, $cancelar){


} /// TERMINA IMPRIMIR ANTES






 public function Comanda(){

 }





 public function ComandaEspecial(){
 
}








 public function ComandaCocina(){


}






 public function ComandaBar(){
 
}












 public function ReporteDiario($fecha){
  $db = new dbConn();



}   // termina reporte diario








 public function AbrirCaja(){

}









 public function ReporteCorte(){ // imprime el resumen del ultimo corte
 

}













 public function EliminaOrden(){ 

 }










 public function EliminaOrdenCocina(){ // imprime el el producto que se borro


}






 public function EliminaOrdenBar(){ // imprime el el producto que se borro
  

}





















 public function Item($cant,  $name = '', $price = '', $total = '', $dollarSign = false)
    {
        $rightCols = 10;
        $leftCols = 40;
        if ($dollarSign) {
            $leftCols = $leftCols / 2 - $rightCols / 2;
        }
        $left = str_pad($cant . " " . $name, $leftCols) ;
        
        $sign = ($dollarSign ? '$ ' : '');

        $total = str_pad($sign . $total, $rightCols, ' ', STR_PAD_LEFT);
        $right = str_pad($sign . $price, $rightCols, ' ', STR_PAD_LEFT);
        return "$left$right$total\n";
    }



 public function DosCol($izquierda = '', $iz, $derecha = '', $der)
    {
        $left = str_pad($izquierda, $iz, ' ', STR_PAD_LEFT) ;      
        $right = str_pad($derecha, $der, ' ', STR_PAD_LEFT);
        return "$left$right\n";
    }








}// class