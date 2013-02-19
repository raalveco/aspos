<?php
	class Menu extends ActiveRecord{ 
		public static function registrar($nombre, $imagen, $activo = "SI"){
			$menu = new Menu();
			
			$menu -> nombre = $nombre;
			$menu -> imagen = $imagen;
			$menu -> activo = $activo;
			$menu -> fecha_registro = date("Y-m-d H:i:s");
			
			$menu -> save();
			
			return $menu;
		}
		
		public function secciones(){
			return Seccion::reporte("menu_id = ".$this -> id." AND activo = 'SI'","orden ASC");
		}
	}
?>