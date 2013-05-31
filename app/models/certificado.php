<?php
	class Certificado extends ActiveRecord{
		public static function registrar(){
			$certificado = new Certificado();
			
			$certificado -> cuenta_id = Session::get("cuenta_id");
			$certificado -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$certificado -> usuario_creacion_id = Session::get("usuario_id");	
				$certificado -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$certificado -> usuario_creacion_id = 0;	
				$certificado -> usuario_edicion_id = 0;
			}
			
			$certificado -> fecha_creacion = date("Y-m-d H:i:s");
			$certificado -> fecha_edicion = date("Y-m-d H:i:s");
		}
	}
?>