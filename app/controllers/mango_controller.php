<?php
	class MangoController extends ApplicationController {
		public function index(){
			
		}
		
		public function forms(){
			
		}
        
        public function ajax(){
            $this -> render(null,null);
            $this -> set_response("view");
            
            echo "PRUEBA DE AJAX";
        }
	}
?>