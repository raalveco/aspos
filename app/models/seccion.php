<?php
	class Seccion extends ActiveRecord{ 
		public static function registrar($menu, $nombre, $imagen, $link, $contenedor = "principal", $activo = "SI"){
			$seccion = new Seccion();
			
			$seccion -> menu_id = $menu;
			$seccion -> nombre = $nombre;
			$seccion -> imagen = $imagen;
			$seccion -> link = $link;
			$seccion -> contenedor = $contenedor;
			$seccion -> activo = $activo;
			$seccion -> fecha_registro = date("Y-m-d H:i:s");
			
			$seccion -> save();
			
			return $seccion;
		}
		
		public function menu(){
			return Menu::consultar($this -> menu_id);
		}
	}
?>