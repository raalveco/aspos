// Cache jQuery selectors
	var $main = $('#main'),
		$toolbar = $('#toolbar'),
		$sidebar = $('aside');
	// ! Do several things on $(document).ready(...)
	
	// ! Set up content
	$(document).ready(function(){
		
		var $content = $('#content');
	
		// - Wrap the 'h1's contents with 'span's
		$('h1').each(function(){
			var $this = $(this);
			$this.wrapInner('<span />');
		});

		// - Initialize Boxes Menus
		$content.find('.box:has(.header a.menu)').each(function(){
			var $box = $(this),
				$btn = $box.find('.header').find('a.menu'),
				$menu = $btn.next('menu');
				
			$btn.on({
				mousedown: function(){
					$(this).addClass('active');
				},
				mouseup: function(){
					$(this).removeClass('active');
				},
				click: function(){
					$btn.toggleClass('open');
				}
			});
				
			$menu.find('a').on({
				mousedown: function(){
					$(this).addClass('active');
				},
				mouseup: function(){
					$(this).removeClass('active');
				},
				click: function(){
					window.location = this.href;
					return false;
				},
				dragstart: function(){
					return false;
				}
			}).filter(':has(.icon)').addClass('with-icon');
		});
	
		// - Initialize sortable boxes
		if ($content.data('sort')) {
			$content.sortable({
				handle: '.header',
				items: $content.find('.box').parent(),
								
				distance: 5,
				tolerance: 'pointer',
				
				placeholder: 'placeholder',
				forcePlaceholderSize: true,
				forceHelperSize: true
			});
		}
		
		// - Create accordions
		$('#content .accordion').not('.toggle').each(function(){
			$(this).accordion();
		});
		
		$('#content .accordion.toggle').each(function(){
			$(this).multiAccordion();
		});
		
		// - Create tabbed boxes
		$('#content .tabbedBox').tabbedBox();
		
		// - Create vertical tabs
		$('#content .vertical-tabs').tabbedBox({header: $('.right-sidebar'), content: $('.vertical-tabs')});
		
		// - Create wizard boxes
		$('#content .wizard').not('.manual').wizard();
		
		// - Initialize alert boxes
		$('.alert').not('.sticky').find('.icon')
			.after($('<span>').addClass('close').text('x'));
			
		$(document).on('click', '.alert:not(.sticky) .close', function(){
				
		});

		// - Resize and scroll event handling
		$(window).on('resize scroll', function(){
			// Center dialogs
			$('.ui-dialog').position({my: 'center', at: 'center', of: window});
		});
		
	});
	
	// ! Set forms
	$(document).ready(function(){
		// ! Textarea autogrow
		$('textarea').not('.nogrow').not('.editor').autosize();
		
		
		// ! Password strength meter
		$('input:password.meter').passwordMeter();
		
		
		// ! Masked input
		$('.maskRFC').mask('aaa*99999****');
		$('.maskDate').mask('99/99/9999');
		$('.maskPhone').mask('(999) 999 9999');
		$('.maskPhoneExt').mask('(999) 999-9999? x99999');
		$('.maskIntPhone').mask('+33 999 999 999');
		$('.maskTin').mask('99-9999999');
		$('.maskSsn').mask('999-99-9999');
		$('.maskProd').mask('a*-999-a999');
		$('.maskPo').mask('PO: aaa-999-***');
		$('.maskPct').mask('99%');
		$('.maskCustom').each(function(){
			$(this).mask($(this).data('mask') || '');
		});
		
		
		// ! Validation
		
		// - Add new method: password
		$.validator.addMethod('strongpw', function(pwd, el){
			return $.pwdStrength(pwd) > 80;
		}, 'Your password is insecure');
		
		// - Add new method: checked
		$.validator.addMethod('checked', function(val, el){
			return !!$(el)[0].checked;
		}, 'You have to select this option');
		
		// - Set defaults
		$.validator.setDefaults({
		
			// Do not ignore chosen-selects | datepicker mirrors | checkboxes | radio buttons
			ignore: ':hidden:not(select.chzn-done):not(input.mirror):not(:checkbox):not(:radio):not(.dualselects),.ignore',
			
			// If a field is switches from invalid to valid
			success: function(label){
				// Change icon from error to valid
				$(label).prev().filter('.error-icon').removeClass('error-icon').addClass('valid-icon');
				
				// If file input: remove 'error' from '.customfile'
				$(label).prev('.customfile').removeClass('error');
			},
			
			// Where to place the error labels
			errorPlacement: function($error, $element){
						
				if ($element.hasClass('customfile-input-hidden')) {
					
				} else if ($element.hasClass('customfile-input-hidden')) {
				
					$error.insertAfter($element.parent().addClass('error'));
				
				// Password meter || Textarea || Spinner || Inline Datepicker || Checkbox || Radiobutton: No icon
				} else if ($element.is(':password.meter') || $element.is('textarea') || $element.is('.ui-spinner-input') || $element.is('input.mirror')) {
				
					$error.insertAfter($element);

				// Checkbox: No icon, after replacement
				} else if ($element.is(':checkbox') || $element.is(':radio')) {
				
					if ($element.is(':checkbox')) {
						$error.insertAfter($element.next().next());
					} else {
						// Find last radion button
						$error.insertAfter($('[name=' + $element[0].name + ']').last().next().next());
					}
				
				// Select: No icon, insert after select box replacement
				} else if ($element.is('select.chzn-done') || $element.is('.dualselects')) {
					
					$error.insertAfter($element.next());

				// Default: Insert after element, show icon
				} else {
			
					$error.insertAfter($element);
					
					// Show icon
					var $icon = $('<div class="error-icon icon" />').insertAfter($element).position({
						my: 'right',
						at: 'right',
						of: $element,
						offset: '-5 0',
						overflow: 'none',
						using: function(pos) {
							// Figure out the right and bottom css properties 
							var offsetWidth = $(this).offsetParent().outerWidth();
							var right = offsetWidth - pos.left - $(this).outerWidth();
							
							// Position the element so that right and bottom are set.
							$(this).css({left: '', right: right, top: pos.top});  
						}
					});
				
				}
			},
			
			// Reposition error labels and hide unneeded labels
			showErrors: function(map, list){
				var self = this;
				
				this.defaultShowErrors();
				
				list.forEach(function(err){
					var $element = $(err.element),
						$error = self.errorsFor(err.element);
				
					// Select || Textarea || File Input || Inline Datepicker || Checkbox || Radio button: Inline Error Labels
					if ( $element.data('errorType') == 'inline' || $element.is('select') || $element.is('textarea') || $element.hasClass('customfile-input-hidden') || $element.is('input.mirror') || $element.is(':checkbox') || $element.is(':radio') || $element.is('.dualselect')) {
					
						// Get element to which the error label is aligned
						var $of;
						if ($element.is('select')) {
							$of = $element.next();
						} else if ($element.is(':checkbox') || $element.is(':radio')) {
							if ($element.is(':checkbox')) {
								$of = $element.next();
							} else {
								// Find last radio button
								$of = $('[name=' + $element[0].name + ']').last().next().next();
							}
							$error.css('display', 'block');
						} else if ($element.is('input.mirror')) {
							$of = $element.prev();
						} else {
							$of = $element;
						}
						
						$error.addClass('inline').position({
							my: 'left top',
							at: 'left bottom',
							of: $of,
							offset: '0 5',
							collision: 'none'
						});
						
						if (!($element.is(':checkbox') && $element.is(':radio'))) {
							$error.css('left', '');
						}
					
					// Default: Tooltip labels
					} else {
						
						$error.position({
							my: 'right top',
							at: 'right bottom',
							of: $element,
							offset: '1 8',
							using: function(pos) {
								// Figure out the right and bottom css properties 
								var offsetWidth = $(this).offsetParent().outerWidth();
								var right = offsetWidth - pos.left - $(this).outerWidth();
								
								// Position the element so that right and bottom are set.
								$(this).css({left: '', right: right, top: pos.top});  
							}
						});
					
					} // End if
					
					// Switch icon from valid to error
					$error.prev().filter('.valid-icon').removeClass('valid-icon').addClass('error-icon');
			
					// Hide error labe on .noerror
					if ($element.hasClass('noerror')) {
						$error.hide();
						$element.next('.icon').hide();
					}
				});
				
				// Hide success labels
				this.successList.forEach(function(el){
					self.errorsFor(el).hide();
				});
				
			}
		});
		
		// - Validate
		$('form.validate').each(function(){
			$(this).validate({
				submitHandler: function(form){
					$(this).data('submit') ? $(this).data('submit')() : form.submit();
				}
			});
		});
		
		// - Reset validation on form reset
		$('form.validate').on('reset', function(){
			var $form = $(this);
			$form.validate().resetForm();
			$form.find('label.error').remove().end()
			     .find('.error-icon').remove().end()
			     .find('.valid-icon').remove().end()
			     .find('.valid').removeClass('valid').end()
			     .find('.customfile.error').removeClass('error');
		});

		
		// ! Polyfill: 'form' tag on <input>s
		if (!('form' in document.createElement('input'))) {
			$('input:submit').each(function(){
				var $el = $(this);
				if ($el.attr('form')){
					$el.click(function(){
						$('#' + $el.attr('form')).submit();
					});
				}
			});
			$('input:reset').each(function(){
				var $el = $(this);
				if ($el.attr('form')){
					$el.click(function(){
						$('#' + $el.attr('form'))[0].reset();
					});
				}
			});
		}
	});
	
	// ! jQuery UI elements
	$(document).ready(function(){
		
		var revalidateInput = function(){
			if ($.validator) {
				var $el = $(this),
					$form = $el.parents('form'),
					validator = $form.data('validator');
					
				if (validator) {
					validator.element(this);
				}
			}
		};
	
		// - Dialog
		$.extend($.ui.dialog.prototype.options, {
			minWidth: 350,
			resizable: false,
			
			show: {effect: 'fade', duration: 800},
			hide: {effect: 'fade', duration: 800}
		});
		
		// - Progressbar
		$('#content').find('.ui-progressbar').each(function(){
			var $this = $(this);
			$this.progressbar($this.data());
		});
		
		// - Datepicker
		// FIX: Wrong positioning of datepicker
		$.extend($.datepicker,{_checkOffset:function(inst,offset,isFixed){return offset}});
		
		$.extend($.datepicker._defaults, {
			showButtonPanel: true,
			showOtherMonths: true,
			closeText: 'Close'
		});
		
		var datepickerEvents = {
			onSelect: revalidateInput,
			onClose: revalidateInput
		};
		
		$.extend($.datepicker._defaults, datepickerEvents);
		$.extend($.timepicker._defaults, datepickerEvents);
		
		// Optional: Localization
		
		$('input[type=date]').each(function(){
			var $el = $(this);
			if ($.browser.webkit) {
				$el[0].type = 'text';
			}
			$el.datepicker();
		});
		$('input[type=datetime]').each(function(){
			$(this).datetimepicker().blur(revalidateInput);
		});
		$('input[type=time]').each(function(){
			$(this).timepicker({
				ampm: $(this).data('data-timeformat') == 12
			}).blur(revalidateInput);
		});
		
		// Create mirror input for inline datepicker
		var inline = {
		
			// Write date to mirror
			onselect: _.debounce(function(date, inst){
				(inst.input || inst.$input).data('mirror').val(date);
			}, 300),
			
			// Create mirror
			setup: function($el){
				var $mirror = $('<input>', {
					id: $el.data('id'),
					'class': 'mirror',
					name: $el.data('name'),
					required: $el.attr('required') || 'false'
				}).hide().insertAfter($el);
				$el.data('mirror', $mirror);
			}
		};
		
		$('div[data-type=date]').each(function(){
			var $this = $(this);
			inline.setup($this);
			$this.datepicker({
				onSelect: inline.onselect
			});
		});
		$('div[data-type=datetime]').each(function(){
			var $this = $(this);
			inline.setup($this);
			$this.datetimepicker({
				onSelect: inline.onselect
			});
		});
		$('div[data-type=time]').each(function(){
			var $this = $(this);
			inline.setup($this);
			$this.timepicker({
				onSelect: inline.onselect,
				ampm: $(this).data('data-timeformat') == 12
			});
		});
		
		// - Slider
		$('input[data-type=range]').mslider();
		
		(function(){
			var $slider = $('input.eq[data-type=range]').next();
			var zindex = $slider.length + 1;
			$slider.each(function(){
				$(this).css('z-index', zindex--);
			});
		})();
		
		// - Autocomplete
		$('[data-type=autocomplete]').each(function(){
		
			var $input = $(this);
			$input.attr('autocomplete', 'off');
			$input.autocomplete({
				source: $input.data('data') || $input.data('source'),
				disabled: !!$input.attr('disabled'),
				minLength: $input.data('minlength') || 1,
				position: {
					my: 'top',
					at: 'bottom',
					offset: '0 10',
					collision: 'none'
				},
				
				select: revalidateInput
			});
			
		});
		
		// Reposition autocomplete after window resize
		$(window).resize( _.debounce(function(){
			$('[data-type=autocomplete]').each(function(){
				var $this = $(this),
					$menu = $this.data('autocomplete').menu.element;
					
				$menu
					.width($this.outerWidth())
					.position({
						my: 'top',
						at: 'bottom',
						offset: '0 10',
						collision: 'none',
						of: $this
					});
			});
		}, 300));
		
	});
	
	// ! Forms
	$(document).ready(function(){
	
		// ! Checkbox and radio
		$('input:checkbox').checkbox({
			cls : 'checkbox',
			empty : '.../../img/elements/checkbox/empty.png'
		});
		$('input:radio').checkbox({
			cls : 'radiobutton',
			empty : '.../../img/elements/checkbox/empty.png'
		});
		
		// ! Select boxes
		var $cznSelects = $('select').not('.dualselects');
		$cznSelects.each(function(){
			var $el = $(this);
			
			$el.chosen({
				disable_search_threshold: $el.hasClass('search') ? 0 :Number.MAX_VALUE,
				allow_single_deselect: true,
				width: $el.data('width') || '100%'
			});
		});
				
		// - Set up select boxes validation
		$('.chzn-done').on('change', function(){
			var validate = $(this).parents('form').validate();
			validate && validate.element($(this));
		}).each(function(){
		// - Set up form reset listener
			var $input = $(this),
				$form = $input.parents('form');
			
			$form.on('reset', function(){
				$input[0].selectedIndex = -1;
				$input.trigger('liszt:updated');
			});
			
			$form.data('chzn-reset', true);
		});
		
		// ! Double Select Box
		if (!Modernizr.touch) {
			$('select.dualselects').dualselect();
		}
		
		// ! File input
		$('input:file').fileInput();
		
		// ! Uploader
		$('.uploader').each(function(){
			var $uploader = $(this);
			$uploader.pluploadQueue($.extend({
				runtimes: 'html5,flash,html4',
				url : 'extras/upload.php',
				max_file_size : '10mb',
				chunk_size : '1mb',
				unique_names : true,
				
				filters : [
					{title : "Image files", extensions : "jpg,gif,png"},
					{title : "Zip files", extensions : "zip"}
				],
				
				flash_swf_url : 'js/mylibs/forms/uploader/plupload.flash.swf'
			}, $uploader.data()));
			$uploader.find('.plupload_button').addClass('button grey btn');
			$uploader.find('.plupload_add').addClass('icon-plus');
			$uploader.find('.plupload_start').addClass('icon-ok');
		});
		
		// ! Spinner
		$('input[data-type=spinner]').each(function(){
			var $spinner = $(this),
			opts = $spinner.data();
			
			if (opts.format) {
				opts.numberformat = opts.format;
				opts.format = undefined;
			}
			$spinner.spinner(opts);
		});
		
		// ! Color input
		$('input[type=color]').not('.flat').each(function(){
			var $input = $(this).hide(),
				$picker = $('<div class="cpicker"><div class="color"></div></div>').insertAfter($input),
				$color = $picker.children();
				
			// Update input val
			$input.val() ? $color.css('background', $input.val()) : $input.val('#ff0000');
			var origVal = $input.val();
			
			// Update preview and input val
			$picker.ColorPicker({
				onChange: function (hsb, hex, rgb) {
					$input.val('#' + hex);
					$color.css('background', '#' + hex);
				}
			});
			$picker.ColorPickerSetColor(origVal);
			
			// Reset input on form reset
			$input.parents('form').on('reset', function(){
				$input.val(origVal);
				$picker.ColorPickerSetColor(origVal);
				$color.css('background', origVal);
			});
		});
		
		$('input[type=color].flat').each(function(){
			var $input = $(this).hide(),
			$picker = $('<div>').insertAfter($input);
			
			// Update input val
			!$input.val() && $input.val('#ff0000');
			var origVal = $input.val();
			
			// Update preview and input val
			$picker.ColorPicker({
				flat: true,
				onChange: function (hsb, hex, rgb) {
					$input.val('#' + hex);
				}
			});
			$picker.ColorPickerSetColor(origVal);
			
			// Reset input on form reset
			$input.parents('form').on('reset', function(){
				$input.val(origVal);
				$picker.ColorPickerSetColor(origVal);
			});
		});
		
		// ! Editor
		$('textarea.editor').each(function(){
			var $input = $(this),
				isFull = $input.hasClass('full');
			$input.cleditor({			
				width: isFull ? 'auto' : '100%',
				height: '250px',
				bodyStyle: 'margin: 10px; font: 12px Arial,Verdana; cursor:text',
				useCSS: true
			});
			isFull && $input.parents('.cleditorMain').addClass('full');
		});
		
		// ! Forms
		// - In rows view: resize the labels
		var formResize = function(){
			$('#content,#login,.ui-dialog:not(:has(#settings))').find('form').each(function(){
				var $form = $(this);

				// Set up rows view
				// Let labels have equal width and same height as the corresponding <div>
				
				// - Clean up old values
				var $rows = $form.find('.row'),
					$label = $rows.children('label'),
					$divs = $rows.children('div');
				
				$label.css('width', '');
				$divs.css('height', '');
				$divs.css('margin-left', '');
				
				$label.equalWidth();
				$divs.css('margin-left', $label.width() + parseInt($label.css('margin-right')) );
				
				$label.each(function(){
					var $lbl = $(this),
						$div = $lbl.next();
					var heightLbl = $lbl.outerHeight(),
						heightDiv = $div.height();
						
					if (heightLbl > heightDiv) {
						$div.height(heightLbl);
					}
				});
				
				// Not Boxed
				if (!$form.parents('.box').length && !$form.is('.box')) {
					$form.addClass('no-box');
				}
				
				// Update pw meter
				$form.find(':password.meter').each(function(){
					$(this).data('reposition') && $(this).data('reposition')();
				})
			});
		};
		
		formResize();
		
		// - Resize labels after webfont was loaded
		//   (otherwise crazy stuff could happen)
		$(window).on('fontsloaded', function(){
			formResize();
		});
		
		// - Resize labels when changing from desktop to mobile layout
		var windowWidth = $(window).width();
		$(window).on('resize', _.debounce(function(){
			formResize();
		}, 200));
		
		// ! Inline Labels
		var inlineLabelResize = function($input, $label){
			$input.css('padding-left', $label.outerWidth(true));
		};
		
		$('form').each(function(){
			var $form = $(this)
			  , $inlineLabels = $form.find('label.inline');
			
			$inlineLabels.each(function(){
				var $label = $(this),
					$input = $('#' + $label.attr('for'));
				
				inlineLabelResize($input, $label);
				$(window).on('fontsloaded', function(){
					inlineLabelResize($input, $label);
				});
				
				$label.position({
					my: 'left center',
					at: 'left center',
					of: $input,
					using: function(pos){
						$label.css('top', pos.top);
					}
				});
			});
		});
	
	});