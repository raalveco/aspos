<?php
	class Estadistica{
		public static function facturas($cuenta_id, $mes = false){
			
			if($mes){
				$m = substr($mes, 0, 2);
				$y = substr($mes, 2, 4);
				
				$a = mktime(0,0,0,$m,1,$y);
				$b = mktime(23,59,59,$m,date("t",$a),$y);
				
				$inicio = date("Y-m-d H:i:s", $a);
				$fin = date("Y-m-d H:i:s", $b);
				
				return CbbFactura::total("cuenta_id = ".$cuenta_id." AND fecha >= '".$inicio."' AND fecha <= '".$fin."'");
			}
			else{
				return CbbFactura::total("cuenta_id = ".$cuenta_id);
			}
		}
		
		public static function almacenamiento($cuenta_id){
			return 67;
		}
		
		public static function usuarios($cuenta_id){
			return Usuario::total("cuenta_id = ".$cuenta_id);
		}
	}
?>