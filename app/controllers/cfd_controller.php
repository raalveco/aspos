<?php
	Load::lib("alertas");
	Load::lib("formato");

	class CfdController extends ApplicationController {
		public function xml(){
			$this -> render(null,null);
			
			header("Cache-Control: public");
		    header("Content-Description: File Transfer");
		    header("Content-Disposition: attachment; filename=F28.xml");
		    //header("Content-Type: application/zip");
		    header("Content-Transfer-Encoding: binary");
			
			$writer = new XMLWriter();
			
			$writer -> openURI('php://output');
			$writer -> startDocument('1.0', 'UTF-8');
			
			$writer -> startElement('response');
			    $writer -> startElement('status');
			        $writer -> startAttribute('code');
			            $writer -> text('500');
			        $writer -> endAttribute();
			    $writer -> endElement();
			$writer -> endElement();
			
			$writer -> endDocument();
		}
	}	
?>