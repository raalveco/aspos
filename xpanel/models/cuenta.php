<?php
	class Cuenta extends ActiveRecord{
		public static function registrar($rfc, $nombre){
			if(Cuenta::existe("rfc = '".$rfc."'")){
				return false;
			}
			
			$cuenta = new Cuenta();
			
			$cuenta -> activo = "SI";
			
			if(Session::get("administrador_id")){
				$cuenta -> usuario_creacion_id = Session::get("administrador_id");	
				$cuenta -> usuario_edicion_id = Session::get("administrador_id");
			}
			else{
				$cuenta -> usuario_creacion_id = 0;	
				$cuenta -> usuario_edicion_id = 0;
			}
			
			$cuenta -> fecha_creacion = date("Y-m-d H:i:s");
			$cuenta -> fecha_edicion = date("Y-m-d H:i:s");
			
			$cuenta -> rfc = $rfc;
			$cuenta -> nombre = $nombre;
			
			$cuenta -> save();
			
			return $cuenta;
		}
		
		public function paquete(){
			return Paquete::consultar($this -> paquete_id);
		}
	}
?>