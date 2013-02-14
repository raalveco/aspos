<?php
	class Cliente extends ActiveRecord{
		public static function registrar($rfc, $nombre, $estado, $pais){
			$cliente = new Cliente();
			
			$cliente -> cuenta_id = 1;
			$cliente -> rfc = $rfc;
			$cliente -> nombre = $nombre;
			
			$cliente -> estado = $estado;
			$cliente -> pais = $pais;
			
			$cliente -> save();
			
			return $cliente;
		}
	}
?>