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
		
		public function fiscal(){
			$this -> render("consultaContribuyente");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			$this -> contribuyente = Contribuyente::consultar(Session::get("contribuyente_id"));
			
			if(!$this -> contribuyente){
				$this -> render("index");
				
				$this -> alerta = Alerta::error("El Contribuyente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
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
		}
		
		public function modificarContribuyente(){
			$this -> render(null,null);
			
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
			
			if($this -> contribuyente){
				$this -> contribuyente -> rfc = utf8_decode($this -> post("rfc"));			
				$this -> contribuyente -> nombre = utf8_decode($this -> post("nombre"));
				$this -> contribuyente -> nombre_comercial = utf8_decode($this -> post("nombre_comercial"));			
				$this -> contribuyente -> calle = utf8_decode($this -> post("calle"));
				$this -> contribuyente -> exterior = utf8_decode($this -> post("exterior"));			
				$this -> contribuyente -> interior = utf8_decode($this -> post("interior"));				
				$this -> contribuyente -> colonia = utf8_decode($this -> post("colonia"));
				$this -> contribuyente -> localidad = utf8_decode($this -> post("localidad"));			
				$this -> contribuyente -> cpostal = utf8_decode($this -> post("cpostal"));				
				$this -> contribuyente -> municipio = utf8_decode($this -> post("municipio"));
				$this -> contribuyente -> estado = utf8_decode($this -> post("estado"));			
				$this -> contribuyente -> pais = utf8_decode($this -> post("pais"));				
				$this -> contribuyente -> telefono = utf8_decode($this -> post("telefono"));
				$this -> contribuyente -> celular = utf8_decode($this -> post("celular"));			
				$this -> contribuyente -> correo = utf8_decode($this -> post("correo"));
				
				$bandera = true;
				
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
					
					if(strtoupper($ext)!="JPG" && strtoupper($ext)!="JPEG" && strtoupper($ext)!="PNG" && strtoupper($ext)!="GIF"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
					}
					else{
						$file = strtoupper($this -> contribuyente -> rfc . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cedulas/".$file;
		
						$this -> contribuyente -> cedula = $file;
		
						move_uploaded_file($_FILES['cedula']['tmp_name'], $archivo);	
					}
				}
				else{
					if($this -> contribuyente -> cedula == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cedulas/".$this -> contribuyente -> cedula))){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(1);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
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
					
					if(strtoupper($ext)!="JPG" && strtoupper($ext)!="JPEG" && strtoupper($ext)!="PNG" && strtoupper($ext)!="GIF"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
					else{
						$file = strtoupper($this -> contribuyente -> rfc . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."logotipos/".$file;
		
						$this -> contribuyente -> cedula = $file;
		
						move_uploaded_file($_FILES['logotipo']['tmp_name'], $archivo);	
					}
				}
				else{
					if($this -> contribuyente -> logotipo == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."logotipos/".$this -> contribuyente -> logotipo))){
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
				
				$this -> contribuyente -> guardar();
				
				$this -> alerta = Alerta::success("El Contribuyente ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> unidad = false;
				
				$this -> alerta = Alerta::error("El Contribuyente buscado no fue encontrado en la Base de Datos.");
				
				echo '<script language="javascript" type="text/javascript">
					   window.top.window.stopUpload(-1);  window.top.window.scrollTo(0,0);
					</script>';  
			}
			echo "HOLA";
			//$this -> set_response("view");
		}
	}
?>
