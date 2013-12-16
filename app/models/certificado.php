<?php
	class Certificado extends ActiveRecord{
		public static function registrar($archivo_cer, $archivo_key, $clave_privada, $numero_serie, $fecha_emision, $fecha_vencimiento, $activo = "SI"){
				
			if(Certificado::existe("cuenta_id = '".Session::get("cuenta_id")."' AND numero_serie = '".$numero_serie."'")){
				return false;
			}
			
			$todos = Certificado::reporte("cuenta_id = '".Session::get("cuenta_id")."'");
			if($todos) foreach($todos as $todo){
				$todo -> activo = "NO";
				$todo -> save();
			}			
						
			$certificado = new Certificado();
			
			$certificado -> cuenta_id = Session::get("cuenta_id");
			$certificado -> activo = $activo;
			
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
			
			$certificado -> archivo_cer = $archivo_cer;
			$certificado -> archivo_key = $archivo_key;
			$certificado -> clave_privada = $clave_privada;
			$certificado -> numero_serie = $numero_serie;
			$certificado -> fecha_emision = $fecha_emision;
			$certificado -> fecha_vencimiento = $fecha_vencimiento;
			
			$certificado -> save();
		}
	}
?>