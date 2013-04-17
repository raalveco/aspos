<?php
	class CbbFolio extends ActiveRecord{
		public static function registrar($serie, $numero_aprobacion, $fecha_recepcion, $inicial, $final, $actual, $tipo_documento = "FACTURA"){
			if(CbbFolio::existe("cuenta_id = '".Session::get("cuenta_id")."' AND serie = '".$serie."' AND numero_aprobacion = '".$numero_aprobacion."'")){
				return CbbFolio::consultar("cuenta_id = '".Session::get("cuenta_id")."' AND serie = '".$serie."' AND numero_aprobacion = '".$numero_aprobacion."'");
			}
			
			$folio = new CbbFolio();
			
			$folio -> cuenta_id = Session::get("cuenta_id");
			$folio -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$folio -> usuario_creacion_id = Session::get("usuario_id");	
				$folio -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$folio -> usuario_creacion_id = 0;	
				$folio -> usuario_edicion_id = 0;
			}
			
			$folio -> fecha_creacion = date("Y-m-d H:i:s");
			$folio -> fecha_edicion = date("Y-m-d H:i:s");
			
			Load::lib("formato");
			
			$folio -> serie = $serie;
			$folio -> numero_aprobacion = $numero_aprobacion;
			$folio -> fecha_recepcion = Formato::FechaDB($fecha_recepcion);
			$folio -> tipo_documento = $tipo_documento;
			$folio -> inicial = $inicial;
			$folio -> {"final"} = $final;
			$folio -> actual = $actual;
			
			$folio -> save();
			
			return $folio;
		}
	}
?>