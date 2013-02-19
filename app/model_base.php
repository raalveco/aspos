<?php
/**
 * ActiveRecord
 *
 * Esta clase es la clase padre de todos los modelos
 * de la aplicacion
 *
 * @category Kumbia
 * @package Db
 * @subpackage ActiveRecord
 */
class ActiveRecord extends ActiveRecordBase {	
	//Regresa un solo registro, por medio de un ID o un SQL dado.
	public static function consultar($id){
		$objeto = get_called_class();	
		$objeto = new $objeto;
		
		if($objeto -> count($id)==0){
			return false;
		}
		
		return $objeto -> find_first($id);
	}
	
	//Regresa un arreglo con los registros encontrados en el SQL dado.
	public static function reporte($sql="id>0", $orden="id ASC", $inicio=0, $cantidad=0, $columnas = false){
        $objeto = get_called_class();	
		$objeto = new $objeto;  
		
		$params = Util::getParams(func_get_args());
		
		$sql .= " ORDER BY ".$orden;
		
		if($cantidad == 0) $cantidad = REPORTE_REGISTROS;
		          
        if($cantidad>0){
            $sql .= " LIMIT ".$inicio.",".$cantidad;
        }            
		
		if($columnas){
			if(is_array($columnas)){
				$columnas = implode(",", $columnas);
			}
			
			return $objeto -> find($sql,"columns: ".$columnas);
		}
		else{
			return $objeto -> find($sql);
		}
    }
	
	//Regresa un arreglo con los registros encontrados en el SQL dado.
	public static function buscar($sql="id>0", $orden="id ASC"){
        $objeto = get_called_class();	
		$objeto = new $objeto;  
		
		$sql .= " ORDER BY ".$orden;
		 
        return $objeto -> find_first($sql);
    }
	
	//Regresa el total de registros para un SQL dado.
	public static function total($sql){
		$objeto = get_called_class();
		$objeto = new $objeto;
		
		if(is_numeric($sql)){
			return $objeto -> count("id=".$sql);	
		}
		
		return $objeto -> count($sql);
	}
	
	//Regresa true, si el Id o SQL dado encuentra almenos un registro, sino false
	public static function existe($id){
		$objeto = get_called_class();
		$objeto = new $objeto;
		
		if($objeto -> count($id)>0){
			return true;
		}
		
		return false;
	}
	
	//Elimina el registro correspondiente al objeto. No verifica las relaciones que pueda tener.
	public function eliminar(){
		$this -> delete();
	}
	
	//Elimina el registro correspondiente al objeto. No verifica las relaciones que pueda tener.
	public static function eliminarID($id){
		$objeto = get_called_class();
		$objeto = new $objeto;
		
		if($objeto -> count($id)==0){
			return false;
		}

		$objeto = $objeto -> find_first($id);
				
		$objeto -> delete();
	}
	
	//Sirve para guardar en la base de datos los cambios que haya podido tener le objeto.
	public function guardar(){
		if(Session::get("usuario_id")==0 || Session::get("usuario_id")){
			$this -> usuario_edicion_id = Session::get("usuario_id");
		}
		else{
			$this -> usuario_edicion_id = 0;
		}
			
		$this -> fecha_edicion = date("Y-m-d H:i:s");
		
		$this -> save();
	}
}
