<?php
	class TipoCliente extends ActiveRecord{
		public static function registrar($nombre){
			$tipo = new TipoCliente();
			
			$tipo -> cuenta_id = 1;
			$tipo -> nombre = $nombre;
			
			$tipo -> save();
			
			return $tipo;
		}
	}
?>