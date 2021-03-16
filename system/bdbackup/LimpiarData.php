<?php 
class DataClear{

  public function __construct() { 
     } 




public function Clear(){
    $db = new dbConn();

    $dir = $this->Tablas();

    foreach ($dir as $tabla) {

      $db->delete($tabla, "WHERE td=" . $_SESSION["td"]);

    } /// termina recorrido de directorios

Alerts::Mensajex("Se eliminaron todos los registos de su sistema", "info");

}//



public function Tablas(){

  $dir  = array(
"alter_materiaprima_reporte", 
"alter_opciones", 
"alter_producto_reporte", 
"categorias",
"clientes",
"clientes_mesa", 
// "config_master", 
// "config_root", 
"control_cocina", 
"control_panel_mostrar", 
"corte_diario", 
"cuentas",
"cuentas_abonos",
"delivery_repartidor",
"entradas_efectivo", 
"facturar_cai", 
"facturar_opciones", 
"facturar_rtn", 
"facturar_rtn_cliente", 
"gastos", 
"gastos_images", 
"images", 
"mesa", 
"mesa_borrado", 
"mesa_comanda_edo", 
"mesa_comentarios", 
"mesa_nombre", 
"opciones", 
"opciones_asig", 
"opciones_name", 
"opciones_ticket", 
"planilla_descuentos", 
"planilla_descuentos_asig", 
"planilla_empleados", 
"planilla_extras", 
"planilla_pagos", 
"precios", 
"producto", 
"productos_venta_especial",
"proveedores",
"pro_asignado", 
"pro_bruto", 
"pro_dependiente", 
"pro_historial_addpro", 
"pro_historial_averias", 
"pro_registro_averia", 

"pro_registro_up", 
"pro_unidades_medida", 
 
"sync_tabla", 
"sync_tables_updates", 
"sync_up", 
"sync_up_cloud", 
"system_img_check", 

"ticket", 
"ticket_borrado", 
"ticket_num", 
"ticket_propina", 
"ticket_temp"); // directorios a recorrer

  return $dir;
}










}// class
?>