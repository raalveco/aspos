<?php
	Load::lib("alertas");
	Load::lib("formato");

	class CbbController extends ApplicationController {
		public function folios(){
			$this -> set_response("view");
		}
		
		public function registroFolios(){
			$this -> render("folio");
			
			$this -> folios = false;
			
			$this -> set_response("view");
		}
		
		public function registrarFolios(){
			$this -> render("folio");
			
			$serie = utf8_decode($this -> post("serie"));
			$numero = utf8_decode($this -> post("numero"));
			$fecha = Formato::FechaDB(utf8_decode($this -> post("fecha")));
			$tipo = utf8_decode($this -> post("tipo_documento"));
			
			$inicial = utf8_decode($this -> post("inicial"));
			$final = utf8_decode($this -> post("final"));
			$actual = utf8_decode($this -> post("actual"));
			$activo = utf8_decode($this -> post("activo"));
			
			$folios = CbbFolio::registrar($serie,$numero,$fecha,$inicial,$final,$actual,$tipo);
			
			if($folios){
				$folios -> activo = utf8_decode($this -> post("activo"));
				
				$folios -> guardar();
				
				$this -> alerta = Alerta::success("Los Folios han sido REGISTRADOS correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El Número de Aprobación de los folios fue registrado anteriormente.");
			}
			
			$this -> folios = $folios;
			
			$this -> set_response("view");
		}
		
		public function consultaFolios($id){
			$this -> render("folio");
			
			$this -> folios = CbbFolio::consultar($id);
			
			if(!$this -> folios){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("Los Folios buscados no fueron encontrados en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificarFolios(){
			$this -> render("folio");
			
			$folios = CbbFolio::consultar($this -> post("folios"));
			
			if($folios){
				$folios -> serie = utf8_decode($this -> post("serie"));
				$folios -> numero_aprobacion = utf8_decode($this -> post("numero"));
				$folios -> fecha_recepcion = Formato::FechaDB(utf8_decode($this -> post("fecha")));
				$folios -> tipo_documento = utf8_decode($this -> post("tipo_documento"));
				$folios -> inicial = utf8_decode($this -> post("inicial"));
				$folios -> final = utf8_decode($this -> post("final"));
				$folios -> actual = utf8_decode($this -> post("actual"));
				$folios -> activo = utf8_decode($this -> post("activo"));
				
				$folios -> guardar();
				
				$this -> alerta = Alerta::success("Los Folios han sido MODIFICADOS correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("Los Folios buscados no fueron encontrados en la Base de Datos.");
			}
			
			$this -> folios = $folios;
			
			$this -> set_response("view");
		}

		public function eliminarFolios($id){
			$this -> render("folios");
			
			$folios = CbbFolio::consultar($id);
			
			$folios -> delete();
			
			$this -> alerta = Alerta::success("Los Folios ha sido eliminados correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarFoliosSeleccionados($parametros){
			$this -> render("folios");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$folios = CbbFolio::consultar($id);
				
				$folios -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Folios seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("Los Folios seleccionados han sido eliminados correctamente.");
			}
			
			$this -> set_response("view");
		}
	}
	
?>	