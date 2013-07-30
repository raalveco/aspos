<?php
	class LiveController extends ApplicationController{
		var $template = "live";
			
		public function index(){
			$this->validar();
		}
	}
?>