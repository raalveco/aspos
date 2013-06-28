<?php
	class Impuesto extends ActiveRecord{
		public static function registrar($nombre, $tasa, $tipo = "TRASLADADO", $cuenta_id = false){
			if($cuenta_id === false){
				if(Session::get("cuenta_id")){
					$cuenta_id = Session::get("cuenta_id");
				}		
				else{
					$cuenta_id = 0;
				}
			}
			
			if(Impuesto::existe("cuenta_id = '".$cuenta_id."' AND nombre = '".$nombre."' AND tasa = '".$tasa."' AND tipo = '".$tipo."'")){
				return false;
			}
			
			$impuesto = new Impuesto();
			
			$impuesto -> cuenta_id = $cuenta_id;
			
			$impuesto -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$impuesto -> usuario_creacion_id = Session::get("usuario_id");	
				$impuesto -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$impuesto -> usuario_creacion_id = 0;	
				$impuesto -> usuario_edicion_id = 0;
			}
			
			$impuesto -> fecha_creacion = date("Y-m-d H:i:s");
			$impuesto -> fecha_edicion = date("Y-m-d H:i:s");
			
			$impuesto -> nombre = $nombre;
			$impuesto -> descripcion = $nombre;
			$impuesto -> tasa = $tasa;
			$impuesto -> tipo = $tipo;
			
			$impuesto -> save();
			
			return $impuesto;
		}
	}
?>