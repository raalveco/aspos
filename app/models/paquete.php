<?php
	class Paquete extends ActiveRecord{
		public static function registrar($tipo, $nombre){
			if(Paquete::existe("tipo='".$tipo."' AND nombre = '".$nombre."'")){
				return false;
			}
			
			$paquete = new Paquete();
			
			$paquete -> nombre = $nombre;
			$paquete -> tipo = $tipo;
			
			$paquete -> facturas_incluidas = 1;
			$paquete -> costo_factura_adicional = 10;
			$paquete -> usuarios = 1;
			$paquete -> almacenamiento = 100;
			
			$paquete -> soporte_online = "SI";
			$paquete -> soporte_chat = "NO";
			$paquete -> soporte_telefono = "NO";
			
			$paquete -> multiple_moneda = "NO";
			$paquete -> multiple_sucursal = "NO";
			
			$paquete -> costo_mensual = 0.0;
			$paquete -> costo_anual = 0.0;
			
			$paquete -> vigencia = date("Y-12-31");
			$paquete -> activo = "SI";
			
			$paquete -> save();
			
			return $paquete;
		}
	}
?>