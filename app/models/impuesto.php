<?php
	class Impuesto extends ActiveRecord{
		public static function registrar($nombre, $descripcion){
			if(Impuesto::existe("nombre = '".$nombre."'")){
				return false;
			}
			
			$tipo = new Impuesto();
			
			$tipo -> cuenta_id = Session::get("cuenta_id");
			$tipo -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$tipo -> usuario_creacion_id = Session::get("usuario_id");	
				$tipo -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$tipo -> usuario_creacion_id = 0;	
				$tipo -> usuario_edicion_id = 0;
			}
			
			$tipo -> fecha_creacion = date("Y-m-d H:i:s");
			$tipo -> fecha_edicion = date("Y-m-d H:i:s");
			
			$tipo -> nombre = $nombre;
			$tipo -> descripcion = $descripcion;
			
			$tipo -> save();
			
			return $tipo;
		}
	}
?>