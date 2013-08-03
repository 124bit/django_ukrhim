$(document).ready(function(){
  //табы
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
			document.title = tab.attr('title');
			
		}
	
	}
	
	// Execute this script!
	QTABS.init();
  
  //выпадающий список
  function DropDown(el) {
				this.dd = el;
				this.placeholder = this.dd.children('span');
				this.opts = this.dd.find('ul.dropdown > li');
				this.val = '';
				this.index = -1;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						return false;
					});

					obj.opts.on('click',function(){
						var opt = $(this);
						obj.val = opt.text();
						obj.index = opt.index();
						obj.placeholder.text(' ' + obj.val);
					});
				},
				getValue : function() {
					return this.val;
				},
				getIndex : function() {
					return this.index;
				}
			}

			$(function() {
				var dd = new DropDown( $('#dd') );
				$(document).click(function() {
					$('.wrapper-dropdown-1').removeClass('active');
				});
			});
			$(function() {
				var dd = new DropDown( $('#dd-1') );
				$(document).click(function() {
					$('.wrapper-dropdown-1').removeClass('active');
				});
			});
  
  
  
  

    WebFontConfig = {
    google: { families: [ 'PT+Sans:400,700,400italic:cyrillic-ext,latin,latin-ext,cyrillic' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();

  
});