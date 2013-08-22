<?php
	class CfdiImpuesto extends ActiveRecord{
		public static function registrar($cfdi, $nombre, $tasa, $importe, $tipo = "TRASLADADO"){
			$impuesto = new CfdiImpuesto();
			
			$impuesto -> cuenta_id = Session::get("cuenta_id");
			$impuesto -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$impuesto -> usuario_creacion_id = Session::get("usuario_id");	
				$impuesto -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$impuesto -> usuario_creacion_id = 0;	
				$impuesto -> usuario_edicion_id = 0;
			}
			
			$impuesto -> fecha_creacion = date("Y-m-d H:i:s");
			$impuesto -> fecha_edicion = date("Y-m-d H:i:s");
			
			$impuesto -> cfdi_id = $cfdi;
			
			$impuesto -> cfdi_id = $cfdi;
			$impuesto -> nombre = $nombre;
			$impuesto -> tasa = $tasa;
			$impuesto -> importe = $importe;
			$impuesto -> tipo = $tipo;
			
			$impuesto -> save();
			
			return $impuesto;
		}
	}
?>