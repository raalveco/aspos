jQuery(function($) {
	$("a.jsShow").live('click' , function(event) {
		event.preventDefault();
		$(this.rel).show();
	});
	
	$("a.jsHide").live('click', function(event) {
		event.preventDefault();
		$(this.rel).hide();
	});
	
	$("a.jsToggle").live('click', function(event) {
		event.preventDefault();
		$(this.rel).toggle();
	});
	
	$("a.jsRemote").live('click', function(event) {
		
		if(this.rel == "#contenido"){
			$("#contenido").html('<div style="font-weight: bold; font-size: 18px;" align="center"><br /><img src="/aspos/img/loader.gif"><br>Cargando...</div>');	
		}
		
		event.preventDefault();
		$(this.rel).load(this.href)
	});
	
	$("a#jsRemote").live('click', function(event) {
		if(this.rel == "#contenido"){
			$("#contenido").html('<div style="font-weight: bold; font-size: 18px;" align="center"><br /><img src="/aspos/img/loader.gif"><br>Cargando...</div>');	
		}
		
		event.preventDefault();
		$(this.rel).load(this.href)
	});
	
	$("a.jsRemoteEliminar").live('click', function(event) {
		event.preventDefault();
		
		if(confirm('Estas seguro que deseas eliminar el registro?')){
			if(this.rel == "#contenido"){
				$("#contenido").html('<div style="font-weight: bold; font-size: 18px;" align="center"><br /><img src="/aspos/img/loader.gif"><br>Cargando...</div>');	
			}
			
			$(this.rel).load(this.href);
		}
		else{
			return false;
		}
	});
	
	$("a.jsRemoteCancelar").live('click', function(event) {
		event.preventDefault();
		
		if(confirm('Estas seguro que deseas cancelar la factura?')){
			if(this.rel == "#contenido"){
				$("#contenido").html('<div style="font-weight: bold; font-size: 18px;" align="center"><br /><img src="/aspos/img/loader.gif"><br>Cargando...</div>');	
			}
			
			$(this.rel).load(this.href);
		}
		else{
			return false;
		}
	});
});