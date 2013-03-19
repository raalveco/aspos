<?php
	Load::lib("alertas");

	class FacturacionController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			if(Session::get("tipo_facturacion") == "CBB"){
				$this -> redirect("cbb/index");
				return;
			}
			
			if(Session::get("tipo_facturacion") == "CFD"){
				$this -> redirect("cfd/index");
				return;
			}
			
			if(Session::get("tipo_facturacion") == "CFDI"){
				$this -> redirect("cfdi/index");
				return;
			}
		} 

	}
	
?>