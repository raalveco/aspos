<?php
	Load::lib("alertas");
	Load::lib("formato");

	class CfdiController extends ApplicationController {
		public function index($mensaje = false){
			$this -> set_response("view");
			
			$this -> permiso_facturar = true;
			$this -> factura = false;
			
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
			
			$tipo_factura = "cfdi";
			
			$this -> matrix = "";
			$this -> xerie = "";
			
			$campos = array("id","nombre");
			$this -> sucursales = Sucursal::reporte("cuenta_id = ".$this -> cuenta -> id." AND cfdi_folios_id > 0","nombre ASC",0,0,$campos);
			
			if(count($this -> sucursales)==1){
				foreach($this -> sucursales as $sucursal){
					$this -> matrix = $sucursal -> id;
				}
			}
			else{
				$this -> matrix = "";
			}
			
			$campos = array("id","serie","cfdi");
			$this -> series = CfdiFolio::reporte("cuenta_id = ".$this -> cuenta -> id." AND actual <= final","serie ASC",0,0,$campos);

			if(count($this -> series)==0){
				$this -> alerta = Alerta::error("Para poder facturar es necesario tener al menos una Serie configurada.");
				$this -> permiso_facturar = false;
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
			
			//Verificar si se cargo imagen de CFDI
			if($this -> series){
				$uno = false;
				$todos = false;
				
				foreach($this -> series as $tmp){
					
					if($tmp -> cfdi == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/").$tmp -> cfdi)){
						$uno = true;
					}
					else{
						$todos = true;	
					}
				}
				
				if(!$todos){
					$this -> alerta = Alerta::error("No se ha cargado el Código Bidimensional para al menos una Serie / Folios.");
					$this -> permiso_facturar = false;
				}
			}
			
			$contribuyente = $this -> cuenta -> contribuyente();
			
			//Verificar si se cargo imagen de Logotipo
			if($contribuyente -> logotipo == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."logotipos/").$contribuyente -> logotipo)){
				$this -> alerta = Alerta::error("No se ha cargado el Logotipo del negocio, el cual se utilizará en el formato de impresión de la Factura.");
				$this -> permiso_facturar = false;
			}
			
			//Verificar si se cargo imagen de Cedula Fiscal
			if($contribuyente -> cedula == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cedulas/").$contribuyente -> cedula)){
				$this -> alerta = Alerta::error("No se ha cargado la Cedula Fiscal	 del negocio, el cual se utilizará en el formato de impresión de la Factura.");
				$this -> permiso_facturar = false;
			}
			
			if($mensaje){
				switch($mensaje){
					case "agregado": $this -> alerta = Alerta::success("El Concepto ha sido registrado correctamente"); break;
					case "quitado": $this -> alerta = Alerta::success("El Concepto ha sido eliminado correctamente"); break;
					case "limpiado": $this -> alerta = Alerta::success("Los Conceptos de la Factura han sido eliminados."); break;
					case "completado": $this -> alerta = Alerta::success("La Factura ha sido generada correctamente."); break;
					case "no_folios": $this -> alerta = Alerta::error("No se encontraron folios para esta Sucursal/Serie."); break;
					case "no_cfdi": $this -> alerta = Alerta::error("No se encontro la imagen del Código Bidimensional para la Sucursal / Serie seleccionada."); break;
					case "no_logo": $this -> alerta = Alerta::error("No se ha cargado el Logotipo del negocio, el cual se utilizará en el formato de impresión de la Factura."); break;
					case "no_cedula": $this -> alerta = Alerta::error("No se ha cargado la Cedula Fiscal del negocio, la cual se utilizará en el formato de impresión de la Factura."); break;
				}
			}
			
			$this -> desde = CfdiFactura::fechaUltimaFactura();
			$this -> hasta = date("d/m/Y");
			
			$this->validar();
		}
		
		public function reporte($filtro = false){
			$this -> set_response("view");
			
			$si = date("N") - 1;
			$sf = 7 - date("N");
			
			$sql = "cuenta_id = ".Session::get("cuenta_id")." AND ";
			
			switch($filtro){
				case "DIA": Session::set("filtro",$sql."fecha >= '".date("Y-m-d 00:00:00")."' AND fecha <= '".date("Y-m-d 23:59:59")."'"); break;
				case "SEMANA": Session::set("filtro",$sql."fecha >= '".date("Y-m-d 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-m-d 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
				case "MES": Session::set("filtro",$sql."fecha >= '".date("Y-m-01 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-m-t 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
				case "ANO": Session::set("filtro",$sql."fecha >= '".date("Y-01-01 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-12-31 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
				default: Session::set("filtro",$sql."fecha >= '".date("Y-m-01 00:00:00",time() - 60 * 60 * 24 * $si)."' AND fecha <= '".date("Y-m-t 23:59:59",time() + 60 * 60 * 24 * $si)."'"); break;
			}
			
			$this->validar();
		}
		
		public function consulta($cfdi_id, $mensaje = false){
			$this -> set_response("view");
			
			$this -> cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			
			$this -> factura = CfdiFactura::consultar($cfdi_id);
			
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
			
			$this->validar();
		}
		
		public function cancelar($cfdi_id){
			$this -> render(null,null);
			
			$factura = CfdiFactura::consultar($cfdi_id);
			
			$factura -> status = "CANCELADA";
			$factura -> guardar();
			
			$this -> redirect("cfdi/consulta/".$factura -> id."/cancelado");
			
			$this->validar();
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
			
			$this -> redirect("cfdi/index/agregado");
			
			$this->validar();
		}

		public function agregarManual(){
			$this -> render(null,null);
			
			if(Session::get("conceptos")){
				$conceptos = Session::get("conceptos");
			}
			else{
				$conceptos = array();
				Session::set("conceptos", $conceptos);
			}
			
			$concepto = array("cantidad" => 0, "id" => 0, "producto" => "", "precio" => 0);
			
			$unidad = Unidad::consultar($this -> post("unidad"));
			
			$concepto["cantidad"] += $this -> post("cantidad");
			$concepto["id"] = str_replace(" ", "-", $this -> post("concepto"));
			$concepto["unidad"] = $unidad -> nombre;
			$concepto["producto"] = $this -> post("concepto");
			$concepto["precio"] = $this -> post("precio");
			
			$conceptos[$concepto["id"]] = $concepto;
			
			Session::set("conceptos", $conceptos);
			
			$this -> redirect("cfdi/index/agregado");
			
			$this->validar();
		}
		
		public function quitar($n = false){
			$this -> render(null,null);
			
			if($n === false){
				$this -> redirect("cfdi/index");
				return;
			}
			
			if(Session::get("conceptos")){
				$conceptos = Session::get("conceptos");
			}
			else{
				$conceptos = array();
				Session::set("conceptos", $conceptos);
				
				$this -> redirect("cfdi/index");
				return;
			}
			
			$tmp = array();
			$x = 0;
			
			if($conceptos) foreach($conceptos as $concepto){
				if($concepto["id"] == $n){
					continue;
				}	
				
				$tmp[$x] = $concepto;
				$x++;
			}
			
			Session::set("conceptos", $tmp);
			
			$this -> redirect("cfdi/index/quitado");
			
			$this->validar();
		}
		
		public function limpiar(){
			$this -> render(null,null);
			
			$conceptos = array();
			Session::set("conceptos", $conceptos);
			
			$this -> redirect("cfdi/index/limpiado");
			
			$this->validar();
		}
		
		public function completar(){
			$this -> render(null,null);
			
			$folios = false;
			$sucursal = 0;
			
			if($this -> post("sucursal")){
				$sucursal_id = $this -> post("sucursal");
				
				$sucursal = Sucursal::consultar($sucursal_id);
				
				$folios = $sucursal -> cfdiFolios();
			}
			
			if($this -> post("serie")){
				$folios_id = $this -> post("serie");
				
				$folios = CfdiFolio::consultar($folios_id);
			}
			
			$cuenta = Cuenta::consultar(Session::get("cuenta_id"));
			$contribuyente = $cuenta -> contribuyente();
			
			//Verificar si se cargo imagen de Logotipo
			if($contribuyente -> logotipo == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."logotipos/").$contribuyente -> logotipo)){
				$this -> redirect("cfdi/index/no_logo");
				return;
			}
			
			//Verificar si se cargo imagen de Cedula Fiscal
			if($contribuyente -> cedula == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cedulas/").$contribuyente -> cedula)){
				$this -> redirect("cfdi/index/no_cedula");
				return;
			}
			
			if($folios){
				if($folios -> cfdi == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/").$folios -> cfdi)){
					$this -> redirect("cfdi/index/no_cfdi");
					return;
				}
				
				$factura = CfdiFactura::registrar($folios -> id, $this -> post("sucursal"), $folios -> serie, $folios -> actual, Formato::FechaDB($this -> post("fecha")));
				
				if($factura){
					$factura -> no_aprobacion = $folios -> numero_aprobacion;
					$factura -> forma_pago = "UNA SOLA EXHIBICIÓN";
					
					$conceptos = Session::get("conceptos");
					
					$subtotal = 0;
					
					if($conceptos) foreach($conceptos as $concepto){
						$subtotal += $concepto["cantidad"] * $concepto["precio"];
						
						$partida = CfdiConcepto::registrar($factura -> id, $concepto["cantidad"], $concepto["producto"], $concepto["precio"]);
					
						$partida -> unidad = $concepto["unidad"];
						$partida -> guardar();
					}
					
					$impuestos = Impuesto::reporte("cuenta_id = ".Session::get("cuenta_id"));
					
					if($impuestos){
						$total_impuestos = 0;
						foreach($impuestos as $impuesto){
							$tmp = $subtotal * $impuesto -> tasa / 100;
							
							$total_impuestos += $tmp;
							
							$tax = CfdiImpuesto::registrar($factura -> id, $impuesto -> nombre, $impuesto -> tasa, $tmp, $impuesto -> tipo);
						}
					}
										
					$total = $subtotal + $total_impuestos;
					$certificado = Certificado::buscar("cuenta_id = ".Session::get("cuenta_id")." AND activo = 'SI'");
					$factura -> no_certificado = $certificado -> numero_serie;
					$factura -> certificado = "MIIE1jCCA76gAwIBAgIUMDAwMDEwMDAwMDAyMDE0NzU2MTEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDcwMzE4MzA1NVoXDTE2MDcwMzE4MzA1NVowggEWMT8wPQYDVQQDEzZBTkFMSVNJUyBDTElOSUNPUyBZIFJBWU9TIFggREUgT0NDSURFTlRFIFMgREUgUkwgREUgQ1YxPzA9BgNVBCkTNkFOQUxJU0lTIENMSU5JQ09TIFkgUkFZT1MgWCBERSBPQ0NJREVOVEUgUyBERSBSTCBERSBDVjE/MD0GA1UEChM2QU5BTElTSVMgQ0xJTklDT1MgWSBSQVlPUyBYIERFIE9DQ0lERU5URSBTIERFIFJMIERFIENWMSUwIwYDVQQtExxBQ1IwNTExMTFJNDcgLyBMRUdKNTkwNDI4NlgyMR4wHAYDVQQFExUgLyBMRUdKNTkwNDI4SEpDRE1SMDIxCjAIBgNVBAsTAUQwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALoFbuiR7tU9QZL3jetHt5FiP9HNuD7WQi+ZZSQD8lotjLNp1l9hWLqLjh6LC8Qbo2878QBGmJDcBwGXg/vzDmzqrAhC/fs0UHA/uMgv5A6q4R0okOsbVTKatq5IzWOBAoJHqUm9o2ByvqgSkfXWctZuBQ14zbB+8LY+/At9i2UDAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMA0GCSqGSIb3DQEBBQUAA4IBAQCW6CSof1MRIAizAaLxVZpkoVl+y03eNDSx9o9t4Q0NrEAAS/KaAHD1gOm3YFfwDdP7wPX15qG5UoJ0UCiLfrK97ct7kZMOukPAW+uPx9NnabJ+eh0x5JCtRPJ64Upvpd/ccSowHC7H2Gtr21Bvr1eZstXsSsGzC95g5XOPRQJFlhQ4DnDo+RSg0E1CBPLh1SS4lPfnsPdD16X53ldjSM52YHLPTOjeD/Ze+QdmI/vubboU3gCmTLNybethO83zKscF1IFXLYViT2UvQiQBXwbWElwUQPCGRWZ34TMWcy+e0+n3pCcjPd4bn/k1YIwUMvDFymtqjaZz20gQst4ufsBd";
					$factura -> sello = "pnDmZwX0Tp+AXoDPuA1hs5n0pMRONzJ7F45gIHoY7sqnfhRvzuZRGqPHnxJPzvgPeDKVrYNYNr6XHICHhzTcdy+Mpj7DPWCb0KBYUu/STuZM/jLTPuX9wrMcPPGbhsQpj1pDhQRzxxd8nRJLAI8SN+qIRE3DW4YnbfRMHSI6iJ8=";
					$factura -> subtotal = $subtotal;
					$factura -> subtotal = $subtotal;
					$factura -> total = $total;
					$factura -> tipo_cambio = "1.00";
					$factura -> moneda = "MXN";
					$factura -> tipo_comprobante = "INGRESO";
					$factura -> metodo_pago = "EFECTIVO";
					$factura -> status = "EMITIDA";
					$factura -> pago = "NO";
					$factura -> envio = "NO";
					
					$factura -> save();
					
					if($contribuyente){
						$emisor = CfdiEmisor::registrar($factura -> id, $contribuyente -> rfc, $contribuyente -> nombre, $contribuyente -> municipio, $contribuyente -> cpostal, $contribuyente -> estado, $contribuyente -> pais);
						$emisor -> calle = $contribuyente -> calle;
						$emisor -> exterior = $contribuyente -> exterior;
						$emisor -> interior = $contribuyente -> interior;
						$emisor ->  colonia = $contribuyente -> colonia;
						$emisor -> localidad = $contribuyente -> localidad;
						
						$emisor -> save();
					}
					
					$cliente_id = $this -> post("cliente");
				
					$cliente = Cliente::consultar($cliente_id);
					
					$receptor = CfdiReceptor::registrar($factura -> id, $cliente -> rfc, $cliente -> nombre, $cliente -> estado, $cliente -> pais);
					
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
				$this -> redirect("cfdi/index/no_folios");
				return;
			}
			
			$conceptos = array();
			Session::set("conceptos", $conceptos);
			
			$this -> redirect("cfdi/consulta/".$factura -> id."/generada");
			
			$this->validar();
		}
			
		public function folios(){
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function registroFolios(){
			$this -> render("folio");
			
			$this -> folios = false;
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function registrarFolios(){
			$this -> render(null,null);
			
			if($this -> post("serie")=="" || $this -> post("numero")=="" || $this -> post("fecha")=="" || $this -> post("tipo_documento")=="" || $this -> post("inicial")=="" || $this -> post("final")=="" || $this -> post("actual")=="" || $this -> post("activo")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			if($this -> post("numero")=="0" || $this -> post("inicial")=="0" || $this -> post("final")==0 || $this -> post("actual")==0){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-4);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			$serie = utf8_decode($this -> post("serie"));
			$numero = utf8_decode($this -> post("numero"));
			$fecha = Formato::FechaDB(utf8_decode($this -> post("fecha")));
			$tipo = utf8_decode($this -> post("tipo_documento"));
			
			$inicial = utf8_decode($this -> post("inicial"));
			$final = utf8_decode($this -> post("final"));
			$actual = utf8_decode($this -> post("actual"));
			$activo = utf8_decode($this -> post("activo"));
			
			$folios = CfdiFolio::registrar($serie,$numero,$fecha,$inicial,$final,$actual,$tipo);
			
			if($folios){
				$folios -> activo = utf8_decode($this -> post("activo"));
				
				$folios -> guardar();
				
				if($_FILES["cfdi"]["name"]!=""){
	       			$tmp = $_FILES["cfdi"]["name"];
	                
		            $ext = "";
		        	
		        	for($i=0;$i<strlen($tmp);$i++){
		        		if($tmp[$i]=="."){
		        			$ext = "";
		        		}
		        		else{
		        			$ext .= $tmp[$i];
		        		}
		        	}
					
					if(strtoupper($ext)!="JPG" && strtoupper($ext)!="JPEG" && strtoupper($ext)!="PNG" && strtoupper($ext)!="GIF"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
						</script>';
						
						return;
					}
					else{
						$file = strtolower($folios -> id . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$file;
		
						$folios -> cfdi = $file;
						
						$folios -> guardar();
		
						move_uploaded_file($_FILES['cfdi']['tmp_name'], $archivo);
					}
				}
				else{
					if($folios -> cfdi == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$folios -> cfdi))){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-1);  window.top.window.scrollTo(0,0);
						</script>';
						
						return;
					}
				}
				
				$this -> alerta = Alerta::success("Los Folios han sido REGISTRADOS correctamente.");
				
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(1);
				</script>';
			}
			else{
				$this -> alerta = Alerta::error("El Número de Aprobación de los folios fue registrado anteriormente.");
				
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(0);
				</script>';  
			}
			
			$this -> folios = $folios;
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function consultaFolios($id){
			$this -> render("folio");
			
			$this -> folios = CfdiFolio::consultar($id);
			
			if(!$this -> folios){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("Los Folios buscados no fueron encontrados en la Base de Datos.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function modificarFolios(){
			$this -> render(null,null);
			
			$bandera = true;
			
			if($this -> post("serie")=="" || $this -> post("numero")=="" || $this -> post("fecha")=="" || $this -> post("tipo_documento")=="" || $this -> post("inicial")=="" || $this -> post("final")=="" || $this -> post("actual")=="" || $this -> post("activo")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			if($this -> post("numero")=="0" || $this -> post("inicial")=="0" || $this -> post("final")==0 || $this -> post("actual")==0){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-4);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			$folios = CfdiFolio::consultar($this -> post("folios"));
			
			if($folios){
				$folios -> serie = utf8_decode($this -> post("serie"));
				$folios -> numero_aprobacion = utf8_decode($this -> post("numero"));
				$folios -> fecha_recepcion = Formato::FechaDB(utf8_decode($this -> post("fecha")));
				$folios -> tipo_documento = utf8_decode($this -> post("tipo_documento"));
				$folios -> inicial = utf8_decode($this -> post("inicial"));
				$folios -> {"final"} = utf8_decode($this -> post("final"));
				$folios -> actual = utf8_decode($this -> post("actual"));
				$folios -> activo = utf8_decode($this -> post("activo"));
				
				$folios -> guardar();
				
				if($_FILES["cfdi"]["name"]!=""){
	       			$tmp = $_FILES["cfdi"]["name"];
	                
		            $ext = "";
		        	
		        	for($i=0;$i<strlen($tmp);$i++){
		        		if($tmp[$i]=="."){
		        			$ext = "";
		        		}
		        		else{
		        			$ext .= $tmp[$i];
		        		}
		        	}
					
					if(strtoupper($ext)!="JPG" && strtoupper($ext)!="JPEG" && strtoupper($ext)!="PNG" && strtoupper($ext)!="GIF"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
					else{
						$file = strtolower($folios -> id . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$file;
		
						$folios -> cfdi = $file;
						
						$folios -> guardar();
		
						move_uploaded_file($_FILES['cfdi']['tmp_name'], $archivo);
					}
				}
				else{
					if($folios -> cfdi == "" || !file_exists(strtolower(APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$folios -> cfdi))){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-1);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
				}
				
				if($bandera){
					$this -> alerta = Alerta::success("Los Folios han sido MODIFICADOS correctamente.");
				
					echo '<script language="javascript" type="text/javascript">
					   window.top.window.stopUpload(1);
					</script>'; 
				}  
				
				 
			}
			else{
				$this -> alerta = Alerta::error("Los Folios buscados no fueron encontrados en la Base de Datos.");
				
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(2);
				</script>';  
			}
			
			$this -> folios = $folios;
			
			$this -> set_response("view");
			
			$this->validar();
		}

		public function certificados(){
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function registroCertificados(){
			$this -> render("certificado");
			
			$this -> certificados = false;
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function registrarCertificados(){
			$this -> render(null,null);
			
			if($this -> post("clave_privada")=="" || $this -> post("numero_serie")=="" || $this -> post("fecha_emision")=="" || $this -> post("fecha_vencimiento")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-4);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			$clave_privada = utf8_decode($this -> post("clave_privada"));
			$numero_serie = utf8_decode($this -> post("numero_serie"));
			$fecha_emision = Formato::FechaDB(utf8_decode($this -> post("fecha_emision")));
			$fecha_vencimiento = Formato::FechaDB(utf8_decode($this -> post("fecha_vencimiento")));
			$activo = "SI";
			
			$bandera = true;
			
			if($_FILES["archivo_cer"]["name"]!=""){
       			$tmp = $_FILES["archivo_cer"]["name"];
                
	            $ext = "";
	        	
	        	for($i=0;$i<strlen($tmp);$i++){
	        		if($tmp[$i]=="."){
	        			$ext = "";
	        		}
	        		else{
	        			$ext .= $tmp[$i];
	        		}
	        	}
	
				if(strtoupper($ext)!="CER"){
					echo '<script language="javascript" type="text/javascript">
					   window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
					</script>';
					
					$bandera = false;
					
					return;
				}
				else{
					$file = strtolower($numero_serie . "." . $ext);
                
					$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$file;
	
					$archivo_cer = $file;
	
					move_uploaded_file($_FILES['archivo_cer']['tmp_name'], $archivo);
				}
			}
			else{
				echo '<script language="javascript" type="text/javascript">
			    window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
			    </script>';					
				$bandera = false;
					
				return;					
			}
			
			if($_FILES["archivo_key"]["name"]!=""){
       			$tmp = $_FILES["archivo_key"]["name"];
                
	            $ext = "";
	        	
	        	for($i=0;$i<strlen($tmp);$i++){
	        		if($tmp[$i]=="."){
	        			$ext = "";
	        		}
	        		else{
	        			$ext .= $tmp[$i];
	        		}
	        	}
				
				if(strtoupper($ext)!="KEY"){
					echo '<script language="javascript" type="text/javascript">
					   window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
					</script>';
					
					$bandera = false;
					
					return;
				}
				else{
					$file = strtolower($numero_serie . "." . $ext);
                
					$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$file;
	
					$archivo_key = $file;
	
					move_uploaded_file($_FILES['archivo_key']['tmp_name'], $archivo);
				}
			}
			else{
				echo '<script language="javascript" type="text/javascript">
			    window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
			    </script>';					
				$bandera = false;					
				return;					
			}
			
			$certificados = Certificado::registrar($archivo_cer, $archivo_key, $clave_privada, $numero_serie, $fecha_emision, $fecha_vencimiento, $activo);
			
			if(!$certificados){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(0);
				</script>'; 
				$bandera = false;					
				return;		
			}
			
			if($bandera){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(1);
				</script>'; 
			}  

			$this -> certificados = $certificados;
			
			$this -> set_response("view");
			
			$this->validar();
		}

		public function modificarCertificados(){
			$this -> render(null,null);
			
			$bandera = true;
			
			if($this -> post("clave_privada")=="" || $this -> post("numero_serie")=="" || $this -> post("fecha_emision")=="" || $this -> post("fecha_vencimiento")==""){
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(-4);  window.top.window.scrollTo(0,0);
				</script>';
				
				return;
			}
			
			$certificados = Certificado::consultar($this -> post("certificados"));
			
			if($certificados){
				$certificados -> clave_privada = utf8_decode($this -> post("clave_privada"));
				$certificados -> numero_serie = utf8_decode($this -> post("numero_serie"));
				$certificados -> fecha_emision = Formato::FechaDB(utf8_decode($this -> post("fecha_emision")));
				$certificados -> fecha_vencimiento = Formato::FechaDB(utf8_decode($this -> post("fecha_vencimiento")));
				$certificados -> activo = "SI";
				
				$certificados -> guardar();
				
				if($_FILES["archivo_cer"]["name"]!=""){
	       			$tmp = $_FILES["archivo_cer"]["name"];
	                
		            $ext = "";
		        	
		        	for($i=0;$i<strlen($tmp);$i++){
		        		if($tmp[$i]=="."){
		        			$ext = "";
		        		}
		        		else{
		        			$ext .= $tmp[$i];
		        		}
		        	}
					
					if(strtoupper($ext)!="CER"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
					else{
						$file = strtolower($certificados -> id . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$file;
		
						$certificados -> archivo_cer = $file;
						
						$certificados -> guardar();
		
						move_uploaded_file($_FILES['archivo_cer']['tmp_name'], $archivo);
					}
				}
				else{
					echo '<script language="javascript" type="text/javascript">
				    window.top.window.stopUpload(-3);  window.top.window.scrollTo(0,0);
				    </script>';					
					$bandera = false;
						
					return;					
				}
				
				if($_FILES["archivo_key"]["name"]!=""){
	       			$tmp = $_FILES["archivo_key"]["name"];
	                
		            $ext = "";
		        	
		        	for($i=0;$i<strlen($tmp);$i++){
		        		if($tmp[$i]=="."){
		        			$ext = "";
		        		}
		        		else{
		        			$ext .= $tmp[$i];
		        		}
		        	}
					
					if(strtoupper($ext)!="KEY"){
						echo '<script language="javascript" type="text/javascript">
						   window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
						</script>';
						
						$bandera = false;
						
						return;
					}
					else{
						$file = strtolower($certificados -> id . "." . $ext);
	                
						$archivo = APP_PATH."public/img".PROYECTO_IMAGENES."cfdis/".$file;
		
						$certificados -> archivo_key = $file;
						
						$certificados -> guardar();
		
						move_uploaded_file($_FILES['archivo_key']['tmp_name'], $archivo);
					}
				}
				else{
					echo '<script language="javascript" type="text/javascript">
				    window.top.window.stopUpload(-2);  window.top.window.scrollTo(0,0);
				    </script>';					
					$bandera = false;
						
					return;					
				}
				if($bandera){
					$this -> alerta = Alerta::success("Los certificados han sido modificados correctamente.");
				
					echo '<script language="javascript" type="text/javascript">
					   window.top.window.stopUpload(1);
					</script>'; 
				}  
				
				 
			}
			else{
				$this -> alerta = Alerta::error("Los certificados buscados no fueron encontrados en la Base de Datos.");
				
				echo '<script language="javascript" type="text/javascript">
				   window.top.window.stopUpload(2);
				</script>';  
			}
			
			$this -> certificados = $certificados;
			
			$this -> set_response("view");
			
			$this->validar();
		}

		public function eliminarCertificado($id){
			$this -> render("certificados");
			
			$folios = Certificado::consultar($id);
			
			$folios -> delete();
			
			$this -> alerta = Alerta::success("El certificado ha sido eliminado correctamente.");
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function eliminarCertificadosSeleccionados($parametros){
			$this -> render("certificados");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$certificados = Certificado::consultar($id);
				
				$certificados -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los certificados seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("Los certificados seleccionados han sido eliminados correctamente.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function conceptos($tipo = "automatico", $permiso){
			$this -> factura = false;
			$this -> permiso_facturar = $permiso;
			
			if($tipo == "automatico"){
				$this -> render("conceptosAutomatico");
				
				$campos = array("id","codigo","nombre");
				$this -> productos = Producto::reporte("cuenta_id = ".Session::get("cuenta_id"),"nombre ASC",0,0,$campos);
			}
			else{
				$this -> render("conceptosManual");
				
				$campos = array("id","nombre");
				$this -> unidades = Unidad::reporte("cuenta_id = ".Session::get("cuenta_id"),"nombre ASC",0,0,$campos);
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}	
		
		public function clienteFactura($cliente){
			Session::set("cliente_factura",$cliente);
			
			$this->validar();
		}
		
		public function sucursalFactura($sucursal){
			Session::set("sucursal_factura",$sucursal);
			
			$this->validar();
		}
		
		public function serieFactura($serie){
			Session::set("serie_factura",$serie);
			
			$this->validar();
		}
		
		public function fechaFactura($d,$m,$y){
			$this -> render(null,null);
			Session::set("fecha_factura",$d."/".$m."/".$y);
			
			echo $d."/".$m."/".$y;
			
			$this->validar();
		}

		public function eliminarFolios($id){
			$this -> render("folios");
			
			$folios = CfdiFolio::consultar($id);
			
			$folios -> delete();
			
			$this -> alerta = Alerta::success("Los Folios ha sido eliminados correctamente.");
			
			$this -> set_response("view");
			
			$this->validar();
		}
		
		public function eliminarFoliosSeleccionados($parametros){
			$this -> render("folios");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$folios = CfdiFolio::consultar($id);
				
				$folios -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Folios seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("Los Folios seleccionados han sido eliminados correctamente.");
			}
			
			$this -> set_response("view");
			
			$this->validar();
		}
	}
	
?>	