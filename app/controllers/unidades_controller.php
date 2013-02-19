<?php
	Load::lib("alertas");
	Load::lib("formato");
	class UnidadesController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("unidades/reporte");
		}
		
		public function reporte(){
			$this -> set_response("view");
		}
		
		public function registroUnidad(){
			$this -> render("registro_unidad");
			
			$this -> unidad = false;
			
			$this -> set_response("view");
		}
		
			
		public function registrarUnidad(){
			$this -> render("reporte");		
			
			$nombre = utf8_decode($this -> post("nombre"));			
			$descripcion = utf8_decode($this -> post("descripcion"));	
			
			$unidad = Unidad::registrar($nombre,$descripcion);
			
			if($unidad){
								
				$unidad -> guardar();
				
				$this -> alerta = Alerta::success("La Unidad ha sido REGISTRADA correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("La Unidad fue registrada anteriormente.");
			}
			
			$this -> $unidad = $unidad;
			
			$this -> set_response("view");
		}
		
		public function consultaUnidad($id){
			$this -> render("registro_unidad");
			
			$this -> unidad = Unidad::consultar($id);
			
			if(!$this -> unidad){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("La Unidad buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		public function modificarUnidad(){
			$this -> render("reporte");
			
			$unidad = Unidad::consultar($this -> post("unidad"));
			
			if($unidad){
				$unidad -> nombre = utf8_decode($this -> post("nombre"));			
				$unidad -> descripcion = utf8_decode($this -> post("descripcion"));
				
				$unidad -> guardar();
				
				$this -> unidad = $unidad;
				
				$this -> alerta = Alerta::success("La Unidad ha sido ACTUALIZADA correctamente.");
			}
			else{
				$this -> unidad = false;
				
				$this -> alerta = Alerta::error("La Unidad buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function eliminarUnidad($id){
			$this -> render("reporte");
			
			$unidad = Unidad::consultar($id);
			
			$unidad -> eliminar();
			
			$this -> alerta = Alerta::success("La Unidad ha sido eliminada correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarUnidades($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$unidad = Unidad::consultar($id);
				
				$unidad -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Unidades seleccionadas han sido eliminadas correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("La Unidad seleccionada ha sido eliminada correctamente.");
			}
			
			$this -> set_response("view");
		}
		
	}
?>