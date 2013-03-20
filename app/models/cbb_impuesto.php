<?php
	class CbbImpuesto extends ActiveRecord{
		public static function registrar($cbb, $nombre, $tasa, $importe, $tipo = "TRASLADADO"){
			$impuesto = new CbbImpuesto();
			
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
			
			$impuesto -> cbb_id = $cbb;
			
			$impuesto -> cbb_id = $cbb;
			$impuesto -> nombre = $nombre;
			$impuesto -> tasa = $tasa;
			$impuesto -> importe = $importe;
			$impuesto -> tipo = $tipo;
			
			$impuesto -> save();
			
			return $impuesto;
		}
	}
?>