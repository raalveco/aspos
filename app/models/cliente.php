<?php
	class Cliente extends ActiveRecord{ 
		public static function registrar($rfc, $nombre, $estado, $pais, $cuenta_id = false){
			if($cuenta_id === false){
				if(Session::get("cuenta_id")){
					$cuenta_id = Session::get("cuenta_id");
				}		
				else{
					$cuenta_id = 0;
				}
			}
			
			if(Cliente::existe("cuenta_id = '".$cuenta_id."' AND rfc = '".$rfc."'")){
				return false;
			}
			
			$cliente = new Cliente();
			
			$cliente -> cuenta_id = $cuenta_id;
			$cliente -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$cliente -> usuario_creacion_id = Session::get("usuario_id");	
				$cliente -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$cliente -> usuario_creacion_id = 0;	
				$cliente -> usuario_edicion_id = 0;
			}
			
			$cliente -> fecha_creacion = date("Y-m-d H:i:s");
			$cliente -> fecha_edicion = date("Y-m-d H:i:s");
			
			$cliente -> rfc = $rfc;
			$cliente -> nombre = $nombre;
			
			$cliente -> estado = $estado;
			$cliente -> pais = $pais;
			
			$cliente -> save();
			
			return $cliente;
		}
	}
?>