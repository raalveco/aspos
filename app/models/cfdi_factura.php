<?php
	class CfdiFactura extends ActiveRecord{
		public static function registrar($folios, $sucursal, $serie, $folio, $fecha){
			if(CfdiFactura::existe("cuenta_id = '".Session::get("cuenta_id")."' AND serie = '".$serie."' AND folio = '".$folio."'")){
				return false;
			}
			
			$folios = CfdiFolio::consultar($folios);
			
			if(!$folios){
				return false;
			}
			
			$factura = new CfdiFactura();
			
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
			
			$factura -> cfdi_folios_id = $folios -> id;
			$factura -> sucursal_id = $sucursal;
			$factura -> serie = $serie;
			$factura -> folio = $folio;
			
			$factura -> fecha = Formato::FechaDB($fecha);
			
			$factura -> save();
			
			if($factura){
				$folios -> actual = $folios -> actual + 1;
				$folios -> save();
			}
			
			return $factura;
		}
		
		public function conceptos(){
			return CfdiConcepto::reporte("cfdi_id = ".$this -> id);
		}
		
		public function impuestos(){
			return CfdiImpuesto::reporte("cfdi_id = ".$this -> id);
		}
		
		public function emisor(){
			return Contribuyente::consultar("cuenta_id = ".$this -> cuenta_id);
		}
		
		public function receptor(){
			return CfdiReceptor::consultar("cfdi_id = ".$this -> id);
		}
		
		public function folio(){
			return CfdiFolio::consultar("id = ".$this -> cbb_folios_id);
		}
		
		public function sucursal(){
			return Sucursal::consultar($this -> sucursal_id);
		}
		
		public static function fechaUltimaFactura(){
			$factura = CfdiFactura::buscar("cuenta_id = '".Session::get("cuenta_id")."'","fecha DESC");
			
			if($factura){
				$d = substr($factura -> fecha, 8,2);
				$m = substr($factura -> fecha, 5,2);
				$y = substr($factura -> fecha, 0,4);
				
				if(date("d/m/Y") == $d."/".$m."/".$y){
					$time = time();
				}
				else{
					$time = mktime(0,0,0,$m,$d,$y);
				}
				
				return date("d/m/Y",$time);
			}
			else{
				return date("01/01/Y");
			}
		}
	}
?>