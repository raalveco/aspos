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
			
			if($opcion == "rfc_incorrecto"){
				$this -> mensaje = "&#161;Acceso Inv&aacute;lido! <br> El RFC ingresado es incorrecto.";
			}
			
			if($opcion == "usuario_incorrecto"){
				$this -> mensaje = "&#161;Acceso Inv&aacute;lido! <br> El Usuario y/o Contrase&ntilde;a son incorrectos.";
			}
			
			if($opcion == "logout"){
				$this -> mensaje = "&#161;La sesi&oacute;n ha sido terminada exitosamente.";
			}
		}
		
		public function iniciar(){
			$this -> render(null,null);
			
			//VALIDAR CUENTA DE USUARIO
			if(Cuenta::existe("rfc = '".$this -> post("rfc")."'")){
				$cuenta = Cuenta::buscar("rfc = '".$this -> post("rfc")."'");
				
				//INGRESAR COMO ADMINISTRADOR
				if($this -> post("usuario") == "admin" && $cuenta -> password == sha1($this -> post("password"))){
					Session::set("acceso",true);
					Session::set("cuenta_id",$cuenta -> id);
					Session::set("password",$this -> post("password"));
					
					$this -> redirect("main");
					return;
				}
				
				//INGRESAR CON OTRO USUARIO
				
				$this -> redirect("login/index/usuario_incorrecto");
				return;
			}
			else{
				$this -> redirect("login/index/rfc_incorrecto");
				return;
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