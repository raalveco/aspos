<?php
	Load::lib("alertas");
	Load::lib("formato");

	class CbbController extends ApplicationController {
		public function index($mensaje = false){
			$this -> set_response("view");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			$paquete = $this -> cuenta -> paquete();
			
			Load::lib("permisos");
			
			if(!Permisos::facturasIncluidas(Session::get("cuenta_id"))){
				$this -> alerta = Alerta::warning("El Paquete contratado solo te permite emitir <b>".$paquete -> facturas_incluidas."</b> facturas por mes, emitir una nueva factura tendrá un costo de <b>".$paquete -> costo_factura_adicional." Pesos</b>.");
			}
			
			if(Session::get("conceptos")){
				$conceptos = Session::get("conceptos");
			}
			else{
				$conceptos = array();
				Session::set("conceptos", $conceptos);
			}
			
			$this -> conceptos = $conceptos;
			
			$campos = array("id","rfc","nombre");
			$this -> clientes = Cliente::reporte("cuenta_id = ".$this -> cuenta -> id,"rfc ASC",0,0,$campos);
			
			$campos = array("id","codigo","nombre");
			$this -> productos = Producto::reporte("cuenta_id = ".$this -> cuenta -> id,"nombre ASC",0,0,$campos);
			
			$this -> factura = false;
			
			$tipo_factura = "cbb";
			
			$campos = array("id","nombre");
			$this -> sucursales = Sucursal::reporte("cuenta_id = ".$this -> cuenta -> id." AND cbb_folios_id > 0","nombre ASC",0,0,$campos);
			
			if(count($this -> sucursales)==1){
				foreach($this -> sucursales as $sucursal){
					$this -> matrix = $sucursal -> id;
				}
			}
			else{
				$this -> matrix = "";
			}
			
			$campos = array("id","serie");
			$this -> series = CbbFolio::reporte("cuenta_id = ".$this -> cuenta -> id." AND actual <= final","serie ASC",0,0,$campos);
			
			if(count($this -> series)==0){
				$this -> alerta = Alerta::error("Para poder facturar es necesario tener al menos una serie configurada.");
			}
			else{
				if(count($this -> series)==1){
					foreach($this -> series as $serie){
						$this -> xerie = $serie -> id;
					}
				}
				else{
					$this -> xerie = "";
				}
			}
			
			$this -> desde = CbbFactura::fechaUltimaFactura();
			$this -> hasta = date("d/m/Y");
			
			if($mensaje){
				switch($mensaje){
					case "agregado": $this -> alerta = Alerta::success("El Concepto ha sido registrado correctamente"); break;
					case "quitado": $this -> alerta = Alerta::success("El Concepto ha sido eliminado correctamente"); break;
					case "limpiado": $this -> alerta = Alerta::success("Los Conceptos de la Factura han sido eliminados."); break;
					case "completado": $this -> alerta = Alerta::success("La Factura ha sido generada correctamente."); break;
					case "no_folios": $this -> alerta = Alerta::error("No se encontraron folios para esta Sucursal/Serie."); break;
				}
			}
		}
		
		public function reporte($filtro = false){
			$this -> set_response("view");
			
			$si = date("N") - 1;
			$sf = 7 - date("N");
			
			switch($filtro){
				case "DIA": Session::set("filtro","fecha >= '".date("Y-m-d 00:00:00")."' AND fecha <= '".date("Y-m-d 23:59:59")."'"); break;
				case "SEMANA": Session::set("filtro","fecha >= '".date("Y-m-d 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-m-d 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
				case "MES": Session::set("filtro","fecha >= '".date("Y-m-01 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-m-t 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
				case "AÑO": Session::set("filtro","fecha >= '".date("Y-01-01 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-12-31 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
				default: Session::set("filtro","fecha >= '".date("Y-m-01 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-m-t 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
			}
		}
		
		public function consulta($cbb_id, $mensaje = false){
			$this -> set_response("view");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			$this -> factura = CbbFactura::consultar($cbb_id);
			
			if($mensaje){
				switch($mensaje){
					case "generada": $this -> alerta = Alerta::success("La Factura ha sido generada correctamente."); break;
					case "cancelado": $this -> alerta = Alerta::success("La Factura ha sido cancelada correctamente."); break;
				}
			}
			
			if($mensaje == "generada"){
				$paquete = $this -> cuenta -> paquete();
				
				Load::lib("permisos");
				
				if(!Permisos::facturasIncluidas(Session::get("cuenta_id"))){
					//GENERAR CARGO
					$this -> cobro = Alerta::information("Se ha generado un cargo por ".$paquete -> costo_factura_adicional." Pesos que se verán reflejados en su próxima factura.");
				}
			}
		}
		
		public function cancelar($cbb_id){
			$this -> render(null,null);
			
			$factura = CbbFactura::consultar($cbb_id);
			
			$factura -> status = "CANCELADA";
			$factura -> guardar();
			
			$this -> redirect("cbb/consulta/".$factura -> id."/cancelado");
		}

		public function agregar(){
			$this -> render(null,null);
			
			if(Session::get("conceptos")){
				$conceptos = Session::get("conceptos");
			}
			else{
				$conceptos = array();
				Session::set("conceptos", $conceptos);
			}
			
			$concepto = array("cantidad" => 0, "id" => 0, "producto" => "", "precio" => 0);
			
			$producto = Producto::consultar($this -> post("producto"));
			
			$px = false;
			$n = 0;
			
			if($conceptos) foreach($conceptos as $tmp){
				if($tmp["id"] == $producto -> id){
					$px = $n;
					$concepto = $tmp;
					
					break;
				}
				
				$n++;
			}
			
			$concepto["cantidad"] += $this -> post("cantidad");
			$concepto["id"] = $producto -> id;
			$concepto["unidad"] = $producto -> unidad_id > 0 ? $producto -> unidad() -> nombre : "PIEZA";
			$concepto["producto"] = $producto -> nombre;
			$concepto["precio"] = $producto -> precio_unitario;
			
			if($px === false){
				$conceptos[count($conceptos)] = $concepto;
			}
			else{
				$conceptos[$px] = $concepto;
			}
			
			Session::set("conceptos", $conceptos);
			
			$this -> redirect("cbb/index/agregado");
		}
		
		public function quitar($n = false){
			$this -> render(null,null);
			
			if($n === false){
				$this -> redirect("cbb/index");
				return;
			}
			
			if(Session::get("conceptos")){
				$conceptos = Session::get("conceptos");
			}
			else{
				$conceptos = array();
				Session::set("conceptos", $conceptos);
				
				$this -> redirect("cbb/index");
				return;
			}
			
			$tmp = array();
			$x = 0;
			$y;
			
			if($conceptos) foreach($conceptos as $concepto){
				if($n - 1 != $y){
					$tmp[$x] = $concepto;
					$x++;
				}
				
				$y++;
			}
			
			Session::set("conceptos", $tmp);
			
			$this -> redirect("cbb/index/quitado");
		}
		
		public function limpiar(){
			$this -> render(null,null);
			
			$conceptos = array();
			Session::set("conceptos", $conceptos);
			
			$this -> redirect("cbb/index/limpiado");
		}
		
		public function completar(){
			$this -> render(null,null);
			
			$folios = false;
			$sucursal = 0;
			
			if($this -> post("sucursal")){
				$sucursal_id = $this -> post("sucursal");
				
				$sucursal = Sucursal::consultar($sucursal_id);
				
				$folios = $sucursal -> cbbFolios();
			}
			
			if($this -> post("serie")){
				$folios_id = $this -> post("serie");
				
				$folios = CbbFolio::consultar($folios_id);
			}
			
			if($folios){
				$factura = CbbFactura::registrar($folios -> id, $this -> post("sucursal"), $folios -> serie, $folios -> actual, Formato::FechaDB($this -> post("fecha")));
				
				if($factura){
					$factura -> no_aprobacion = $folios -> numero_aprobacion;
					$factura -> forma_pago = "UNA SOLA EXHIBICIÓN";
					
					$conceptos = Session::get("conceptos");
					
					$subtotal = 0;
					
					if($conceptos) foreach($conceptos as $concepto){
						$subtotal += $concepto["cantidad"] * $concepto["precio"];
						
						$partida = CbbConcepto::registrar($factura -> id, $concepto["cantidad"], $concepto["producto"], $concepto["precio"]);
					}
					
					$impuestos = Impuesto::reporte("cuenta_id = ".Session::get("cuenta_id"));
					
					if($impuestos){
						$total_impuestos = 0;
						foreach($impuestos as $impuesto){
							$tmp = $subtotal * $impuesto -> tasa / 100;
							
							$total_impuestos += $tmp;
							
							$tax = CbbImpuesto::registrar($factura -> id, $impuesto -> nombre, $impuesto -> tasa, $tmp, $impuesto -> tipo);
						}
					}
					
					$total = $subtotal + $total_impuestos;
					
					$factura -> subtotal = $subtotal;
					$factura -> total = $total;
					$factura -> status = "EMITIDA";
					$factura -> pago = "NO";
					$factura -> envio = "NO";
					
					$factura -> save();
					
					$cliente_id = $this -> post("cliente");
				
					$cliente = Cliente::consultar($cliente_id);
					
					$receptor = CbbReceptor::registrar($factura -> id, $cliente -> rfc, $cliente -> nombre, $cliente -> estado, $cliente -> pais);
					
					if($receptor){
						$receptor -> calle = $cliente -> calle;
						$receptor -> exterior = $cliente -> exterior;
						$receptor -> interior = $cliente -> interior;
						$receptor -> colonia = $cliente -> colonia;
						
						$receptor -> localidad = $cliente -> localidad;
						$receptor -> municipio = $cliente -> municipio;
						$receptor -> cpostal = $cliente -> cpostal;
						
						$receptor -> save();
					}
				}
			}
			else{
				$this -> redirect("cbb/index/no_folios");
				return;
			}
			
			$this -> redirect("cbb/consulta/".$factura -> id."/generada");
		}
			
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