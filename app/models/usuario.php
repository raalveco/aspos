<?php
	class Usuario extends ActiveRecord{
		public static function registrar($usuario, $password, $rol, $activo = "SI"){
			$usuario = new Usuario();
			
			$usuario -> avatar = "avatar_50b1a24b659fa.png";
			$usuario -> usuario = $usuario;
			$usuario -> password = sha1($password);
			$usuario -> activo = $activo;
			$usuario -> rol_id = $rol;
			$usuario -> fecha_registro = date("Y-m-d H:i:s");
			
			$usuario -> cuenta_id = Session::get("cuenta_id");
			
			$usuario -> save();
			
			return $usuario;
		}
		
		public function cambiarAvatar($file){
			$this -> avatar = $file;
			$this -> save();
		}
	}
?>