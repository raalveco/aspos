<?php
	class Sucursal extends ActiveRecord{
		public static function registrar($nombre, $cuenta_id = false){
			if($cuenta_id === false){
				if(Session::get("cuenta_id")){
					$cuenta_id = Session::get("cuenta_id");
				}		
				else{
					$cuenta_id = 0;
				}
			}
			
			if(Sucursal::existe("cuenta_id = '".$cuenta_id."' AND nombre = '".$nombre."'")){
				return false;
			}
			
			$sucursal = new Sucursal();
			
			$sucursal -> cuenta_id = Session::get("cuenta_id");
			$sucursal -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$sucursal -> usuario_creacion_id = Session::get("usuario_id");	
				$sucursal -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$sucursal -> usuario_creacion_id = 0;	
				$sucursal -> usuario_edicion_id = 0;
			}
			
			$sucursal -> fecha_creacion = date("Y-m-d H:i:s");
			$sucursal -> fecha_edicion = date("Y-m-d H:i:s");
			
			$sucursal -> nombre = $nombre;
			
			$sucursal -> save();
			
			return $sucursal;
		}
		
		public function cbbFolios(){
			$folios = CbbFolio::consultar($this -> cbb_folios_id);
			
			if($folios -> actual > $folios -> {"final"}){
				$folios = CbbFolio::consultar("serie = '".$folios -> serie."' AND inicial <= ".$folios -> actual." AND final >= ".$folios -> actual);
			
				if($folios){
					$this -> cbb_folios_id = $folios -> id;
					$this -> save();
					
					return $folios;
				}
				else{
					return false;
				}
			}
			
			return $folios;
		}
	}
?>