<?php
	class Ticket extends ActiveRecord{
		public static function registrar($asunto, $mensaje, $departamento = 0){
			$ticket = new Ticket();
			
			$ticket -> cuenta_id = Session::get("cuenta_id");
			$ticket -> usuario_id = Session::get("usuario_id");
			
			$ticket -> admin_id = 0;
			$ticket -> padre = 0;
			$ticket -> admin = "NO";
			
			$ticket -> asunto = $asunto;
			$ticket -> mensaje = $mensaje;
			$ticket -> departamento_id = $departamento;
			
			$ticket -> visto = "NO";
			
			$ticket -> save();
			
			return $ticket;
		}
	}
?>