<?php
	class LoginController extends ApplicationController {
		public $template = "login";
			
		public function index($opcion){
			$this -> mensaje = false;
				
			if($opcion == "no_sesion"){
				$this -> mensaje = "&#161;Acceso Inv&aacute;lido! <br> Es necesario identificarse iniciando sesi&oacute;n";
			}
			
			if($opcion == "error_iniciar"){
				$this -> mensaje = "&#161;Acceso Inv&aacute;lido! <br> El Usuario y/o Contrase&ntilde;a son incorrectos.";
			}
			
			if($opcion == "logout"){
				$this -> mensaje = "&#161;La sesi&oacute;n ha sido terminada exitosamente.";
			}
		}
		
		public function iniciar(){
			$this -> render(null,null);
			
			if($this -> post("usuario")=="raalveco" && $this -> post("password") == "vera"){
				Session::set("acceso",true);
				Session::set("administrador_id",1);
				
				Session::set("password","vera");
				
				$this -> redirect("main");
			}
			else{
				$this -> redirect("login/index/error_iniciar");	
			}
		}
		
		public function cerrar(){
			$this -> render(null,null);
			
			Session::set("acceso",false);
			Session::set("cuenta",0);
			
			$this -> redirect("login/index/logout");	
		}
	}
?>