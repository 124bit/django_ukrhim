
$(document).ready(function()
{

	//home page hero
	if ($("#showcase").length) {

		$("#showcase").awShowcase(
		{
			content_width:			960,
			content_height:			392,
			fit_to_parent:			false,
			auto:					true,
			interval:				5000,
			continuous:				true,
			loading:				true,
			tooltip_width:			200,
			tooltip_icon_width:		32,
			tooltip_icon_height:	32,
			tooltip_offsetx:		18,
			tooltip_offsety:		0,
			arrows:					true,
			buttons:				false,
			btn_numbers:			false,
			keybord_keys:			true,
			mousetrace:				false, /* Trace x and y coordinates for the mouse */
			pauseonover:			true,
			stoponclick:			true,
			transition:				'fade', /* hslide/vslide/fade */
			transition_delay:		300,
			transition_speed:		500,
			show_caption:			'show', /* onload/onhover/show */
			thumbnails:				true,
			thumbnails_position:	'outside-last', /* outside-last/outside-first/inside-last/inside-first */
			thumbnails_direction:	'horizontal', /* vertical/horizontal */
			thumbnails_slidex:		0, /* 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
			dynamic_height:			false, /* For dynamic height to work in webkit you need to set the width and height of images in the source. Usually works to only set the dimension of the first slide in the showcase. */
			speed_change:			false, /* Set to true to prevent users from swithing more then one slide at once. */
			viewline:				false /* If set to true content_width, thumbnails, transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of images in the source. */
		});

	}
	

	// tab	 
	 if ($('#tabs')) {
	 
		 if (window.location.hash) {
			 $('#tabs li a').each(function () {
			 	if ($(this).attr('href') == window.location.hash) {
					$(this).parent().addClass('active');
				 	$('#content .panel').hide();					
					$('#content .panel:eq(' + ($(this).parent().index()) + ')').show();
			 	}
			 });
				
		 } else {
			 $('#tabs li:first').addClass('active');
			 $('#content .panel:not(:eq(0))').hide();	
		 }
	 
		 $('#tabs li a').click(function () {
	
		    $('#tabs li').removeClass('active');	 
		 	$(this).parent().addClass('active');
		 	
		 	$('#content .panel').hide();
		 	$('#content .panel:eq(' + ($(this).parent().index()) + ')').show();
		 	
		 });  
		 
		 
		$.address.change(function(event) {

			 $('#tabs li a').each(function () {
			 	if ($(this).attr('href') == window.location.hash) {
				 	$('#tabs li').removeClass('active');
					$(this).parent().addClass('active');
				 	$('#content .panel').hide();					
					$('#content .panel:eq(' + ($(this).parent().index()) + ')').show();
			 	}
			 });

		});
		 
	}
	
	
	//faq
	$('dl.faqs dd').hide();	
	
	$('dl.faqs dt a').click(function () {
		
		if ($(this).parent().next().is(':visible')) {
			$(this).parent().next().hide();
			$(this).removeClass('down');			
		} else {
			$(this).parent().next().show();
			$(this).addClass('down');
		}
		
		return false;
	});		
	
	
});
