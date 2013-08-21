<?php
	Load::lib("alertas");

	class UsuariosController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("login");
			
			$this->validar();
		}
		
		public function reporte($filtro = false){
			$this -> set_response("view");
			
			Session::set("filtro","id>0");
			
			$this->validar();	
		}
		
		public function registro(){
			
			$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			$paquete = $cuenta -> paquete();
			
			if(Usuario::total("cuenta_id = '".Session::get("cuenta_id")."'") + 1 >= $paquete -> usuarios){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("Ya has alcanzado el número máximo de usuarios para el paquete contratado.");
			}
			else{
				$this -> render("usuario");
			
				$this -> usuario = false;	
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function registrar(){
			$this -> render("reporte");
			
			$usuario = utf8_decode($this -> post("usuario"));
			$password = utf8_decode($this -> post("password"));
			
			$usuario = Usuario::registrar($usuario,$password);
			
			if($usuario){
				$usuario -> nombres = utf8_decode($this -> post("nombres"));
				$usuario -> apellidos = utf8_decode($this -> post("apellidos"));
				$usuario -> correo = utf8_decode($this -> post("correo"));
				
				$usuario -> guardar();
				
				$this -> alerta = Alerta::success("El Usuario ha sido REGISTRADO correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El Usuario ya fue registrado anteriormente.");
			}
			
			$this -> usuario = $usuario;
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function consulta($id){
			$this -> render("usuario");
			
			$this -> usuario = Usuario::consultar($id);
			
			if(!$this -> usuario){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("El Usuario buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function modificar(){
			$this -> render("reporte");
			
			$usuario = Usuario::consultar($this -> post("usuario_id"));
			
			if($usuario){
				$usuario -> nombres = utf8_decode($this -> post("nombres"));
				$usuario -> apellidos = utf8_decode($this -> post("apellidos"));
				$usuario -> correo = utf8_decode($this -> post("correo"));
				
				$usuario -> usuario = utf8_decode($this -> post("usuario"));
				
				if($this -> post("password") != "**********"){
					$usuario -> password = sha1(utf8_decode($this -> post("password")));
				}
				
				$usuario -> guardar();
				
				$this -> usuario = $usuario;
				
				$this -> alerta = Alerta::success("El Usuario ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> usuario = false;
				
				$this -> alerta = Alerta::error("El Usuario buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}

		public function eliminar($id){
			$this -> render("reporte");
			
			$usuario = Usuario::consultar($id);
			
			$usuario -> eliminar();
			
			$this -> alerta = Alerta::success("El Usuario ha sido eliminado correctamente.");
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$usuario = Usuario::consultar($id);
				
				$usuario -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Usuarios seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Usuario seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
	}
?>