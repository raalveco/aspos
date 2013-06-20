<?php
	class Contrato extends ActiveRecord{
		public static function registrar($cuenta_id, $paquete_id, $inicio, $fin, $tipo = "MENSUAL"){
			
			Load::lib("formato");
			
			if(Contrato::existe("cuenta_id = '".$cuenta_id."' AND activo = 'SI' AND inicio <= '".Formato::FechaDB($inicio)."' AND fin >= '".Formato::FechaDB($fin)."'")){
				return false;
			}
			
			$contrato = new Contrato();
			
			$contrato -> cuenta_id = $cuenta_id;
			$contrato -> paquete_id = $paquete_id;
			$contrato -> inicio = Formato::FechaDB($inicio);
			$contrato -> fin = Formato::FechaDB($fin);
			$contrato -> tipo = $tipo;
			$contrato -> activo = "SI";
			
			$contrato -> dia_corte = date("d",Formato::FechaTime($inicio)-60*60*24);
			
			$contrato -> save();
			
			return $contrato;
		}
		
		public static function vigente($cuenta_id){
			if(Contrato::existe("cuenta_id = '".$cuenta_id."' AND activo = 'SI' AND inicio <= '".date("Y-m-d")."' AND fin >= '".date("Y-m-d")."'")){
				return Contrato::consultar("cuenta_id = '".$cuenta_id."' AND activo = 'SI' AND inicio <= '".date("Y-m-d")."' AND fin >= '".date("Y-m-d")."'");
			}
			
			return false;
		}
	}
?>