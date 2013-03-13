<?php
	Load::lib("alertas");

	class FacturacionController extends ApplicationController {
		public function cbb(){
			$this -> set_response("view");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			if(Session::get("conceptos")){
				$conceptos = Session::get("conceptos");
			}
			else{
				$conceptos = array();
				Session::set("conceptos", $conceptos);
			}
			
			$campos = array("id","rfc","nombre");
			$this -> clientes = Cliente::reporte("cuenta_id = ".$this -> cuenta -> id,"rfc ASC",0,0,$campos);
			
			$campos = array("id","codigo","nombre");
			$this -> productos = Producto::reporte("cuenta_id = ".$this -> cuenta -> id,"nombre ASC",0,0,$campos);
			
			$this -> factura = false;
			
			$tipo_factura = "cbb";
			
			$campos = array("id","nombre");
			$this -> sucursales = Sucursal::reporte("cuenta_id = ".$this -> cuenta -> id." AND cbb_folios_id > 0","nombre ASC",0,0,$campos);
			
			if(count($this -> sucursales)==1){
				foreach($this -> sucursales as $sucursal){
					$this -> matrix = $sucursal -> id;
				}
			}
			else{
				$this -> matrix = "";
			}
			
			$campos = array("id","serie");
			$this -> series = CbbFolio::reporte("cuenta_id = ".$this -> cuenta -> id." AND actual <= final","serie ASC",0,0,$campos);
			
			if(count($this -> series)==0){
				$this -> alerta = Alerta::error("Para poder facturar es necesario tener al menos una serie configurada.");
			}
			else{
				if(count($this -> series)==1){
					foreach($this -> series as $serie){
						$this -> xerie = $serie -> id;
					}
				}
				else{
					$this -> xerie = "";
				}
			}
		} 
		
	}
	
?>