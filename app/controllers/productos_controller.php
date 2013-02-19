<?php
	Load::lib("alertas");
	Load::lib("formato");
	class ProductosController extends ApplicationController {
		public function index(){
			$this -> render(null,null);
			
			$this -> redirect("productos/reporte");
		}
		
		public function reporte(){
			$this -> set_response("view");
		}
		
		public function registro(){
			$this -> set_response("view");
			
			$this -> render("producto");
			
			$this -> producto = false;
			$this -> cliente = false;
		}
		
		public function registrar(){
			$this -> render("producto");		
			
			$nombre = utf8_decode($this -> post("nombre"));			
			$precio_unitario = Formato::noDinero(utf8_decode($this -> post("precio")));
			
			$producto = Producto::registrar($nombre,$precio_unitario);
			
			if($producto){
				$producto -> codigo = utf8_decode($this -> post("codigo"));
				$producto -> descripcion = utf8_decode($this -> post("descripcion"));
				$producto -> categoria_id = utf8_decode($this -> post("categoria"));
				$producto -> unidad_id = utf8_decode($this -> post("unidad"));
				$producto -> moneda_id = utf8_decode($this -> post("moneda"));
				$producto -> impuesto_id = utf8_decode($this -> post("impuesto"));
				
				$producto -> guardar();
				
				$this -> alerta = Alerta::success("El producto ha sido REGISTRADO correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("El producto fue registrado anteriormente.");
			}
			
			$this -> producto = $producto;
			
			$this -> set_response("view");
		}

		public function consulta($id){
			$this -> render("producto");
			
			$this -> producto = Producto::consultar($id);
			
			if(!$this -> producto){
				$this -> render("reporte");
				
				$this -> alerta = Alerta::error("El Producto buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificar(){
			$this -> render("producto");
			
			$producto = Producto::consultar($this -> post("producto"));
			
			if($producto){
				$nombre = utf8_decode($this -> post("nombre"));			
				$precio_unitario = Formato::noDinero(utf8_decode($this -> post("precio")));
				$producto -> codigo = utf8_decode($this -> post("codigo"));
				$producto -> descripcion = utf8_decode($this -> post("descripcion"));
				$producto -> categoria_id = utf8_decode($this -> post("categoria"));
				$producto -> unidad_id = utf8_decode($this -> post("unidad"));
				$producto -> moneda_id = utf8_decode($this -> post("moneda"));
				$producto -> impuesto_id = utf8_decode($this -> post("impuesto"));
				
				$producto -> guardar();
				
				$this -> producto = $producto;
				
				$this -> alerta = Alerta::success("El Producto ha sido ACTUALIZADO correctamente.");
			}
			else{
				$this -> producto = false;
				
				$this -> alerta = Alerta::error("El Producto buscado no fue encontrado en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}

		public function eliminar($id){
			$this -> render("reporte");
			
			$producto = Producto::consultar($id);
			
			$producto -> eliminar();
			
			$this -> alerta = Alerta::success("El Producto ha sido eliminado correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarSeleccionados($parametros){
			$this -> render("reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$producto = Producto::consultar($id);
				
				$producto -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Los Productos seleccionados han sido eliminados correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("El Producto seleccionado ha sido eliminado correctamente.");
			}
			
			$this -> set_response("view");
		}
		
		public function registro_shortcut(){
			$this -> set_response("view");
		}
	}
?>