<?php
	Load::lib("alertas");

	class RegistroController extends ApplicationController {
		public $template = "register";
		
		public function index(){
			$this -> cuentaTemp = false;
		}
		
		public function aviso(){
			
		}
		
		public function registrar(){
			$this -> render("index");
			$this -> set_response("view");
			$this -> successMsg = "";
			$this -> success = "0";
			
			$this->cuentaTemp = Array(
						"rfc" => $this -> post("rfc"),
						"usuario" => $this -> post("usuario"),
						"password" => $this -> post("password"),
						"correo" => $this -> post("correo"),
						"contrato" => $this -> post("tipo_contrato"),
						"paquete" => $this -> post("paquete"),
						"conf_password" => $this -> post("conf_password"),
						"conf_correo" => $this -> post("conf_correo"),
						"costo" => $this -> post("costo")
			);
			
			if($this->cuentaTemp["password"] == $this->cuentaTemp["conf_password"]  &&  $this->cuentaTemp["correo"] == $this->cuentaTemp["conf_correo"]){
				
				$nombre = utf8_decode($this -> post("nombre"));
				$rfc = utf8_decode($this -> post("rfc"));
				$cuenta = Cuenta::registrar($rfc, "", $this -> post("paquete"));
				
				
				if($cuenta){
					
					$cuenta -> telefono_contacto = utf8_decode($this -> post("telefono"));
					$cuenta -> celular_contacto = utf8_decode($this -> post("celular"));
					$cuenta -> correo_contacto = utf8_decode($this -> post("correo"));
					
					$cuenta -> usuario = utf8_decode($this -> post("usuario"));
					$cuenta -> password = sha1($this -> post("password"));
					$cuenta -> activo = utf8_decode($this -> post("activo"));
					
					$password = $this -> post("password");
					
					$cuenta -> tipo_contrato = utf8_decode($this -> post("tipo_contrato"));
					
					$cuenta -> save();
					
					//GENERAR CONTRASEÑA ALEATORIA (NUMERICA)(SHA1)
					if($this -> post("password") == ""){
						Load::lib("formato");
						$password = Formato::ceros(rand(0,999999),6);
						$cuenta -> password = sha1($password);
					}
					
					$cuenta -> guardar();
					
					if($this -> post("tipo_contrato")=="ANUAL"){
						$contrato = Contrato::registrar($cuenta -> id, $this -> post("paquete"), date("Y-m-d"), date("Y-m-d",time()+60*60*24*365));	
					}
					
					if($this -> post("tipo_contrato")=="SEMESTRAL"){
						$contrato = Contrato::registrar($cuenta -> id, $this -> post("paquete"), date("Y-m-d"), date("Y-m-d",time()+60*60*24*183));	
					}
					
					if($this -> post("tipo_contrato")=="MENSUAL"){
						$contrato = Contrato::registrar($cuenta -> id, $this -> post("paquete"), date("Y-m-d"), date("Y-m-d",time()+60*60*24*30));	
					}
					
					$contrato -> tipo = $this -> post("tipo_contrato");
					
					$contrato -> guardar();
					
					$contribuyente = Contribuyente::registrar($rfc, $nombre, $cuenta -> id);
					$contribuyente -> cuenta_id = $cuenta -> id;
					
					$contribuyente -> calle = utf8_decode($this -> post("calle"));
					$contribuyente -> exterior = utf8_decode($this -> post("exterior"));			
					$contribuyente -> interior = utf8_decode($this -> post("interior"));				
					$contribuyente -> colonia = utf8_decode($this -> post("colonia"));
					$contribuyente -> localidad = utf8_decode($this -> post("localidad"));			
					$contribuyente -> cpostal = utf8_decode($this -> post("cpostal"));				
					$contribuyente -> municipio = utf8_decode($this -> post("municipio"));
					$contribuyente -> estado = utf8_decode($this -> post("estado"));			
					$contribuyente -> pais = utf8_decode($this -> post("pais"));
					
					$contribuyente -> guardar();
					
					//ENVIAR CORREO DE CONFIRMACION DE REGISTRO Y CONTRASEÑA DE ADMINISTRADOR
					$asunto = "Tu cuenta en Emisión Fiscal ha sido registrada.";
					$mensaje = "Bienvenido, tu cuenta en Emisión Fiscal ha sido registrada.\n
								
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
					$this -> success = "1";
					$this -> successMsg = "¡La cuenta ha sido registrada correctamente!";
					$this -> render("aviso");
					$this -> set_response("view");
					}
					else{
						$this -> successMsg ="El Correo de la Cuenta ya había sido registrado anteriormente.";
						$this -> render("error");
						$this -> set_response("view");
					}
				
				}
			else{
							
				$this -> render("index");
				$this -> set_response("view");
				if($this->cuentaTemp["correo"] != $this->cuentaTemp["conf_correo"]){
					$this -> alerta = Alerta::error("El campo Correo Electrónico coincidir con el campo 'Confirmar Correo Electronico'");
				}				
				else if($this->cuentaTemp["password"] != $this->cuentaTemp["conf_password"] ){
					$this -> alerta = Alerta::error("El campo Contraseña debe coincidir con el campo 'Confirmar Contraseña'");
				}
			}
		}

	}
?>
