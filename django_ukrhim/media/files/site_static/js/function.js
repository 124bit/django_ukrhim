$(document).ready(function(){
  //����
  var QTABS = {
	
		init: function () {
		
			// attached onload and change event to address plugin
			$.address.init(function(event) {
				
				// first load, set panel
				QTABS.setPanel(event);
					
			}).change(function(event) {

				// if the url changes, set panel
				QTABS.setPanel(event);			

			});
		
		},
		
		// the core function to display correct panel
		setPanel: function (event) {
		
			// grab the hash tag from address plugin event
			var hashtag = event.pathNames[0];
			
			// get the correct tab item, if no hashtag, get the first tab item
			var tab = (hashtag) ? $('#tabs li a[href=#' + hashtag + ']') : $('#tabs li:first a');

			// reset everything to default
			$('#tabs li').removeClass('active');
			$('#panels .panel').hide();

			// if hashtag is found
			if (hashtag) {
				
				// set current tab item active and display correct panel
				tab.parent().addClass('active');
				$('#panels .panel:eq(' + (tab.parent().index()) + ')').show();			
			} else {
				// set the first tab item and first panel				
				$('#tabs li:first').addClass('active');
				$('#panels .panel:first').show();			
			
			}
			// change the page title to current selected tab
			//document.title = tab.attr('title');
		}
	}
	// Execute this script!
	QTABS.init();
});
  //���������� ������
$(document).ready(function(){
 $(".level1").click(function(){
       var cssD = $(this).next('.level2').css('display');
        if( cssD == "none"){
             $(this).next('.level2').slideDown(400);
       }
       else{
            $(this).next('.level2').slideUp(400);
       }
}
)                   
 });