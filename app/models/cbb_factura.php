<?php
	class CbbFactura extends ActiveRecord{
		public static function registrar($folios, $sucursal, $serie, $folio, $fecha){
			if(CbbFactura::existe("cuenta_id = '".Session::get("cuenta_id")."' serie = '".$serie."' AND folio = '".$folio."'")){
				return false;
			}
			
			$factura = new CbbFactura();
			
			$factura -> cuenta_id = Session::get("cuenta_id");
			$factura -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$factura -> usuario_creacion_id = Session::get("usuario_id");	
				$factura -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$factura -> usuario_creacion_id = 0;	
				$factura -> usuario_edicion_id = 0;
			}
			
			$factura -> fecha_creacion = date("Y-m-d H:i:s");
			$factura -> fecha_edicion = date("Y-m-d H:i:s");
			
			Load::lib("formato");
			
			$factura -> cbb_folios_id = $folios;
			$factura -> sucursal_id = $sucursal;
			$factura -> serie = $serie;
			$factura -> folio = $folio;
			
			$factura -> fecha = Formato::FechaDB($fecha);
			
			$factura -> save();
			
			return $factura;
		}
		
		public function conceptos(){
			return CbbConcepto::reporte("cbb_id = ".$this -> id);
		}
		
		public function emisor(){
			return Contribuyente::consultar("cuenta_id = ".$this -> cuenta_id);
		}
		
		public function receptor(){
			return CbbReceptor::consultar("cbb_id = ".$this -> id);
		}
		
		public function folio(){
			return CbbFolio::consultar("cbb_id = ".$this -> id);
		}
	}
?>