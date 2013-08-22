<?php
	Load::lib("alertas");
	Load::lib("simple_cfdi");
	class XmlController extends ApplicationController {
		
		public function index(){
			$this -> render(null,null);
			
			$xml = new DOMDocument('1.0' , 'UTF-8');
			$root = $xml->createElement('cfdi:Comprobante');
			
			////////////////////////////////nodo principal cfdi:Comprobante////////////////////////////////////////////
			//Creando atributos de cfdi:Comprobante
			$schemeLocation = $xml->createAttribute('xsi:schemaLocation');
			$cfdi = $xml->createAttribute('xmlns:cfdi');
			$xsi = $xml->createAttribute('xmlns:xsi');
			$version = $xml->createAttribute('version');			
			$fecha = $xml->createAttribute('fecha');
			$formaDePago = $xml->createAttribute('formaDePago');			
			$tipoDeComprobante = $xml->createAttribute('tipoDeComprobante');
			$total = $xml->createAttribute('total');
			$subTotal = $xml->createAttribute('subTotal');
			$LugarExpedicion = $xml->createAttribute('LugarExpedicion');
			$metodoDePago = $xml->createAttribute('metodoDePago');
						
			//Agregar valor a los atributos
			$schemeLocation->value = 'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd';
			$cfdi->value = 'http://www.sat.gob.mx/cfd/3';
			$xsi->value = 'http://www.w3.org/2001/XMLSchema-instance';
			$version->value = '3.2';	
			$fecha->value = '2012-01-01T20:38:12';
			$formaDePago->value = 'PAGO EN UNA SOLA EXHIBICION';
			$tipoDeComprobante->value = 'ingreso';
			$total->value = '455.80';
			$subTotal->value = '455.70';
			$LugarExpedicion->value = 'Mexico';
			$metodoDePago->value = 'cheque';
			
			// Append de los elementos
			$root->appendChild($schemeLocation);
			$root->appendChild($cfdi);
			$root->appendChild($xsi);
			$root->appendChild($version);
			$root->appendChild($fecha);
			$root->appendChild($formaDePago);
			$root->appendChild($tipoDeComprobante);
			$root->appendChild($total);			
			$root->appendChild($subTotal);
			$root->appendChild($LugarExpedicion);
			$root->appendChild($metodoDePago);		
			$xml->appendChild($root);
			/////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////nodo cfdi:Emisor////////////////////////////////////////////
			$emisor = $xml->createElement('cfdi:Emisor');
			
			//Creando atributos de cfdi:Comprobante
			$rfc = $xml->createAttribute('rfc');
			$nombre = $xml->createAttribute('nombre');
			//Agregar valor a los atributos
			
			$rfc->value = 'LIHA851024I63';
			$nombre->value = 'Emision Fiscal';
			
			//Append de los elementos
			$emisor->appendChild($rfc);
			$emisor->appendChild($nombre);				
			$root->appendChild($emisor);
			
			////////////////////////////////nodo de cfdi:Emisor cfdi:Domicilio Fiscal/////////////////////
			$domicilioFiscal = $xml->createElement('cfdi:DomicilioFiscal');
			
			//Creando atributos de cfdi:Domicilio Fiscal
			$pais = $xml->createAttribute('pais');
			$calle = $xml->createAttribute('calle');
			$estado = $xml->createAttribute('estado');
			$colonia = $xml->createAttribute('colonia');
			$municipio = $xml->createAttribute('municipio');
			$noExterior = $xml->createAttribute('noExterior');
			$codigoPostal = $xml->createAttribute('codigoPostal');
			
			//Agregar valor a los atributos			
			$pais->value = 'Mexico';
			$calle->value = 'Velazquez';
			$estado->value = 'Jalisco';
			$colonia->value = 'Estancia';
			$municipio->value = 'Zapopan';
			$noExterior->value = '22';
			$codigoPostal->value = '45020';
			
			//Append de los elementos
			$domicilioFiscal->appendChild($pais);
			$domicilioFiscal->appendChild($calle);
			$domicilioFiscal->appendChild($estado);
			$domicilioFiscal->appendChild($colonia);
			$domicilioFiscal->appendChild($municipio);
			$domicilioFiscal->appendChild($noExterior);
			$domicilioFiscal->appendChild($codigoPostal);				
			$emisor->appendChild($domicilioFiscal);	
			
			////////////////////////////////nodo de cfdi:Emisor cfdi:ExpedidoEn/////////////////////
			$expedioEn = $xml->createElement('cfdi:ExpedidoEn');
			
			//Creando atributos de cfdi:Domicilio Fiscal
			$pais = $xml->createAttribute('pais');
			$calle = $xml->createAttribute('calle');
			$estado = $xml->createAttribute('estado');
			$colonia = $xml->createAttribute('colonia');
			$noExterior = $xml->createAttribute('noExterior');
			$codigoPostal = $xml->createAttribute('codigoPostal');
			
			//Agregar valor a los atributos			
			$pais->value = 'Mexico';
			$calle->value = 'Patria';
			$estado->value = 'Colima';
			$colonia->value = 'Arcos';
			$noExterior->value = '232';
			$codigoPostal->value = '49020';
			
			//Append de los elementos
			$expedioEn->appendChild($pais);
			$expedioEn->appendChild($calle);
			$expedioEn->appendChild($estado);
			$expedioEn->appendChild($colonia);
			$expedioEn->appendChild($noExterior);
			$expedioEn->appendChild($codigoPostal);				
			$emisor->appendChild($expedioEn);
			
			////////////////////////////////nodo de cfdi:Emisor cfdi:RegimenFiscal/////////////////////
			$regimenFiscal = $xml->createElement('cfdi:RegimenFiscal');
			
			//Creando atributos de cfdi:RegimenFiscal
			$regimen = $xml->createAttribute('Regimen');
			
			//Agregar valor a los atributos			
			$regimen->value = 'simplificado';
			
			//Append de los elementos
			$regimenFiscal->appendChild($regimen);			
			$emisor->appendChild($regimenFiscal);						
			/////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////nodo de cfdi:Receptor////////////////////////////////////////
			$receptor = $xml->createElement('cfdi:Receptor');
			
			//Creando atributos de cfdi:RegimenFiscal
			$rfc = $xml->createAttribute('rfc');
			$nombre = $xml->createAttribute('nombre');
			
			//Agregar valor a los atributos			
			$rfc->value = 'VECR8307073J1';
			$nombre->value = 'Ramiro Vera';
			
			//Append de los elementos
			$receptor->appendChild($rfc);
			$receptor->appendChild($nombre);			
			$root->appendChild($receptor);	
			
			////////////////////////////////nodo de cfdi:Receptor cfdi:Domicilio////////////////////////////
			$domicilio = $xml->createElement('cfdi:Domicilio');
			
			//Creando atributos de cfdi:Domicilio Fiscal
			$pais = $xml->createAttribute('pais');
			$calle = $xml->createAttribute('calle');
			$estado = $xml->createAttribute('estado');
			$colonia = $xml->createAttribute('colonia');
			$municipio = $xml->createAttribute('municipio');
			$noExterior = $xml->createAttribute('noExterior');
			$noInterior = $xml->createAttribute('noInterior');
			$codigoPostal = $xml->createAttribute('codigoPostal');
			
			//Agregar valor a los atributos			
			$pais->value = 'Mexico';
			$calle->value = 'Patria';
			$estado->value = 'Colima';
			$colonia->value = 'Arcos';
			$municipio->value = 'Zapopan';
			$noExterior->value = '232';
			$noInterior->value = '2';
			$codigoPostal->value = '49020';
			
			//Append de los elementos
			$domicilio->appendChild($pais);
			$domicilio->appendChild($calle);
			$domicilio->appendChild($estado);
			$domicilio->appendChild($colonia);
			$domicilio->appendChild($municipio);
			$domicilio->appendChild($noExterior);
			$domicilio->appendChild($noInterior);
			$domicilio->appendChild($codigoPostal);				
			$receptor->appendChild($domicilio);
			/////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////nodo de cfdi:Conceptos////////////////////////////////////////
			$conceptos = $xml->createElement('cfdi:Conceptos');
			$concepto = $xml->createElement('cfdi:Concepto');
			
			//Creando atributos de cfdi:Conceptos
			$unidad = $xml->createAttribute('unidad');
			$importe = $xml->createAttribute('importe');
			$cantidad = $xml->createAttribute('cantidad');
			$descripcion = $xml->createAttribute('descripcion');
			$valorUnitario = $xml->createAttribute('valorUnitario');
			
			//Agregar valor a los atributos			
			$unidad->value = 'Capsulas';
			$importe->value = '2440.00';
			$cantidad->value = '10';
			$descripcion->value = 'Vibramicina';
			$valorUnitario->value = '244.00';
			
			//Append de los elementos
			$concepto->appendChild($unidad);
			$concepto->appendChild($importe);
			$concepto->appendChild($cantidad);
			$concepto->appendChild($descripcion);
			$concepto->appendChild($valorUnitario);
			$conceptos->appendChild($concepto);						
			$root->appendChild($conceptos);	
			////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////nodo de cfdi:Impuestos////////////////////////////////////////
			$impuestos = $xml->createElement('cfdi:Impuestos');
			$traslados = $xml->createElement('cfdi:Traslados');
			$traslado = $xml->createElement('cfdi:Traslado');
			
			//Creando atributos de cfdi:Conceptos
			$tasa = $xml->createAttribute('tasa');
			$importe = $xml->createAttribute('importe');
			$impuesto = $xml->createAttribute('impuesto');
			
			
			//Agregar valor a los atributos			
			$tasa->value = '16.0';
			$importe->value = '22.20';
			$impuesto->value = 'IVA';
			
			//Append de los elementos
			$traslado->appendChild($unidad);
			$traslado->appendChild($importe);
			$traslado->appendChild($cantidad);	
			$traslados->appendChild($traslado);
			$impuestos->appendChild($traslados);					
			$root->appendChild($impuestos);	
			////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////nodo de cfdi:Complemento/////////////////////////////////////
			$complemento = $xml->createElement('cfdi:Complemento');
			
			//Creando atributos de cfdi:Conceptos			
			
			//Agregar valor a los atributos			
			
			//Append de los elementos					
			$root->appendChild($complemento);	
			
			////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////nodo de cfdi:Addenda/////////////////////////////////////////
			$addenda = $xml->createElement('cfdi:Addenda');
			
			//Creando atributos de cfdi:Conceptos			
			
			//Agregar valor a los atributos			
			
			//Append de los elementos					
			$root->appendChild($addenda);			
			
			
			////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			//Generando el archivo
			$xml->formatOutput = true;
			
			//Guardar documento como un archivo string, es decir, poner los string en la variable $strings_xml
			$strings_xml = $xml->saveXML();
			
			//Finalmente, guardarlo en un directorio
			$xml->save(APP_PATH.'/miarchivoxml.xml'); //esto se almacena en ruta siguiente
			echo(APP_PATH);
			
			
			
			
			$sello = $xml->createAttribute('sello');
			$noCertificado = $xml->createAttribute('noCertificado');
			$certificado = $xml->createAttribute('certificado');
			//Agregar valor a los atributos
			$sello->value = simple_cfdi::signData(simple_cfdi::getPrivateKey(APP_PATH.'HEGT7610034S2.key', '12345678a'), simple_cfdi::getCadenaOriginal(APP_PATH.'miarchivoxml.xml', APP_PATH.'cadenaoriginal_3_2.xslt'));
			$noCertificado->value = simple_cfdi::getSerialFromCertificate( APP_PATH.'goya780416gm0.cer' );
			$certificado->value = simple_cfdi::getCertificate( APP_PATH.'goya780416gm0.cer', false );			
			//Append de los elementos
			$root->appendChild($sello);
			$root->appendChild($noCertificado);
			$root->appendChild($certificado);
			$xml->appendChild($root);
			
			////////////////////////////////////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////////////////////////////////////
			//Generando el archivo
			$xml->formatOutput = true;
			
			//Guardar documento como un archivo string, es decir, poner los string en la variable $strings_xml
			$strings_xml = $xml->saveXML();
			
			//Finalmente, guardarlo en un directorio
			$xml->save(APP_PATH.'/miarchivoxml.xml'); //esto se almacena en ruta siguiente
			echo(APP_PATH);
		}

	}
?>