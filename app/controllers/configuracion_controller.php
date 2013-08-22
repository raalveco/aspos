<?php
	Load::lib("alertas");

	class ConfiguracionController extends ApplicationController {
		public function index(){
			$this -> set_response("view");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			$this->validar();
		} 
		
		public function modificar(){
			$this -> set_response("view");
			
			$this -> render("index");
			
			$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			$cuenta -> correo_contacto = utf8_decode($this -> post("correo"));
			
			if($cuenta -> password != sha1("demo") || $cuenta -> usuario != "demo"){
				$cuenta -> usuario = utf8_decode($this -> post("usuario"));
			
				if($this -> post("password")!="**********"){
					$cuenta -> password = sha1(utf8_decode($this -> post("password")));
				}
			}
			
			$cuenta -> guardar();
			
			$this -> alerta = Alerta::success("La Configuración ha sido actualizada correctamente");
			
			$this -> cuenta = $cuenta;
			
			$this->validar();
		}
		
		public function fiscal(){
			$this -> render("consultaContribuyente");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			$this -> contribuyente = Contribuyente::consultar(Session::get("contribuyente_id"));
			
			if(!$this -> contribuyente){
				$this -> render("index");
				
				$this -> alerta = Alerta::error("El Contribuyente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function imagenes(){
			$this -> render("imagenes");
			
			$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			$this -> contribuyente = $cuenta -> contribuyente();
			
			if(!$this -> contribuyente){
				$this -> render("index");
				
				$this -> alerta = Alerta::error("El Contribuyente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function cargarImagenes($id){
			$this -> render(null,null);
			
			$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			$this -> contribuyente = $cuenta -> contribuyente();
				
			if($_FILES["cedula"]["name"]!=""){
       			$tmp = $_FILES["cedula"]["name"];
                
	            $ext = "";
	        	
	        	for($i=0;$i<strlen($tmp);$i++){
	        		if($tmp[$i]=="."){
	        			$ext = "";
	        		}
	        		else{
	        			$ext .= $tmp[$i];
	        		}
	        	}
                
				$file = strtolower($this -> contribuyente -> rfc . "." . $ext);
                
				$archivo = strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cedulas/".$file);

				$this -> contribuyente -> cedula = $file;

				move_uploaded_file($_FILES['cedula']['tmp_name'], $archivo);
			}
			
			if($_FILES["logotipo"]["name"]!=""){
       			$tmp = $_FILES["logotipo"]["name"];
                
	            $ext = "";
	        	
	        	for($i=0;$i<strlen($tmp);$i++){
	        		if($tmp[$i]=="."){
	        			$ext = "";
	        		}
	        		else{
	        			$ext .= $tmp[$i];
	        		}
	        	}
                
				$file = strtolower($this -> contribuyente -> rfc . "." . $ext);
                
				$archivo = strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."logotipos/".$file);

				$this -> contribuyente -> logotipo = $file;

				move_uploaded_file($_FILES['logotipo']['tmp_name'], $archivo);
			}
			
			echo '<script language="javascript" type="text/javascript">
			   window.top.window.stopUpload(1);
			</script>';   
			
			$this->validar();
		}
		
		public function modificarContribuyente(){
			$this -> render(null,null);
			
			$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			if($this -> post("rfc")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-11);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			if($this -> post("nombre")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-12);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			if($this -> post("calle")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-13);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			if($this -> post("exterior")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-14);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}

			if($this -> post("municipio")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-15);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}

			if($this -> post("estado")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-16);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}

			if($this -> post("pais")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-17);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			$this -> contribuyente = Contribuyente::consultar($this -> post("contribuyente"));

			
			if(!$this -> contribuyente){
				$this -> contribuyente = Contribuyente::registrar($cuenta -> rfc, $cuenta -> nombre, $cuenta -> id);		
			}
				
			
			//EL FORMULARIO CON IMAGENES SE ENVIA DIFERENTE, POR LO QUE NO NECESITA LOS UTF8_DECODEs
			
			if($this -> contribuyente){
				$this -> contribuyente -> rfc = ($this -> post("rfc"));			
				$this -> contribuyente -> nombre = ($this -> post("nombre"));
				$this -> contribuyente -> nombre_comercial = ($this -> post("nombre_comercial"));			
				$this -> contribuyente -> calle = ($this -> post("calle"));
				$this -> contribuyente -> exterior = ($this -> post("exterior"));			
				$this -> contribuyente -> interior = ($this -> post("interior"));				
				$this -> contribuyente -> colonia = ($this -> post("colonia"));
				$this -> contribuyente -> localidad = ($this -> post("localidad"));			
				$this -> contribuyente -> cpostal = ($this -> post("cpostal"));				
				$this -> contribuyente -> municipio = ($this -> post("municipio"));
				$this -> contribuyente -> estado = ($this -> post("estado"));			
				$this -> contribuyente -> pais = "HOLA".($this -> post("pais"));				
				$this -> contribuyente -> telefono = ($this -> post("telefono"));
				$this -> contribuyente -> celular = ($this -> post("celular"));			
				$this -> contribuyente -> correo = ($this -> post("correo"));
				
				$this -> contribuyente -> guardar();
				
				$bandera = true;
				
				if(isset($_FILES["cedula"]["name"]) && $_FILES["cedula"]["name"]){
	       			$tmp = $_FILES["cedula"]["name"];
	                
		            $ext = "";
		        	
		        	for($i=0;$i<strlen($tmp);$i++){
		        		if($tmp[$i]=="."){
		        			$ext = "";
		        		}
		        		else{
		        			$ext .= $tmp[$i];
		        		}
		        	}
					
					if(strtoupper($ext)!="JPG" && strtoupper($ext)!="JPEG" && strtoupper($ext)!="PNG" && strtoupper($ext)!="GIF"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
					}
					else{
						$file = strtolower($this -> contribuyente -> rfc . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cedulas/".$file;
		
						$this -> contribuyente -> cedula = $file;
						$this -> contribuyente -> guardar();
		
						if(move_uploaded_file($_FILES['cedula']['tmp_name'], $archivo)){
							
						}	
					}
				}
				else{
					if($this -> contribuyente -> cedula == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cedulas/").$this -> contribuyente -> cedula)){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(1);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
				}
				
				if(isset($_FILES["logotipo"]["name"]) && $_FILES["logotipo"]["name"]){
	       			$tmp = $_FILES["logotipo"]["name"];
	                
		            $ext = "";
		        	
		        	for($i=0;$i<strlen($tmp);$i++){
		        		if($tmp[$i]=="."){
		        			$ext = "";
		        		}
		        		else{
		        			$ext .= $tmp[$i];
		        		}
		        	}
					
					if(strtoupper($ext)!="JPG" && strtoupper($ext)!="JPEG" && strtoupper($ext)!="PNG" && strtoupper($ext)!="GIF"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
					else{
						$file = strtolower($this -> contribuyente -> rfc . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."logotipos/".$file;
		
						$this -> contribuyente -> logotipo = $file;
						$this -> contribuyente -> guardar();
		
						if(move_uploaded_file($_FILES['logotipo']['tmp_name'], $archivo)){
							
						}	
					}
				}
				else{
					if($this -> contribuyente -> logotipo == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."logotipos/").$this -> contribuyente -> logotipo)){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(2);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;	
					}
				}
				
				if($bandera){
					echo '<script language="javascript" type="text/javascript">
					   window.top.window.stopUpload(0);  window.top.window.scrollTo(0,0);
					</script>';  
				} 
				
				$this -> alerta = Alerta::success("El Contribuyente ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> unidad = false;
				
				$this -> alerta = Alerta::error("El Contribuyente buscado no fue encontrado en la Base de Datos.");
				
				echo '<script language="javascript" type="text/javascript">
					   window.top.window.stopUpload(-1);  window.top.window.scrollTo(0,0);
					</script>';  
			}
			
			//$this -> set_response("view");
			
			$this->validar();
		}
	}
?>
