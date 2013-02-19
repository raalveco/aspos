<?php
	class Producto extends ActiveRecord{ 
		public static function registrar($nombre, $precio){
			if(Producto::existe("cuenta_id = '".Session::get("cuenta_id")."' AND nombre = '".$nombre."'")){
				return false;
			}
			
			$producto = new Producto();
			
			$producto -> cuenta_id = Session::get("cuenta_id");
			$producto -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$tipo -> usuario_creacion_id = Session::get("usuario_id");	
				$tipo -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$tipo -> usuario_creacion_id = 0;	
				$tipo -> usuario_edicion_id = 0;
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
