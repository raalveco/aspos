<?php
	Load::lib("alertas");
	Load::lib("formato");
	class PaquetesController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("paquetes/reporte");
		}
		
		public function reporte($filtro = "todos"){
			$this -> set_response("view");
			
			switch($filtro){
				case "activos": Session::set("filtro","activo = 'SI'"); break;
				case "inactivos": Session::set("filtro","activo = 'NO'"); break;
				case "vigentes": Session::set("filtro","vigencia > '".date("Y-m-d")."'"); break;
				case "cbb": Session::set("filtro","tipo = 'CBB'"); break;
				case "cfd": Session::set("filtro","tipo = 'CFD'"); break;
				case "cfdi": Session::set("filtro","tipo = 'CFDI'"); break;
				default: Session::set("filtro","id>0"); break;
			}
		}
		
		public function registro(){
			$this -> set_response("view");
			
			$this -> render("registrar");
			
			$this -> paquete = false;
		}
		
		public function registrar(){
			$this -> render("reporte");			
			
			$nombre = utf8_decode($this -> post("nombre"));	
			$tipo = utf8_decode($this -> post("tipo"));			
			
			$paquete = Paquete::registrar($tipo, $nombre);
			
			if($paquete){
				$paquete -> facturas_incluidas = utf8_decode($this -> post("facturas_incluidas"));
				$paquete -> costo_factura_adicional = utf8_decode(Formato::noDinero($this -> post("costo_factura_adicional")));
				$paquete -> usuarios = utf8_decode($this -> post("usuarios"));
				$paquete -> almacenamiento = utf8_decode($this -> post("almacenamiento"));
				$paquete -> soporte_online = utf8_decode($this -> post("soporte_online"));
				$paquete -> soporte_chat = utf8_decode($this -> post("soporte_chat"));
				$paquete -> soporte_telefono = utf8_decode($this -> post("soporte_telefono"));
				$paquete -> multiple_moneda = utf8_decode($this -> post("multiple_moneda"));
				$paquete -> multiple_sucursal = utf8_decode($this -> post("multiple_sucursal"));
				$paquete -> costo_mensual = utf8_decode(Formato::noDinero($this -> post("costo_mensual")));
				$paquete -> costo_anual = utf8_decode(Formato::noDinero($this -> post("costo_anual")));
				$paquete -> vigencia =  Formato::FechaDB(utf8_decode($this -> post("vigencia")));
				$paquete -> activo = utf8_decode($this -> post("activo"));
				
				
				$paquete -> guardar();
				
				$this -> alerta = Alerta::success("El Paquete ha sido REGISTRADO correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El Paquete fue registrado anteriormente.");
			}
			
			$this -> paquete = $paquete;
			
			$this -> set_response("view");
		}

		public function consulta($id){
			$this -> render("registrar");
			
			$this -> paquete = Paquete::consultar($id);
			
			if(!$this -> paquete){
				$this -> render("reporte");				
				$this -> alerta = Alerta::error("El Paquete buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificar(){
			$this -> render("reporte");			
			
			$paquete = Paquete::consultar($this -> post("paquete"));
			
			if($paquete){
				$paquete -> nombre = utf8_decode($this -> post("nombre"));	
				$paquete -> tipo = utf8_decode($this -> post("tipo"));			
				$paquete -> facturas_incluidas = utf8_decode($this -> post("facturas_incluidas"));
				$paquete -> costo_factura_adicional = utf8_decode(Formato::noDinero($this -> post("costo_factura_adicional")));
				$paquete -> usuarios = utf8_decode($this -> post("usuarios"));
				$paquete -> almacenamiento = utf8_decode($this -> post("almacenamiento"));
				$paquete -> soporte_online = utf8_decode($this -> post("soporte_online"));
				$paquete -> soporte_chat = utf8_decode($this -> post("soporte_chat"));
				$paquete -> soporte_telefono = utf8_decode($this -> post("soporte_telefono"));
				$paquete -> multiple_moneda = utf8_decode($this -> post("multiple_moneda"));
				$paquete -> multiple_sucursal = utf8_decode($this -> post("multiple_sucursal"));
				$paquete -> costo_mensual = utf8_decode(Formato::noDinero($this -> post("costo_mensual")));
				$paquete -> costo_anual = utf8_decode(Formato::noDinero($this -> post("costo_anual")));
				$paquete -> vigencia = Formato::FechaDB(utf8_decode($this -> post("vigencia")));
				$paquete -> activo = utf8_decode($this -> post("activo"));
				
				$paquete -> guardar();
				
				$this -> paquete = $paquete;
				
				$this -> alerta = Alerta::success("El Paquete ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> paquete = false;
				
				$this -> alerta = Alerta::error("El Paquete buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}

		public function eliminar($id){
			$this -> render("reporte");
			
			$paquete = Paquete::consultar($id);
			
			$paquete -> eliminar();
			
			$this -> alerta = Alerta::success("El Paquete ha sido eliminado correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$paquete = Paquete::consultar($id);
				
				$paquete -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Paquetes seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Paquete seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
		}
		
	}
?>