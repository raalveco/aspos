<?php
	class Departamento extends ActiveRecord{
		public static function registrar($nombre, $correo = ""){
			if(Departamento::existe("nombre = '".$nombre."'")){
				return false;
			}
			
			$departamento = new Departamento();
			$departamento -> nombre = $nombre;
			$departamento -> correo = $correo;
			
			$departamento -> save();
			
			return $departamento;
		}
	}
?>