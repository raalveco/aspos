<?php
class simple_cfdi {

  /**
   * Returns the private key from DER to PEM format, uses openssl from shell
   *
   * @param string $key_path the path of the private key in DER format
   * @param string $password the private key password
   * @return string the private key in a PEM format
   */
  public static function getPrivateKey ( $key_path, $password )
  {
  	
	    $cmd = 'openssl pkcs8 -inform DER -in '.$key_path.' -passin pass:'.$password;
	    if ( $result = shell_exec( $cmd ) ) {
	      unset( $cmd );
	
	      return $result;
	    }
	    return false;
  }

  /**
   * Return the certificate from DER to PEM on two formats, uses openssl from shell
   * if to_string is true resutns the certificate in a string as is (multiline)
   * but if set to false returns only the certificate in a one line string.
   *
   * @param string $cer_path the path of the certificate in DER format
   * @param boolean $to_string a flag to set the format required
   * @return string the certificate in PEM format
   */
  public static function getCertificate ( $cer_path, $to_string = true )
  {
	    $cmd = 'openssl x509 -inform DER -outform PEM -in '.$cer_path.' -pubkey';
	    if ( $result = shell_exec( $cmd ) ) {
	      unset( $cmd );
	
	      if ( $to_string ) {
	
	        return $result;
	      }
	
	      $split = preg_split( '/\n(-*(BEGIN|END)\sCERTIFICATE-*\n)/', $result );
	      unset( $result );
	
	      return preg_replace( '/\n/', '', $split[1] );
	    }
	
	    return false;
  }

  /**
   * Signs data with the key and returns it in a base64 string
   *
   * @param string $key string containing the key in PEM format
   * @param string $data data to sign
   * @return string the signed data in base64
   */
  public static function signData ( $key, $data )
  {
  	print_r($key);
	    $pkeyid = openssl_get_privatekey( $key );
	
	    if ( openssl_sign( $data, $cryptedata, $pkeyid, OPENSSL_ALGO_SHA1 ) ) {
	
	      openssl_free_key( $pkeyid );
	
	      return base64_encode( $cryptedata );
	    }
  }

  /**
   * Returns the serial number from a DER certificate, uses openssl from shell
   *
   * @param string $cer_path the certificate path in DER format
   * @return string the serial number of the certificate in ASCII
   */
  public static function getSerialFromCertificate ( $cer_path )
  {
	    $cmd = 'openssl x509 -inform DER -outform PEM -in '.$cer_path.' -pubkey | '.
	           'openssl x509 -serial -noout';
	    if ( $serial = shell_exec( $cmd ) ) {
	      unset( $cmd );
	
	      if ( preg_match( "/([0-9]{40})/", $serial, $match ) ) {
	        unset( $serial );
	
	        return implode( '', array_map( 'chr', array_map( 'hexdec', str_split( $match[1], 2 ) ) ) );
	      }
	    }
	
	    return false;
  }
  
  public static function getCadenaOriginal($xml_pad, $xlst_path){
				
		$xsltFile = $xlst_path;
		$xmlFile = $xml_pad;
			
	    $xslt = new XSLTProcessor();
	    $xsl = new DOMDocument();
	    $xml = new DOMDocument();
	
	    $xsl->load( $xsltFile, LIBXML_NOCDATA);
	    $xml->load( $xmlFile, LIBXML_NOCDATA );
	
	    @$xslt->importStylesheet( $xsl );
	
	    return $xslt->transformToXML( $xml );

	}
}