<?php
	Load::lib("alertas");

	class ConfiguracionController extends ApplicationController {
		public function index(){
			$this -> set_response("view");
			
			$this -> cliente = false;
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
		} 
	}
?>