<?php
	class ProductosController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("productos/reporte");
		}
		
		public function reporte(){
			$this -> set_response("view");
		}
		
		public function registro(){
			$this -> set_response("view");
		}
		
		public function registro_shortcut(){
			$this -> set_response("view");
		}
	}
?>