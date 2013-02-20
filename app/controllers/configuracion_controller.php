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
			
			$this -> contribuyente = Contribuyente::consultar($id);
			
			if(!$this -> contribuyente){
				$this -> render("index");
				
				$this -> alerta = Alerta::error("El Contribuyente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificarContribuyente(){
			$this -> render("consultaContribuyente");
			
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
				
				$this -> contribuyente -> guardar();
				
				$this -> unidad = $unidad;
				
				$this -> alerta = Alerta::success("El Contribuyente ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> unidad = false;
				
				$this -> alerta = Alerta::error("El Contribuyente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
	}
?>
