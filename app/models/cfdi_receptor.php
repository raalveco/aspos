<?php
	class CfdiReceptor extends ActiveRecord{
		public static function registrar($cfdi, $rfc, $nombre, $estado, $pais){
			if(CfdiReceptor::existe("cfdi_id = ".$cfdi."")){
				return false;
			}
			
			$receptor = new CfdiReceptor();
			
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
			
			$receptor -> cfdi_id = $cfdi;
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