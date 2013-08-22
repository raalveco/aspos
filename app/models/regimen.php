<?php
	class Regimen extends ActiveRecord{
		public static function registrar($nombre, $cuenta_id = false){
			if($cuenta_id === false){
				if(Session::get("cuenta_id")){
					$cuenta_id = Session::get("cuenta_id");
				}		
				else{
					$cuenta_id = 0;
				}
			}
			
			if(Regimen::existe("cuenta_id = '".$cuenta_id."' AND regimen = '".$nombre."'")){
				return false;
			}
			
			$regimen = new Regimen();
			
			$regimen -> cuenta_id = $cuenta_id;
			
			$regimen -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$regimen -> usuario_creacion_id = Session::get("usuario_id");	
				$regimen -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$regimen -> usuario_creacion_id = 0;	
				$regimen -> usuario_edicion_id = 0;
			}
			
			$regimen -> fecha_creacion = date("Y-m-d H:i:s");
			$regimen -> fecha_edicion = date("Y-m-d H:i:s");
			
			$regimen -> regimen = $nombre;

			$regimen -> save();
			
			return $regimen;
		}
	}
?>