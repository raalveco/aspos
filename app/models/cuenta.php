<?php
	class Cuenta extends ActiveRecord{
		public static function registrar($rfc, $nombre, $paquete){
			if(Cuenta::existe("rfc = '".$rfc."'")){
				return false;
			}
			
			$cuenta = new Cuenta();
			
			$cuenta -> activo = "SI";
			
			if(Session::get("administrador_id")){
				$cuenta -> usuario_creacion_id = Session::get("administrador_id");	
				$cuenta -> usuario_edicion_id = Session::get("administrador_id");
			}
			else{
				$cuenta -> usuario_creacion_id = 0;	
				$cuenta -> usuario_edicion_id = 0;
			}
			
			$cuenta -> fecha_creacion = date("Y-m-d H:i:s");
			$cuenta -> fecha_edicion = date("Y-m-d H:i:s");
			
			$cuenta -> rfc = $rfc;
			$cuenta -> nombre = $nombre;
			$cuenta -> paquete_id = $paquete;
			
			$cuenta -> save();
			
			$moneda = Moneda::registrar("MXN", "PESO MEXICANO",1,$cuenta -> id);
			$impuesto = Impuesto::registrar("IVA", "16", "TRASLADADO", $cuenta -> id);
			$unidad = Unidad::registrar("PIEZA", "PIEZA", $cuenta -> id);
			$tipo = ClienteTipo::registrar("NORMAL","CLIENTE NORMAL", $cuenta -> id);
			$categoria = ProductoCategoria::registrar("GENERAL","CATEGORIA GENERAL", $cuenta -> id);
			$sucursal = Sucursal::registrar("GENERAL", $cuenta -> id);
			
			$cliente = Cliente::registrar("XAXX000000XXX", "CLIENTE GENERICO", "DISTRITO FEDERAL", "MÉXICO", $cuenta -> id);
			$producto = Producto::registrar("PRODUCTO DE PRUEBA",1.00);
			$cliente -> tipo_cliente_id = $tipo -> id;
			
			$cliente -> calle = "CONOCIDO";
			$cliente -> exterior = "S/N";
			$cliente -> cpostal = "06000";
			$cliente -> municipio = "CIUDAD DE MEXICO";
			
			$cliente -> guardar();
			
			return $cuenta;
		}
		
		public function paquete(){
			$contrato = $this -> contrato();
			
			if($contrato){
				return $contrato -> paquete();
			}
			
			return Paquete::consultar($this -> paquete_id);
		}
		
		public function contribuyente(){
			return Contribuyente::consultar("cuenta_id = ".$this -> id);
		}
		
		public function contrato(){
			return Contrato::vigente($this -> id);
		}
	}
?>