<?php
	class Rol extends ActiveRecord{ 
		public static function registrar($nombre, $activo = "SI"){
			$rol = new Rol();
			
			$rol -> nombre = $nombre;
			$rol -> activo = $activo;
			$rol -> fecha_registro = date("Y-m-d H:i:s");
			
			$rol -> cuenta_id = Session::get("cuenta_id");
			
			$rol -> save();
			
			return $rol;
		}
	}
?>