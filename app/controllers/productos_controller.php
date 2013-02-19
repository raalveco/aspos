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
				$prodcto -> nombre = utf8_decode($this -> post("nombre"));			
				$producto -> precio_unitario = Formato::noDinero(utf8_decode($this -> post("precio")));
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
		
		public function reporteProductoCategoria(){
			$this -> render("productos_categoria_reporte");
			
			$this -> set_response("view");
		}
		
		public function registroProductoCategoria(){
			$this -> render("producto_categoria");
			
			$this -> producto_categoria = false;
			
			$this -> set_response("view");
		}
		
		public function registrarProductoCategoria(){
			$this -> render("productos_categoria_reporte");		
			
			$nombre = utf8_decode($this -> post("nombre"));			
			$descripcion = utf8_decode($this -> post("descripcion"));	
			
			$producto_categoria = ProductoCategoria::registrar($nombre,$descripcion);
			
			if($producto_categoria){
								
				$producto_categoria -> guardar();
				
				$this -> alerta = Alerta::success("La Categoria de Producto ha sido REGISTRADA correctamente.");
			}
			else{
				$this -> alerta = Alerta::error("La Categoria de Producto fue registrado anteriormente.");
			}
			
			$this -> $producto_categoria = $producto_categoria;
			
			$this -> set_response("view");
		}
		
		public function consultaProductoCategoria($id){
			$this -> render("producto_categoria");
			
			$this -> producto_categoria = ProductoCategoria::consultar($id);
			
			if(!$this -> producto_categoria){
				$this -> render("productos_categoria_reporte");
				
				$this -> alerta = Alerta::error("La Categoria de Producto buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		
		public function eliminarProductoCategoria($id){
			$this -> render("productos_categoria_reporte");
			
			$producto_categoria = ProductoCategoria::consultar($id);
			
			$producto_categoria -> eliminar();
			
			$this -> alerta = Alerta::success("La Categoria de Producto ha sido eliminada correctamente.");
			
			$this -> set_response("view");
		}
		
		public function eliminarProductoCategoriaSeleccionados($parametros){
			$this -> render("productos_categoria_reporte");
			
			$parametros = substr($parametros,2);
			
			$ids = explode("|",$parametros);
			
			foreach($ids as $id){
				$producto_categoria = ProductoCategoria::consultar($id);
				
				$producto_categoria -> delete();
			}
			
			if(count($ids) > 1){
				$this -> alerta = Alerta::success("Las Categorias de Producto seleccionadas han sido eliminadas correctamente.");
			}
			else{
				$this -> alerta = Alerta::success("La Categoria de Producto seleccionada ha sido eliminada correctamente.");
			}
			
			$this -> set_response("view");
		}
		
		public function modificarProductoCategoria(){
			$this -> render("productos_categoria_reporte");
			
			$producto_categoria = ProductoCategoria::consultar($this -> post("producto_categoria"));
			
			if($producto_categoria){
				$producto_categoria -> nombre = utf8_decode($this -> post("nombre"));			
				$producto_categoria -> descripcion = utf8_decode($this -> post("descripcion"));
				
				$producto_categoria -> guardar();
				
				$this -> producto_categoria = $producto_categoria;
				
				$this -> alerta = Alerta::success("La Categoria de Producto ha sido ACTUALIZADA correctamente.");
			}
			else{
				$this -> producto = false;
				
				$this -> alerta = Alerta::error("La Categoria de Producto buscada no fue encontrada en la Base de Datos.");
			}
			
			$this -> set_response("view");
		}
		public function registro_shortcut(){
			$this -> set_response("view");
		}
	}
?>