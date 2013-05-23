<?php
	Load::lib("alertas");
	Load::lib("formato");
	class DepartamentosController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("departamentos/reporte");
		}
		
		public function reporte(){
			$this -> set_response("view");
		}
		
		public function registro(){
			$this -> set_response("view");
			
			$this -> render("registrar");
			
			$this -> departamento = false;
		}
		
			
		public function registrar(){
			$this -> render("reporte");		
			
			$nombre = utf8_decode($this -> post("nombre"));			
			$correo = utf8_decode($this -> post("correo"));
			$departamento = Departamento::registrar($nombre,$correo);
			
			if($departamento){
								
				$departamento -> guardar();
				
				$this -> alerta = Alerta::success("El Departamento ha sido REGISTRADO correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El Departamento ha sido REGISTRADO anteriormente.");
			}
			
			$this -> departamento = $departamento;
			
			$this -> set_response("view");
		}
		
		public function consulta($id){
			$this -> render("registrar");
			
			$this -> departamento = Departamento::consultar($id);
			
			if(!$this -> departamento){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("El Departamento buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		public function modificar(){
			$this -> render("reporte");
			
			$departamento = Departamento::consultar($this -> post("departamento"));
			
			if($departamento){
				$departamento -> nombre = utf8_decode($this -> post("nombre"));			
				$departamento -> correo = utf8_decode($this -> post("correo"));
				$departamento -> guardar();
				
				$this -> departamento = $departamento;
				
				$this -> alerta = Alerta::success("El Departamento ha sido actualizado correctamente.");
			}
			else{
				$this -> departamento = false;
				
				$this -> alerta = Alerta::error("El Departamento buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function eliminar($id){
			$this -> render("reporte");
			
			$departamento = Departamento::consultar($id);
			
			$departamento -> eliminar();
			
			$this -> alerta = Alerta::success("El Departamento ha sido eliminado correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$departamento = Departamento::consultar($id);
				
				$departamento -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Departamentos seleccionados han sido eliminados correctamente.");
			}
			else{
			}
			
			$this -> set_response("view");
		}
		
	}
?>