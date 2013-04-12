<?php
	Load::lib("alertas");

	class CuentasController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("cuentas/reporte");
		}
		
		public function reporte($filtro = false){
			$this -> set_response("view");
			
			switch($filtro){
				case "AC": Session::set("filtro","nombre_contacto LIKE 'A%' OR nombre_contacto LIKE 'B%' OR nombre_contacto LIKE 'C%'"); break;
				case "DF": Session::set("filtro","nombre_contacto LIKE 'D%' OR nombre_contacto LIKE 'E%' OR nombre_contacto LIKE 'F%'"); break;
				case "GI": Session::set("filtro","nombre_contacto LIKE 'G%' OR nombre_contacto LIKE 'H%' OR nombre_contacto LIKE 'I%'"); break;
				case "JL": Session::set("filtro","nombre_contacto LIKE 'J%' OR nombre_contacto LIKE 'K%' OR nombre_contacto LIKE 'L%'"); break;
				case "MO": Session::set("filtro","nombre_contacto LIKE 'M%' OR nombre_contacto LIKE 'N%' OR nombre_contacto LIKE 'O%'"); break;
				case "PS": Session::set("filtro","nombre_contacto LIKE 'P%' OR nombre_contacto LIKE 'Q%' OR nombre_contacto LIKE 'R%' OR nombre_contacto LIKE 'S%'"); break;
				case "TW": Session::set("filtro","nombre_contacto LIKE 'T%' OR nombre_contacto LIKE 'U%' OR nombre_contacto LIKE 'V%' OR nombre_contacto LIKE 'W%'"); break;
				case "XZ": Session::set("filtro","nombre_contacto LIKE 'X%' OR nombre_contacto LIKE 'Y%' OR nombre_contacto LIKE 'Z%'"); break;
				case "09": Session::set("filtro","nombre_contacto LIKE '0%' OR nombre_contacto LIKE '1%' OR nombre_contacto LIKE '2%' OR nombre_contacto LIKE '3%' OR nombre_contacto LIKE '4%' OR nombre_contacto LIKE '5%' OR nombre_contacto LIKE '6%' OR nombre_contacto LIKE '7%' OR nombre_contacto LIKE '8%' OR nombre_contacto LIKE '9%'"); break;
				default: Session::set("filtro","id>0");	
			}
		}
		
		public function registro(){
			$this -> render("cuenta");
			
			$this -> cuenta = false;
			
			$this -> set_response("view");
		}
		
		public function registrar(){
			$this -> render("cuenta");
			
			$nombre = utf8_decode($this -> post("nombre"));
			$rfc = utf8_decode($this -> post("rfc"));
			
			$cuenta = Cuenta::registrar($rfc, $nombre, $this -> post("paquete"));
			
			if($cuenta){
				
				$cuenta -> telefono_contacto = utf8_decode($this -> post("telefono"));
				$cuenta -> celular_contacto = utf8_decode($this -> post("celular"));
				$cuenta -> correo_contacto = utf8_decode($this -> post("correo"));
				
				$cuenta -> save();
				
				//GENERAR CONTRASEÑA ALEATORIA (NUMERICA)(SHA1)
				Load::lib("formato");
				$password = Formato::ceros(rand(0,999999),6);
				$cuenta -> password = sha1($password);
				
				$cuenta -> guardar();
				
				$contribuyente = Contribuyente::registrar($rfc, $nombre, $cuenta -> id);
				$contribuyente -> cuenta_id = $cuenta -> id;
				
				$contribuyente -> calle = utf8_decode($this -> post("calle"));
				$contribuyente -> exterior = utf8_decode($this -> post("exterior"));			
				$contribuyente -> interior = utf8_decode($this -> post("interior"));				
				$contribuyente -> colonia = utf8_decode($this -> post("colonia"));
				$contribuyente -> localidad = utf8_decode($this -> post("localidad"));			
				$contribuyente -> cpostal = utf8_decode($this -> post("cpostal"));				
				$contribuyente -> municipio = utf8_decode($this -> post("municipio"));
				$contribuyente -> estado = utf8_decode($this -> post("estado"));			
				$contribuyente -> pais = utf8_decode($this -> post("pais"));
				
				$contribuyente -> guardar();
				
				$this -> alerta = Alerta::success("La Cuenta ha sido REGISTRADA correctamente. [Contraseña: ".$password."][ENVIAR CORREO]");
			}
			else{
				$this -> alerta = Alerta::error("El Correo de la Cuenta ya había sido registrado anteriormente.");
			}
			
			$this -> cuenta = $cuenta;
			
			//ENVIAR CORREO DE CONFIRMACION DE REGISTRO Y CONTRASEÑA DE ADMINISTRADOR
			
			$this -> set_response("view");
		}
		
		public function consulta($id){
			$this -> render("cuenta");
			
			$this -> cuenta = Cuenta::consultar($id);
			
			if(!$this -> cuenta){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("La Cuenta buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificar(){
			$this -> render("cuenta");
			
			$cuenta = Cuenta::consultar($this -> post("cuenta"));
			
			if($cuenta){
				$contribuyente = $cuenta -> contribuyente();
				
				$cuenta -> nombre = utf8_decode($this -> post("nombre"));
				$cuenta -> rfc = utf8_decode($this -> post("rfc"));
				$cuenta -> paquete_id = utf8_decode($this -> post("paquete"));
				
				$cuenta -> activo = utf8_decode($this -> post("activo"));
				
				$cuenta -> telefono_contacto = utf8_decode($this -> post("telefono"));
				$cuenta -> celular_contacto = utf8_decode($this -> post("celular"));
				$cuenta -> correo_contacto = utf8_decode($this -> post("correo"));
				
				if(Session::get("administrador_id")){
					$cuenta -> usuario_edicion_id = Session::get("administrador_id");
				}
				else{	
					$cuenta -> usuario_edicion_id = 0;
				}
				
				$cuenta -> fecha_edicion = date("Y-m-d H:i:s");
				
				$cuenta -> guardar();
				
				$this -> cuenta = $cuenta;
				
				$contribuyente -> calle = utf8_decode($this -> post("calle"));
				$contribuyente -> exterior = utf8_decode($this -> post("exterior"));			
				$contribuyente -> interior = utf8_decode($this -> post("interior"));				
				$contribuyente -> colonia = utf8_decode($this -> post("colonia"));
				$contribuyente -> localidad = utf8_decode($this -> post("localidad"));			
				$contribuyente -> cpostal = utf8_decode($this -> post("cpostal"));				
				$contribuyente -> municipio = utf8_decode($this -> post("municipio"));
				$contribuyente -> estado = utf8_decode($this -> post("estado"));			
				$contribuyente -> pais = utf8_decode($this -> post("pais"));
				
				$contribuyente -> guardar();
				
				$this -> alerta = Alerta::success("La Cuenta ha sido ACTUALIZADA correctamente.");
			}
			else{
				$this -> cuenta = false;
				
				$this -> alerta = Alerta::error("La Cuenta buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}

		public function eliminar($id){
			$this -> render("reporte");
			
			$cuenta = Cuenta::consultar($id);
			
			$cuenta -> eliminar();
			
			$this -> alerta = Alerta::success("La Cuenta ha sido eliminada correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$cuenta = Cuenta::consultar($id);
				
				$cuenta -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Cuentas seleccionadas han sido eliminadas correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("La Cuenta seleccionada ha sido eliminada correctamente.");
			}
			
			$this -> set_response("view");
		}
	}
?>