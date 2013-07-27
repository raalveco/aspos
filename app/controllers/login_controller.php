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
			if($opcion == "recuperar"){
				$this -> mensaje = "Datos incorrectos.";
			}
			
			if($opcion == "logout"){
				$this -> mensaje = "&#161;La sesi&oacute;n ha sido terminada exitosamente.";
			}
		}
		
		public function google($token){
            $this -> render(null,null);
            
            if(Administrador::existe("token = '".$token."'")){
                $administrador = Administrador::consultar("token = '".$token."'");
                
                Session::set("acceso",true);
                
                Session::set("tipo_usuario","ADMIN");
                Session::set("usuario",$administrador -> usuario);
                
                Session::set("empresa",$administrador -> nombre);
                Session::set("nombre",$administrador -> nombre);
                
                Session::set("cuenta_id",$administrador -> id);
                Session::set("cuenta",0);
            
                Session::set("usuario_id",false);
                Session::set("password","");
                
                Session::set("tipo_facturacion","");
                
                Session::set("paquete_id",0);
                    
                $this -> redirect("main");
            }
            else{
                $this -> redirect("login/admin");
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
				
				Session::set("cuenta_id",$administrador -> id);
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
				if($this -> post("usuario") == $cuenta -> usuario && $cuenta -> password == sha1($this -> post("password"))){
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
		
		public function recuperar($opcion){
			if($opcion == "success"){
				$this -> mensaje = "Contraseña recuperada, un email ha sido enviado a su correo.";
			}
			if($opcion == "error"){
				$this -> mensaje = "Contraseña no recuperada, datos incorrectos.";
			}
		}
		
		public function mandar_contrasena(){
			$this -> render (null,null);
			$cuenta = Cuenta::buscar("rfc = '".$this->post("rfc"). "' AND usuario = '".$this -> post("usuario")."'");
			if($cuenta){
				Load::lib("formato");
				Load::lib("alertas");
				$password = Formato::ceros(rand(0,999999),6);
				$cuenta->password = sha1($password);
				$cuenta -> guardar();
				
				//ENVIAR CORREO DE CONFIRMACION DE REGISTRO Y CONTRASEÑA DE ADMINISTRADOR
				$asunto = "Recuperación de contraseña Emisión Fiscal";
				$mensaje = "Tu contraseña de Emisión Fiscal ha sido recuperada.\n
							
							Para acceder al sistema debes ingresar:\n
							
							".APLICACION_URL."\n
							
							RFC: ".$cuenta -> rfc."\n
							Usuario: ".$cuenta -> usuario."\n
							Contraseña: ".$password."\n
							
							Una vez que ingreses al sistema deberías cambiar esta contraseña por la que tu prefieras en el Menú Configuración.\n
							
							
							Equipo de Emisión Fiscal";
							
				$cabeceras = 'MIME-Version: 1.0' . "\r\n" .
							 'Content-Type: text/html; charset="UTF-8";' . "\r\n" .
							 'From: Emisión Fiscal <soporte@emisionfiscal.mx>' . "\r\n" .
	    					 'Reply-To: Emisión Fiscal <soporte@emisionfiscal.mx>' . "\r\n" .
	    					 'X-Mailer: PHP/' . phpversion();
							 
				@mail($cuenta -> correo_contacto, $asunto, nl2br($mensaje), $cabeceras);

				$this -> redirect("login/recuperar/success");
				return;
			}
			else{
				$this -> redirect("login/recuperar/error");
			}
		}
	}
?>
