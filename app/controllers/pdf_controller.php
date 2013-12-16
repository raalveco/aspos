<?php
	Load::lib("alertas");
	Load::lib("formato");
	Load::lib("pdf");

	class PdfController extends ApplicationController {
		public function cbb($id){
			$this -> render(null,null);
			
			$factura = CbbFactura::consultar($id);
			
			if($factura){
				$this -> set_response("view");
				
				$pdf = new Pdf();			
				$pdf -> controlador("pdf/cbbPDF/".$id);			
				$pdf -> renderizar($factura -> emisor() -> rfc."-".$factura -> serie."".$factura -> folio."].pdf");	
			}
			else{
				$this -> redirect("main");
			}
			
			
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
	
