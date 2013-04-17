<?php
	Load::lib("estadistica");

	class Permisos{
		public static function facturasIncluidas($cuenta_id){
			
			$cuenta = Cuenta::consultar($cuenta_id);
			
			$paquete = $cuenta -> paquete();
			
			$facturas = Estadistica::facturas($cuenta -> id);
			
			if($facturas < $paquete -> facturas_incluidas){
				return true;
			}
			
			return false;
		}
	}
?>