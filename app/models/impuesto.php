<?php
	class Impuesto extends ActiveRecord{
		public static function registrar($nombre, $descripcion, $tasa, $tipo = "TRASLADADO"){
			if(Impuesto::existe("cuenta_id = '".Session::get("cuenta_id")."' AND nombre = '".$nombre."' AND tasa = '".$tasa."' AND tipo = '".$tipo."'")){
				return false;
			}
			
			$impuesto = new Impuesto();
			
			$impuesto -> cuenta_id = Session::get("cuenta_id");
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
			$impuesto -> descripcion = $descripcion;
			$impuesto -> tasa = $tasa;
			$impuesto -> tipo = $tipo;
			
			$impuesto -> save();
			
			return $impuesto;
		}
	}
?>