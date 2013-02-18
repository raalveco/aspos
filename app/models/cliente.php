<?php
	class Cliente extends ActiveRecord{
		public static function registrar($cuenta, $rfc, $nombre, $estado, $pais){
			$cliente = new Cliente();
			
			$cliente -> cuenta_id = Session::get("cuenta_id");
			$cliente -> activo = "SI";
			
			if(Session::get("administrador_id")){
				$cliente -> usuario_creacion_id = Session::get("administrador_id");	
				$cliente -> usuario_edicion_id = Session::get("administrador_id");
			}
			else{
				$cliente -> usuario_creacion_id = 0;	
				$cliente -> usuario_edicion_id = 0;
			}
			
			$cliente -> fecha_creacion = date("Y-m-d H:i:s");
			$cliente -> fecha_edicion = date("Y-m-d H:i:s");
			
			$cliente -> rfc = $rfc;
			$cliente -> nombre = $nombre;
			
			$cliente -> estado = $estado;
			$cliente -> pais = $pais;
			
			$cliente -> save();
			
			return $cliente;
		}
	}
?>