<?php
	Load::lib("alertas");
	Load::lib("formato");
	class RegimenesController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("regimenes/reporte");
			
			$this->validar();
		}
		
		public function reporte(){
			$this -> set_response("view");
			
			$this->validar();
		}

		
		public function registroRegimen(){
			$this -> render("registro_regimen");
			
			$this -> regimen = false;
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
			
		public function registrarRegimen(){
			$this -> render("reporte");
			
			$nombre = utf8_decode($this -> post("nombre"));			
			
			$regimen = Regimen::registrar($nombre);
			
			if($regimen){
			
				$regimen -> guardar();
				
				$this -> alerta = Alerta::success("El Regimen ha sido REGISTRADO correctamente.".$regimen->regimen);
			}
			else{
				$this -> alerta = Alerta::error("El Regimen fue registrada anteriormente.");
			}
			
			$this -> $regimen = $regimen;
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function consultaRegimen($id){
			$this -> render("registro_regimen");
			
			$this -> regimen = Regimen::consultar($id);
			
			if(!$this -> regimen){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("El Regimen buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		public function modificarRegimen(){
			$this -> render("reporte");
			
			$regimen = Regimen::consultar($this -> post("regimen"));
			
			if($regimen){
				$regimen -> regimen = utf8_decode($this -> post("nombre"));			
				
				$regimen -> guardar();
				
				$this -> regimen = $regimen;
				
				$this -> alerta = Alerta::success("El Regimen ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> producto = false;
				
				$this -> alerta = Alerta::error("El Regimen no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function eliminarRegimen($id){
			$this -> render("reporte");
			
			$regimen = Regimen::consultar($id);
			
			$regimen -> eliminar();
			
			$this -> alerta = Alerta::success("El Regimen ha sido eliminado correctamente.");
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function eliminarRegimenes($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$regimen = Regimen::consultar($id);
				
				$regimen -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Regimenes seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Regimen seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
	}
?>