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
			
			return $cuenta;
		}
		
		public function paquete(){
			return Paquete::consultar($this -> paquete_id);
		}
		
		public function contribuyente(){
			return Contribuyente::consultar("cuenta_id = ".$this -> id);
		}
	}
?>