<?php
	class Ticket extends ActiveRecord{
		public static function registrar($asunto, $mensaje, $departamento = 0){
			$ticket = new Ticket();
			
			$ticket -> cuenta_id = Session::get("cuenta_id") ? Session::get("cuenta_id") : "0";
			$ticket -> usuario_id = Session::get("usuario_id") ? Session::get("usuario_id") : "0";
			
			$ticket -> admin_nombre = "";
			$ticket -> padre = 0;
			$ticket -> admin = "NO";
			
			$ticket -> asunto = $asunto;
			$ticket -> mensaje = $mensaje;
			$ticket -> departamento_id = $departamento;
			
			$ticket -> fecha = date("Y-m-d H:i:s");
			$ticket -> respondido = "NO";
			$ticket -> estado = "OK";
			
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
		
		public function padre(){
			
			if($this -> padre > 0){
				return Ticket::consultar($this -> padre);
			}
			
			return false;
		}
		
		public function raiz(){
			
			if($this -> padre > 0){
				$padre = Ticket::consultar($this -> padre);
				
				while($padre -> padre > 0){
					$padre = Ticket::consultar($padre -> padre);	
				}
				
				return $padre;
			}
			
			return false;
		}
		
		public function hijo(){
			return Ticket::consultar("padre = ".$this -> id);
		}
	}
?>