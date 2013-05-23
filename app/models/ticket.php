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
			
			$ticket -> fecha = date("Y-m-d H:i:s");
			$ticket -> respondido = "NO";
			
			$ticket -> save();
			
			return $ticket;
		}
		
		public function departamento(){
			return Departamento::consultar($this -> departamento_id);
		}
		
		public function cuenta(){
			return Cuenta::consultar($this -> cuenta_id);
		}
		
		public function usuario(){
			if($this -> usuario_id == 0) return "admin";
			return Usuario::consultar($this -> usuario_id) -> usuario;
		}
	}
?>