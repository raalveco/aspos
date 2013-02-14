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
	}
?>