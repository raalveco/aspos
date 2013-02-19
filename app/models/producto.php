<?php
	class Producto extends ActiveRecord{
		public static function registrar($nombre, $precio){
			$producto = new Producto();
			
			$producto -> cuenta_id = Session::get("cuenta_id");
			$producto -> activo = "SI";
			
			if(Session::get("administrador_id")){
				$producto -> usuario_creacion_id = Session::get("administrador_id");	
				$producto -> usuario_edicion_id = Session::get("administrador_id");
			}
			else{
				$producto -> usuario_creacion_id = 0;	
				$producto -> usuario_edicion_id = 0;
			}
			
			$producto -> fecha_creacion = date("Y-m-d H:i:s");
			$producto -> fecha_edicion = date("Y-m-d H:i:s");
			
			$producto -> nombre = $nombre;
			$producto -> precio_unitario = $precio;
			
			$producto -> save();
			
			return $producto;
		}
	}
?>