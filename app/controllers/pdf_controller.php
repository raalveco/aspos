<?php
	Load::lib("alertas");
	Load::lib("formato");
	Load::lib("pdf");

	class PdfController extends ApplicationController {
		public function hola($id){
			$this -> render(null,null);
			$this -> set_response("view");
			
			$pdf = new Pdf();			
			$pdf -> controlador("pdf/holaPDF/".$id);			
			$pdf -> renderizar("hola.pdf");
		}
		
		public function holaPDF($id){
			$this -> render("holaPDF",null);
			
			$this -> cliente = Cliente::consultar($id);
			
			$this -> saludo = "Ola k ase";
		}
		
		public function cbb($id){
			$this -> render(null,null);
			$this -> set_response("view");
			
			$pdf = new Pdf();			
			$pdf -> controlador("pdf/cbbPDF/".$id);			
			$pdf -> renderizar("hola.pdf");
		}
		
		public function cbbPDF($id){
			$this -> render("cbbPDF",null);
			
			$this -> factura = CbbFactura::consultar($id);
			
			$this -> emisor = $this -> factura -> emisor();
			$this -> cliente = $this -> factura -> receptor();
			$this -> folios = $this -> factura -> folio();
			
			$this -> sucursal = $this -> factura -> sucursal();
		}
	}
	
