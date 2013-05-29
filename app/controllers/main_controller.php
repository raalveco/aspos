<?php
	class MainController extends ApplicationController {
		public function index($opcion = false){
			if(!Session::get("acceso")){
				$this -> render(null,null);
				$this -> redirect("login/index/no_sesion"); return;
			}
			
			if($opcion == 1){
				if(Session::get("acceso")){
					$this -> redirect("main/index"); return;
				}
				else{
					$this -> redirect("login/index");  return;
				}
			}
		}
		
		public function mensajes($id){
			$this -> original = Ticket::consultar($id);
			
			if($this -> original -> padre > 0){
				$this -> ticket = $this -> original -> raiz();
			}
			else{
				$this -> ticket = $this -> original;
			}
			
			$this -> set_response("view");
		}
		
		public function numero_mensajes(){
			$this -> render(null,null);
			
			$x = Ticket::total("id > 0");
			
			echo $x ? $x : 0;
		}
		
		public function contestar_usuario(){
			$this -> render("mensajes");
			
			$original = Ticket::consultar($this -> post("id"));
			
			$ticket = Ticket::registrar("RE: ".$original -> asunto,utf8_decode(nl2br($this -> post("mensaje"))), $this -> post("departamento_id"));
			
			if($ticket){
				$original -> respondido = "SI";
				$original -> save();
				
				$ticket -> padre = $this -> post("id");
				$ticket -> admin = "NO";
				$ticket -> admin_nombre = "";
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
		}
	}
?>