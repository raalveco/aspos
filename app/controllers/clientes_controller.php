<?php
	Load::lib("alertas");

	class ClientesController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("clientes/reporte");
		}
		
		public function reporte($filtro = false){
			$this -> set_response("view");
			
			$sql = "cuenta_id = ".Session::get("cuenta_id")." AND ";
			
			switch($filtro){
				case "AC": Session::set("filtro",$sql."nombre LIKE 'A%' OR nombre LIKE 'B%' OR nombre LIKE 'C%'"); break;
				case "DF": Session::set("filtro",$sql."nombre LIKE 'D%' OR nombre LIKE 'E%' OR nombre LIKE 'F%'"); break;
				case "GI": Session::set("filtro",$sql."nombre LIKE 'G%' OR nombre LIKE 'H%' OR nombre LIKE 'I%'"); break;
				case "JL": Session::set("filtro",$sql."nombre LIKE 'J%' OR nombre LIKE 'K%' OR nombre LIKE 'L%'"); break;
				case "MO": Session::set("filtro",$sql."nombre LIKE 'M%' OR nombre LIKE 'N%' OR nombre LIKE 'O%'"); break;
				case "PS": Session::set("filtro",$sql."nombre LIKE 'P%' OR nombre LIKE 'Q%' OR nombre LIKE 'R%' OR nombre LIKE 'S%'"); break;
				case "TW": Session::set("filtro",$sql."nombre LIKE 'T%' OR nombre LIKE 'U%' OR nombre LIKE 'V%' OR nombre LIKE 'W%'"); break;
				case "XZ": Session::set("filtro",$sql."nombre LIKE 'X%' OR nombre LIKE 'Y%' OR nombre LIKE 'Z%'"); break;
				case "09": Session::set("filtro",$sql."nombre LIKE '0%' OR nombre LIKE '1%' OR nombre LIKE '2%' OR nombre LIKE '3%' OR nombre LIKE '4%' OR nombre LIKE '5%' OR nombre LIKE '6%' OR nombre LIKE '7%' OR nombre LIKE '8%' OR nombre LIKE '9%'"); break;
				default: Session::set("filtro",$sql."id>0");	
			}
			
		}
		
		public function registro(){
			$this -> render("cliente");
			
			$this -> cliente = false;
			
			$this -> set_response("view");
		}
		
		public function registrar(){
			$this -> render("reporte");
						
			$cuenta = utf8_decode($this -> post("cuenta_id"));
			$rfc = utf8_decode($this -> post("rfc"));
			$nombre = utf8_decode($this -> post("nombre"));
			$estado = utf8_decode($this -> post("estado"));
			$pais = utf8_decode($this -> post("pais"));
			
			$cliente = Cliente::registrar($rfc,$nombre,$estado,$pais);
			
			if($cliente){
				$cliente -> tipo_cliente_id = utf8_decode($this -> post("tipo_cliente"));
				
				$cliente -> calle = utf8_decode($this -> post("calle"));
				$cliente -> interior = utf8_decode($this -> post("interior"));
				$cliente -> exterior = utf8_decode($this -> post("exterior"));
				$cliente -> colonia = utf8_decode($this -> post("colonia"));
				$cliente -> localidad = utf8_decode($this -> post("localidad"));
				$cliente -> cpostal = utf8_decode($this -> post("cpostal"));
				$cliente -> municipio = utf8_decode($this -> post("municipio"));
				$cliente -> telefono = utf8_decode($this -> post("telefono"));
				$cliente -> celular = utf8_decode($this -> post("celular"));
				$cliente -> correo = utf8_decode($this -> post("correo"));
				
				$cliente -> guardar();
				
				$this -> alerta = Alerta::success("El Cliente ha sido REGISTRADO correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El RFC del Cliente fue registrado anteriormente.");
			}
			
			$this -> cliente = $cliente;
			
			$this -> set_response("view");
		}
		
		public function consulta($id){
			$this -> render("cliente");
			
			$this -> cliente = Cliente::consultar($id);
			
			if(!$this -> cliente){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("El Cliente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificar(){
			$this -> render("cliente");
			
			$cliente = Cliente::consultar($this -> post("cliente"));
			
			if($cliente){
				$cliente -> tipo_cliente_id = utf8_decode($this -> post("tipo_cliente"));
				
				$cliente -> rfc = utf8_decode($this -> post("rfc"));
				$cliente -> nombre = utf8_decode($this -> post("nombre"));
				$cliente -> estado = utf8_decode($this -> post("estado"));
				$cliente -> pais = utf8_decode($this -> post("pais"));
				
				$cliente -> calle = utf8_decode($this -> post("calle"));
				$cliente -> interior = utf8_decode($this -> post("interior"));
				$cliente -> exterior = utf8_decode($this -> post("exterior"));
				$cliente -> colonia = utf8_decode($this -> post("colonia"));
				$cliente -> localidad = utf8_decode($this -> post("localidad"));
				$cliente -> cpostal = utf8_decode($this -> post("cpostal"));
				$cliente -> municipio = utf8_decode($this -> post("municipio"));
				$cliente -> telefono = utf8_decode($this -> post("telefono"));
				$cliente -> celular = utf8_decode($this -> post("celular"));
				$cliente -> correo = utf8_decode($this -> post("correo"));
				
				$cliente -> comentarios = utf8_decode($this -> post("comentarios"));
				
				$cliente -> guardar();
				
				$this -> cliente = $cliente;
				
				$this -> alerta = Alerta::success("El Cliente ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> cliente = false;
				
				$this -> alerta = Alerta::error("El Cliente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}

		public function eliminar($id){
			$this -> render("reporte");
			
			$cliente = Cliente::consultar($id);
			
			$cliente -> eliminar();
			
			$this -> alerta = Alerta::success("El Cliente ha sido eliminado correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$cliente = Cliente::consultar($id);
				
				$cliente -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Clientes seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Cliente seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
		}
		
		public function reporteTiposCliente(){
			$this -> render("tipos_cliente_reporte");
			
			$this -> set_response("view");
		}
		
		public function registroTipoCliente(){
			$this -> render("tipo_cliente");
			
			$this -> tipo_cliente = false;
			
			$this -> set_response("view");
		}
						
		public function registrarTipoCliente(){
			$this -> render("tipos_cliente_reporte");		
			
			$nombre = utf8_decode($this -> post("nombre"));			
			$descripcion = utf8_decode($this -> post("descripcion"));	
			
			$cliente_tipo = ClienteTipo::registrar($nombre,$descripcion);
			
			if($cliente_tipo){
								
				$cliente_tipo -> guardar();
				
				$this -> alerta = Alerta::success("El Tipo de Cliente ha sido REGISTRADO correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El Tipo de Cliente fue registrado anteriormente.");
			}
			
			$this -> $cliente_tipo = $cliente_tipo;
			
			$this -> set_response("view");
		}
		
		public function modificarTipoCliente(){
			$this -> render("tipos_cliente_reporte");
			
			$cliente_tipo = ClienteTipo::consultar($this -> post("tipo_cliente"));
			
			if($cliente_tipo){
				$cliente_tipo -> nombre = utf8_decode($this -> post("nombre"));			
				$cliente_tipo -> descripcion = utf8_decode($this -> post("descripcion"));
				
				$cliente_tipo -> guardar();
				
				$this -> alerta = Alerta::success("El Tipo de Cliente ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> producto = false;
				
				$this -> alerta = Alerta::error("el Tipo de Cliente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
			
				
		public function consultaTipoCliente($id){
			$this -> render("tipo_cliente");
			
			$this -> tipo_cliente = ClienteTipo::consultar($id);
			
			if(!$this -> tipo_cliente){
				$this -> render("tipos_cliente_reporte");
				
				$this -> alerta = Alerta::error("El Tipo de Cliente buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
			
		public function eliminarTipoCliente($id){
			$this -> render("tipos_cliente_reporte");
			
			$cliente_tipo = ClienteTipo::consultar($id);
			
			$cliente_tipo -> eliminar();
			
			$this -> alerta = Alerta::success("El Tipo de Cliente ha sido eliminado correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarTiposCliente($parametros){
			$this -> render("tipos_cliente_reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$cliente_tipo = ClienteTipo::consultar($id);
				
				$cliente_tipo -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Tipos de Cliente seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Tipo de Cliente seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
		}
	}
?>