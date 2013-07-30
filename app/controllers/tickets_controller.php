<?php
	Load::lib("alertas");

	class TicketsController extends ApplicationController {
		public function index(){
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function registrar(){
			$this -> render(null,null);
			Ticket::registrar($this -> post("asunto"), nl2br($this -> post("mensaje")), $this -> post("departamento"));
			
			$this->validar();
		}
		
		public function registrar_mensaje(){
			$this -> render(null,null);
			Ticket::registrar_mensaje($this -> post("asunto"), nl2br($this -> post("mensaje")), $this -> post("cuenta"));
			
			$this->validar();
		}
		
		public function reporte(){
			$this -> set_response("view");
			
			$this->validar();
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
			
			$this->validar();
		}
		
		public function contestar_admin(){
			$this -> render("ticket");
			
			$original = Ticket::consultar($this -> post("id"));
			
			$ticket = Ticket::registrar("RE: ".$original -> asunto,utf8_decode(nl2br($this -> post("mensaje"))), $this -> post("departamento_id"));
			
			if($ticket){
				$original -> respondido = "SI";
				$original -> save();
				
				$ticket -> padre = $this -> post("id");
				$ticket -> admin = "SI";
				$ticket -> admin_nombre = Session::get("empresa");
				$ticket -> cuenta_id = $original -> cuenta_id;
				$ticket -> usuario_id = $original -> usuario_id;
				
				$ticket -> save();
				
				$this -> original = Ticket::consultar($ticket -> id);
			}
			else{
				$this -> original = Ticket::consultar($this -> post("id"));
			}
			
			$this -> ticket = $this -> original -> raiz();
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function cerrar($id){
			$this -> render("reporte");
			
			$ticket = Ticket::consultar($id);
			
			$ticket -> cerrar();
			
			//$ticket -> eliminar();
			
			$this -> alerta = Alerta::success("El Ticket ha sido cerrado correctamente.");
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$ticket = Ticket::consultar($id);
				
				$ticket -> cerrar();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Tickets seleccionados han sido cerrados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Ticket seleccionado ha sido cerrado correctamente.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
	}
?>
