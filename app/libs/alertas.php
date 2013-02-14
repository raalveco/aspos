<?php
	class Alerta{
		public static function mensaje($mensaje, $tipo = "note"){
			return '<div class="alert '.$tipo.'"><span class="icon"></span><span class="close">x</span>'.$mensaje.'</div><br />';
		}
		
		public static function success($mensaje){
			return Alerta::mensaje($mensaje,"success");	
		}
		
		public static function warning($mensaje){
			return Alerta::mensaje($mensaje,"warning");	
		}
		
		public static function error($mensaje){
			return Alerta::mensaje($mensaje,"error");	
		}
		
		public static function information($mensaje){
			return Alerta::mensaje($mensaje,"information");	
		}
		
		public static function note($mensaje){
			return Alerta::mensaje($mensaje,"note");	
		}
	}
?>