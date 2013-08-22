<?php
	class CfdiConcepto extends ActiveRecord{
		public static function registrar($cfdi, $cantidad, $descripcion, $precio, $descuento = 0.0000){
			$concepto = new CfdiConcepto();
			
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
				
			if(CfdiConcepto::existe("cuenta_id = '".Session::get("cuenta_id")."' AND cbb_id = ".$cbb." AND descripcion = '".$descripcion."' AND precio_unitario = ".$precio." AND descuento = ".$descuento."")){
				$concepto = CfdiConcepto::consultar("cuenta_id = '".Session::get("cuenta_id")."' AND cbb_id = ".$cbb." AND descripcion = '".$descripcion."' AND precio_unitario = ".$precio." AND descuento = ".$descuento."");
				
				$cantidad += $concepto -> cantidad;
			}
			
			$concepto -> cfdi_id = $cfdi;
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