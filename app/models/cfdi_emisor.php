<?php
	class CfdiEmisor extends ActiveRecord{
		public static function registrar($cfdi, $rfc, $nombre, $municipio, $cpostal, $estado, $pais){
			
			$emisor = new CfdiEmisor();
			
			$emisor -> cuenta_id = Session::get("cuenta_id");
			$emisor -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$emisor -> usuario_creacion_id = Session::get("usuario_id");	
				$emisor -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$emisor -> usuario_creacion_id = 0;	
				$emisor -> usuario_edicion_id = 0;
			}
			
			$emisor -> fecha_creacion = date("Y-m-d H:i:s");
			$emisor -> fecha_edicion = date("Y-m-d H:i:s");
			
			$emisor -> cfdi_id = $cfdi;
			$emisor -> rfc = $rfc;
			$emisor -> nombre = $nombre;			
			$emisor -> municipio = $municipio;
			$emisor -> cpostal = $cpostal;
			$emisor -> estado = $estado;
			$emisor -> pais = $pais;
			
			$emisor -> save();
			
			return $emisor;
		}
		
		public function rfc_nombre(){
			return $this -> rfc." || ".$this -> nombre;
		}
	}
?>