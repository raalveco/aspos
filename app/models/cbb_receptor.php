<?php
	class CbbReceptor extends ActiveRecord{
		public static function registrar($cbb, $rfc, $nombre, $estado, $pais){
			if(CbbReceptor::existe("cbb_id = ".$cbb."")){
				return false;
			}
			
			$receptor = new CbbReceptor();
			
			$receptor -> cuenta_id = Session::get("cuenta_id");
			$receptor -> activo = "SI";
			
			if(Session::get("usuario_id")){
				$receptor -> usuario_creacion_id = Session::get("usuario_id");	
				$receptor -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$receptor -> usuario_creacion_id = 0;	
				$receptor -> usuario_edicion_id = 0;
			}
			
			$receptor -> fecha_creacion = date("Y-m-d H:i:s");
			$receptor -> fecha_edicion = date("Y-m-d H:i:s");
			
			$receptor -> cbb_id = $cbb;
			$receptor -> rfc = $rfc;
			$receptor -> nombre = $nombre;
			$receptor -> estado = $estado;
			$receptor -> pais = $pais;
			
			$receptor -> save();
			
			return $receptor;
		}
		
		public function rfc_nombre(){
			return $this -> rfc." || ".$this -> nombre;
		}
	}
?>