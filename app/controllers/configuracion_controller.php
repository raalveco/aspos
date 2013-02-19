<?php
	Load::lib("alertas");

	class ConfiguracionController extends ApplicationController {
		public function index(){
			$this -> set_response("view");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
		} 
		
		public function modificar(){
			$this -> set_response("view");
			
			$this -> render("index");
			
			$this -> render(null,null);
			
			$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			$cuenta -> correo_contacto = utf8_decode($this -> post("correo"));
			
			if($this -> post("password") != "**********"){
				$cuenta -> password = sha1($this -> post("password"));
			}
			
			$cuenta -> guardar();
			
			$this -> alerta = Alerta::success("La Configuración ha sido actualizada correctamente");
			
			$this -> cuenta = $cuenta;
		}
	}
?>
