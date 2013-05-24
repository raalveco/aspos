<?php
	class MainController extends ApplicationController {
		public function index($opcion = false){
			if($opcion == 1){
				if(Session::get("acceso")){
					$this -> redirect("main/index"); return;
				}
				else{
					$this -> redirect("login");  return;
				}
			}
			
			if(!Session::get("acceso")){
				$this -> render(null,null);
				$this -> redirect("login/index/no_sesion"); return;
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
	}
?>