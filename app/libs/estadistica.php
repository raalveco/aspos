<?php
	class Estadistica{
		public static function facturas($cuenta_id, $mes = false){
			
			if(!$cuenta_id){
				return 0;
			}
			
			if($mes){
				$m = substr($mes, 0, 2);
				$y = substr($mes, 2, 4);
				
				$a = mktime(0,0,0,$m,1,$y);
				$b = mktime(23,59,59,$m,date("t",$a),$y);
				
				$inicio = date("Y-m-d H:i:s", $a);
				$fin = date("Y-m-d H:i:s", $b);
				
				return CbbFactura::total("cuenta_id = ".$cuenta_id." AND fecha >= '".$inicio."' AND fecha <= '".$fin."'");
			}
			else{
				return CbbFactura::total("cuenta_id = ".$cuenta_id);
			}
		}
		
		public static function almacenamiento($cuenta_id){
			if(!$cuenta_id){
				return 0;
			}
			
			$total = 0;
			
			$total += Contribuyente::total("cuenta_id = ".$cuenta_id) * 10000; //1000 bytes por contribuyente incluye promedio por logo y cedula
			$total += Cliente::total("cuenta_id = ".$cuenta_id) * 1000; //1000 bytes por cliente
			$total += ClienteTipo::total("cuenta_id = ".$cuenta_id) * 500; //500 bytes por tipo cliente
			$total += Impuesto::total("cuenta_id = ".$cuenta_id) * 500; //500 bytes por impuesto
			$total += Moneda::total("cuenta_id = ".$cuenta_id) * 500; //500 bytes por moneda
			$total += Unidad::total("cuenta_id = ".$cuenta_id) * 500; //500 bytes por unidad
			$total += Producto::total("cuenta_id = ".$cuenta_id) * 1000; //1000 bytes por producto
			$total += ProductoCategoria::total("cuenta_id = ".$cuenta_id) * 500; //500 bytes por categoria
			$total += Sucursal::total("cuenta_id = ".$cuenta_id) * 1000; //1000 bytes por sucursal
			$total += Usuario::total("cuenta_id = ".$cuenta_id) * 500; //500 bytes por usuario
			
			$total += CbbFolio::total("cuenta_id = ".$cuenta_id) * 2000; //500 bytes por folio e imagen
			$total += CbbReceptor::total("cuenta_id = ".$cuenta_id) * 1000; //1000 bytes por receptor
			$total += CbbFactura::total("cuenta_id = ".$cuenta_id) * 2000; //2000 bytes por factura
			$total += CbbConcepto::total("cuenta_id = ".$cuenta_id) * 750; //750 bytes por concepto
			$total += CbbImpuesto::total("cuenta_id = ".$cuenta_id) * 500; //500 bytes por impuesto
			
			return $total / 1000 / 1000;
		}
		
		public static function usuarios($cuenta_id){
			if(!$cuenta_id){
				return 1;
			}
			
			return Usuario::total("cuenta_id = ".$cuenta_id) + 1;
		}
	}
?>