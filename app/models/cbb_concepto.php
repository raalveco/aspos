<?php
	class CbbConcepto extends ActiveRecord{
		public static function registrar($cbb, $cantidad, $descripcion, $precio, $descuento = 0.0000){
			$concepto = new CbbConcepto();
			
			$concepto -> cuenta_id = Session::get("cuenta_id");
			$concepto -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$concepto -> usuario_creacion_id = Session::get("usuario_id");	
				$concepto -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$concepto -> usuario_creacion_id = 0;	
				$concepto -> usuario_edicion_id = 0;
			}
			
			$concepto -> fecha_creacion = date("Y-m-d H:i:s");
			$concepto -> fecha_edicion = date("Y-m-d H:i:s");
				
			if(CbbConcepto::existe("cuenta_id = '".Session::get("cuenta_id")."' AND cbb_id = ".$cbb." AND descipcion = '".$descripcion."' AND precio_unitario = ".$precio." AND descuento = ".$descuento."")){
				$concepto = CbbConcepto::consultar("cuenta_id = '".Session::get("cuenta_id")."' AND cbb_id = ".$cbb." AND descipcion = '".$descripcion."' AND precio_unitario = ".$precio." AND descuento = ".$descuento."");
				
				$cantidad += $concepto -> cantidad;
			}
			
			$concepto -> cbb_id = $cbb;
			$concepto -> cantidad = $cantidad;
			$concepto -> descripcion = $descripcion;
			$concepto -> precio_unitario = $precio;
			$concepto -> descuento = $descuento;
			$concepto -> importe = $cantidad * ($precio - $descuento);
			
			$concepto -> save();
			
			return $concepto;
		}
	}
?>