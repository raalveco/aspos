<?php
	Load::lib("alertas");
	Load::lib("formato");
	class ImpuestosController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("impuestos/reporte");
		}
		
		public function reporte(){
			$this -> set_response("view");
		}

		
		public function registroImpuesto(){
			$this -> render("registro_impuesto");
			
			$this -> impuesto = false;
			
			$this -> set_response("view");
		}
		
			
		public function registrarImpuesto(){
			$this -> render("reporte");	
			
			$this -> render(null,null);
			
			$nombre = utf8_decode($this -> post("nombre"));			
			$descripcion = utf8_decode($this -> post("nombre"));	
			$tasa = utf8_decode($this -> post("tasa"));	
			$tipo = utf8_decode($this -> post("tipo"));	
			
			$impuesto = Impuesto::registrar($nombre,$descripcion,$tasa,$tipo);
			
			return;
			
			if($impuesto){
								
				$impuesto -> guardar();
				
				$this -> alerta = Alerta::success("El Impuesto ha sido REGISTRADO correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El Impuesto fue registrada anteriormente.");
			}
			
			$this -> $impuesto = $impuesto;
			
			$this -> set_response("view");
		}
		
		public function consultaImpuesto($id){
			$this -> render("registro_impuesto");
			
			$this -> impuesto = Impuesto::consultar($id);
			
			if(!$this -> impuesto){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("El Impuesto buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		public function modificarImpuesto(){
			$this -> render("reporte");
			
			$impuesto = Impuesto::consultar($this -> post("impuesto"));
			
			if($impuesto){
				$impuesto -> nombre = utf8_decode($this -> post("nombre"));			
				$impuesto -> descripcion = utf8_decode($this -> post("nombre"));
				$impuesto -> tasa = utf8_decode($this -> post("tasa"));
				$impuesto -> tipo = utf8_decode($this -> post("tipo"));	
				
				$impuesto -> guardar();
				
				$this -> impuesto = $impuesto;
				
				$this -> alerta = Alerta::success("El Impuesto ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> producto = false;
				
				$this -> alerta = Alerta::error("El Impuesto no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function eliminarImpuesto($id){
			$this -> render("reporte");
			
			$impuesto = Impuesto::consultar($id);
			
			$impuesto -> eliminar();
			
			$this -> alerta = Alerta::success("El Impuesto ha sido eliminado correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarImpuestos($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$impuesto = Impuesto::consultar($id);
				
				$impuesto -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Impuestos seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Impuesto seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
		}
		
	}
?>