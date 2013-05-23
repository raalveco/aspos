<?php
	Load::lib("alertas");

	class TicketsController extends ApplicationController {
		public function index(){
			$this -> set_response("view");
		}
		
		public function registrar(){
			Ticket::registrar($this -> post("asunto"), $this -> post("mensaje"), $this -> post("departamento"));
		}
		
		public function reporte(){
			$this -> set_response("view");
		}
		
		public function consulta(){
			$this -> render("ticket");
			
			$this -> ticket = Ticket::consultar($id);
			
			$this -> set_response("view");
		}
		
		public function eliminar($id){
			$this -> render("reporte");
			
			$ticket = Ticket::consultar($id);
			
			$ticket -> eliminar();
			
			$this -> alerta = Alerta::success("El Ticket ha sido eliminado correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$ticket = Ticket::consultar($id);
				
				$ticket -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Tickets seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Ticket seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
		}
	}
?>