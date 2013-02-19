<?php
	class Usuario extends ActiveRecord{ 
		public static function registrar($user, $password, $activo = "SI"){
			if(Usuario::existe("cuenta_id = ".Session::get("cuenta_id")." AND usuario = '".$usuario."'")){
				return false;
			}
			
			$usuario = new Usuario();
			
			$usuario -> cuenta_id = Session::get("cuenta_id");
			$usuario -> activo = "SI";
			
			if(Session::get("usuario_id")==0 || Session::get("usuario_id")){
				$usuario -> usuario_creacion_id = Session::get("usuario_id");	
				$usuario -> usuario_edicion_id = Session::get("usuario_id");
			}
			else{
				$usuario -> usuario_creacion_id = 0;	
				$usuario -> usuario_edicion_id = 0;
			}
			
			$usuario -> fecha_creacion = date("Y-m-d H:i:s");
			$usuario -> fecha_edicion = date("Y-m-d H:i:s");
			
			$usuario -> avatar = "avatar_50b1a24b659fa.png";
			$usuario -> usuario = $user;
			$usuario -> password = sha1($password);
			
			$usuario -> save();
			
			return $usuario;
		}
		
		public function cambiarAvatar($file){
			$this -> avatar = $file;
			$this -> save();
		}
	}
?>