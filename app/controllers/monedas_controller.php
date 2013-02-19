<?php
	Load::lib("alertas");
	Load::lib("formato");
	class MonedasController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("monedas/reporte");
		}
		
		public function reporte(){
			$this -> set_response("view");
		}
		
		public function registroMoneda(){
			$this -> render("registro_moneda");
			
			$this -> moneda = false;
			
			$this -> set_response("view");
		}
		
			
		public function registrarMoneda(){
			$this -> render("reporte");		
			
			$nombre = utf8_decode($this -> post("nombre"));			
			$descripcion = utf8_decode($this -> post("descripcion"));
			$cambio = utf8_decode($this -> post("cambio"));	
			
			$moneda = Moneda::registrar($nombre,$descripcion,$cambio);
			
			if($moneda){
								
				$moneda -> guardar();
				
				$this -> alerta = Alerta::success("La Moneda ha sido REGISTRADA correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("La Moneda fue registrada anteriormente.");
			}
			
			$this -> moneda = $moneda;
			
			$this -> set_response("view");
		}
		
		public function consultaMoneda($id){
			$this -> render("registro_moneda");
			
			$this -> moneda = Moneda::consultar($id);
			
			if(!$this -> moneda){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("La Moneda buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		public function modificarMoneda(){
			$this -> render("reporte");
			
			$moneda = Moneda::consultar($this -> post("moneda"));
			
			if($moneda){
				$moneda -> nombre = utf8_decode($this -> post("nombre"));			
				$moneda -> descripcion = utf8_decode($this -> post("descripcion"));
				$moneda -> tipo_cambio = utf8_decode($this -> post("cambio"));
				
				$moneda -> guardar();
				
				$this -> moneda = $moneda;
				
				$this -> alerta = Alerta::success("La Moneda ha sido ACTUALIZADA correctamente.");
			}
			else{
				$this -> moneda = false;
				
				$this -> alerta = Alerta::error("La Moneda buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function eliminarMoneda($id){
			$this -> render("reporte");
			
			$moneda = Moneda::consultar($id);
			
			$moneda -> eliminar();
			
			$this -> alerta = Alerta::success("La Moneda ha sido eliminada correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarMonedas($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$moneda = Moneda::consultar($id);
				
				$moneda -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Monedas seleccionadas han sido eliminadas correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("La Monedas seleccionada ha sido eliminada correctamente.");
			}
			
			$this -> set_response("view");
		}
		
	}
?>