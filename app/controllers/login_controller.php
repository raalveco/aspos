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
			
			if(Administrador::existe("rfc = '".$this -> post("rfc")."' AND usuario = '".$this -> post("usuario")."' AND password = '".sha1($this -> post("password"))."'")){
				$administrador = Administrador::buscar("rfc = '".$this -> post("rfc")."' AND usuario = '".$this -> post("usuario")."' AND password = '".sha1($this -> post("password"))."'");
			
				Session::set("acceso",true);
				
				Session::set("tipo_usuario","ADMIN");
				Session::set("usuario",$administrador -> usuario);
				
				Session::set("empresa",$administrador -> nombre);
				Session::set("nombre",$administrador -> nombre);
				
				Session::set("cuenta_id",0);
				Session::set("cuenta",0);
			
				Session::set("usuario_id",false);
				Session::set("password","");
				
				Session::set("tipo_facturacion","");
				
				Session::set("paquete_id",0);
					
				$this -> redirect("main");
				return;
			}
			
			//VALIDAR CUENTA DE USUARIO
			if(Cuenta::existe("rfc = '".$this -> post("rfc")."'")){
				$cuenta = Cuenta::buscar("rfc = '".$this -> post("rfc")."'");		
				
				//INGRESAR COMO ADMINISTRADOR DE CUENTA
				if($this -> post("usuario") == "admin" && $cuenta -> password == sha1($this -> post("password"))){
					Session::set("acceso",true);
					//USUARIO ADMIN
					Session::set("usuario_id",0);
					Session::set("cuenta_id",$cuenta -> id);
					Session::set("cuenta",$cuenta -> id);
					
					$contribuyente = $cuenta -> contribuyente();
					
					Session::set("contribuyente_id",$contribuyente -> id);
					Session::set("password",$this -> post("password"));
					
					Session::set("empresa",$contribuyente -> nombre_comercial ? $contribuyente -> nombre_comercial : $contribuyente -> nombre);
					
					Session::set("tipo_usuario","CLIENTE");
					
					//VARIABLES DE CONFIGURACION
					$paquete = $cuenta -> paquete();
					
					Session::set("paquete_id",$paquete -> id);
					Session::set("tipo_facturacion",strtoupper($paquete -> tipo));
					
					$this -> redirect("main");
					return;
				}
				
				//INGRESAR CON OTRO USUARIO
				
				if(Usuario::existe("cuenta_id = ".$cuenta -> id." AND usuario = '".$this -> post("usuario")."' AND password = '".sha1($this -> post("password"))."'")){
					$usuario = Usuario::buscar("cuenta_id = ".$cuenta -> id." AND usuario = '".$this -> post("usuario")."' AND password = '".sha1($this -> post("password"))."'");
					
					Session::set("acceso",true);
					//USUARIO ADMIN
					Session::set("usuario_id",$usuario -> id);
					Session::set("cuenta_id",$cuenta -> id);
					Session::set("cuenta",$cuenta -> id);
					
					$contribuyente = $cuenta -> contribuyente();
					
					Session::set("contribuyente_id",$contribuyente -> id);
					Session::set("password",$this -> post("password"));
					
					Session::set("empresa",$contribuyente -> nombre_comercial ? $contribuyente -> nombre_comercial : $contribuyente -> nombre);
					
					Session::set("tipo_usuario","CLIENTE");
					
					//VARIABLES DE CONFIGURACION
					$paquete = $cuenta -> paquete();
					
					Session::set("paquete_id",$paquete -> id);
					Session::set("tipo_facturacion",strtoupper($paquete -> tipo));
					
					$this -> redirect("main");
					return;
				}
				$this -> redirect("login/index/usuario_incorrecto");
				return;
			}
			else{
				$this -> redirect("login/index/rfc_incorrecto");
				return;
			}
		}		
		
		public function iniciar_admin($rfc){
			$this -> render(null,null);
			if(Session::get("acceso") && (Session::get("tipo_usuario") == "ADMIN"))
			{

				$cuenta = Cuenta::buscar("rfc = '".$rfc."'");
				
				//INGRESAR COMO ADMINISTRADOR DE CUENTA

				Session::set("acceso",true);
				//USUARIO ADMIN
				Session::set("usuario_id",0);
				Session::set("cuenta_id",$cuenta -> id);
				Session::set("cuenta",$cuenta -> id);
				
				$contribuyente = $cuenta -> contribuyente();
				
				Session::set("contribuyente_id",$contribuyente -> id);
				Session::set("password",$this -> post("password"));
				
				Session::set("empresa",$contribuyente -> nombre_comercial ? $contribuyente -> nombre_comercial : $contribuyente -> nombre);
				
				Session::set("tipo_usuario","CLIENTE");
				
				//VARIABLES DE CONFIGURACION
				$paquete = $cuenta -> paquete();
				
				Session::set("paquete_id",$paquete -> id);
				Session::set("tipo_facturacion",strtoupper($paquete -> tipo));
				
				$this -> redirect("main");
				return;
					

				
			}
			else{
				$this -> redirect("logout");
			}			
			
		}
		
		
		public function cerrar(){
			$this -> render(null,null);
			
			Session::set("acceso",false);
			Session::set("cuenta",0);
			
			Session::set("usuario_id",false);
			Session::set("password","");
			
			Session::set("tipo_facturacion","");
			
			Session::set("paquete_id",0);
			
			$this -> redirect("login/index/logout");	
		}
	}
?>
