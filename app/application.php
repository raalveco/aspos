<?php
/**
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 **/
class ApplicationController extends Controller {
	public function validar(){
		if(!Session::get("acceso")){
			$this -> render(null,null);
			$this -> redirect("login/index/no_sesion"); return;
		}
	}
}
