<?php
	class Contribuyente extends ActiveRecord{
		public static function registrar($rfc, $nombre, $cuenta){
			$contribuyente = new Contribuyente();
			
			$contribuyente -> cuenta_id = $cuenta;
			$contribuyente -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$contribuyente -> usuario_creacion_id = Session::get("usuario_id");	
				$contribuyente -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$contribuyente -> usuario_creacion_id = 0;	
				$contribuyente -> usuario_edicion_id = 0;
			}
			
			$contribuyente -> fecha_creacion = date("Y-m-d H:i:s");
			$contribuyente -> fecha_edicion = date("Y-m-d H:i:s");
			
			$contribuyente -> rfc = $rfc;
			$contribuyente -> nombre = $nombre;
			
			$contribuyente -> save();
			
			return $contribuyente;
		}
	}
?>