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
		
		public function consulta($id){
			$this -> render("ticket");
			
			$this -> original = Ticket::consultar($id);
			if($this -> original -> padre > 0){
				$this -> ticket = $this -> original -> raiz();
			}
			else{
				$this -> ticket = $this -> original;
			}
			
			$this -> set_response("view");
		}
		
		public function contestar_admin(){
			$this -> render("ticket");
			
			$ticket = Ticket::registrar("Respuesta de ADMIN",utf8_decode(nl2br($this -> post("mensaje"))), $this -> post("departamento_id"));
			
			if($ticket){
				$original = Ticket::consultar($this -> post("id"));
				
				$original -> respondido = "SI";
				$original -> save();
				
				$ticket -> padre = $this -> post("id");
				$ticket -> admin = "SI";
				$ticket -> admin_id = 2; //COLOCAR ID DEL ADMINISTRADOR QUE RESPONDA
				$ticket -> cuenta_id = 0;
				$ticket -> usuario_id = 0;
				
				$ticket -> save();
				
				$this -> original = Ticket::consultar($ticket -> id);
			}
			else{
				$this -> original = Ticket::consultar($this -> post("id"));
			}
			
			$this -> ticket = $this -> original -> raiz();
			
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