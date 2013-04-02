<?php
	Load::lib("alertas");
	Load::lib("formato");
	class SucursalesController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("sucursales/reporte");
		}
		
		public function reporte(){
			$this -> set_response("view");
			Session::set("filtro","id>0");
		}
		
		public function registro(){
			$this -> set_response("view");
			
			$this -> render("registrar");
			
			$this -> sucursal = false;
		}
		
		public function registrar(){
			$this -> render("reporte");
			
			$nombre = utf8_decode($this -> post("nombre"));			
			
			$sucursal = Sucursal::registrar($nombre);
			
			if($sucursal){
				$sucursal -> codigo = utf8_decode($this -> post("codigo"));
				$sucursal -> domicilio = utf8_decode($this -> post("domicilio"));
				$sucursal -> colonia = utf8_decode($this -> post("colonia"));
				$sucursal -> ciudad = utf8_decode($this -> post("ciudad"));
				$sucursal -> estado = utf8_decode($this -> post("estado"));
				$sucursal -> cpostal = utf8_decode($this -> post("cpostal"));
				
				$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
				$paquete = $cuenta -> paquete();
				
				if($paquete -> tipo == "CBB"){
					$sucursal -> cbb_folios_id = utf8_decode($this -> post("serie"));
				}
				
				if($paquete -> tipo == "CFD"){
					$sucursal -> cfd_folios_id = utf8_decode($this -> post("serie"));
				}
				
				if($paquete -> tipo == "CFDI"){
					$sucursal -> cfdi_folios_id = utf8_decode($this -> post("serie"));
				}
				
				$sucursal -> guardar();
				
				$this -> alerta = Alerta::success("La Sucursal ha sido REGISTRADA correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("La Sucursal fue registrada anteriormente.");
			}
			
			$this -> sucursal = $sucursal;
			
			$this -> set_response("view");
		}

		public function consulta($id){
			$this -> render("registrar");
			
			$this -> sucursal = Sucursal::consultar($id);
			
			if(!$this -> sucursal){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("La Sucursal buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificar(){
			$this -> render("reporte");
			
			$sucursal = Sucursal::consultar($this -> post("sucursal"));
			
			if($sucursal){
				$sucursal -> nombre = utf8_decode($this -> post("nombre"));		
				$sucursal -> codigo = utf8_decode($this -> post("codigo"));
				$sucursal -> domicilio = utf8_decode($this -> post("domicilio"));
				$sucursal -> colonia = utf8_decode($this -> post("colonia"));
				$sucursal -> ciudad = utf8_decode($this -> post("ciudad"));
				$sucursal -> estado = utf8_decode($this -> post("estado"));
				$sucursal -> cpostal = utf8_decode($this -> post("cpostal"));
				
				$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
				$paquete = $cuenta -> paquete();
				
				if($paquete -> tipo == "CBB"){
					$sucursal -> cbb_folios_id = utf8_decode($this -> post("serie"));
				}
				
				if($paquete -> tipo == "CFD"){
					$sucursal -> cfd_folios_id = utf8_decode($this -> post("serie"));
				}
				
				if($paquete -> tipo == "CFDI"){
					$sucursal -> cfdi_folios_id = utf8_decode($this -> post("serie"));
				}
				
				$sucursal -> guardar();
				
				$this -> sucursal = $sucursal;
				
				$this -> alerta = Alerta::success("La Sucursal ha sido ACTUALIZADA correctamente.");
			}
			else{
				$this -> sucursal = false;
				
				$this -> alerta = Alerta::error("La Sucursal buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}

		public function eliminar($id){
			$this -> render("reporte");
			
			$sucursal = Sucursal::consultar($id);
			
			$sucursal -> eliminar();
			
			$this -> alerta = Alerta::success("La Sucursal ha sido eliminada correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$sucursal = Sucursal::consultar($id);
				
				$sucursal -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Sucursales seleccionadas han sido eliminadas correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("La Sucursal seleccionadoa ha sido eliminada correctamente.");
			}
			
			$this -> set_response("view");
		}
		
	}
?>