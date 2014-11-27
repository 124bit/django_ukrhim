$(document).ready(function() {

    var iOS = ( navigator.userAgent.match(/(iPad|iPhone|iPod)/g) ? true : false );
    if (iOS){
     $('.body_bg').css('background-size', '100% 93%')
    }
   
    
	//start date
	var date = new Date();
	date.setTime(date.getTime()+1000*60*60*24);
	var day = date.getDate();
	var MonthName = new Array('01','02','03','04','05','06','07','08','09','10','11','12');
	var month = MonthName[date.getMonth()];
	var year = date.getFullYear()
	
	$('.yesterday').html(day+'.'+month+'.'+year)
	//end date

  
    

    imagesLoaded('.carWrap',function(){$('.itemClosed').show();
	var carWrap = $('.carWrap');

    var carDotWrap = $('<span>').addClass('carDotWrap');

    for (var i = 0; i < $('.carItem').length; i++) {

        var carDotItem = $('<span>').addClass('carDotItem').appendTo(carDotWrap);

    }

    carDotWrap.appendTo(carWrap)

    $('.carDotItem:last').addClass('cur')
    carWrap.roundabout({

        enableDrag: true,

        autoplay: true,

        autoplayDuration: 5000,

        autoplayPauseOnHover: true



    });

    carWrap.on('animationEnd', function() {

        var curIndex = $('li', carWrap).index($('.roundabout-in-focus'));
		
		var cirIndexReverse = ($('li', carWrap).length - 1) - curIndex;
		
        $('.carDotItem').eq(cirIndexReverse).addClass('cur').siblings().removeClass('cur');

    })
     
    $(document).on('click', '.carDotItem', function() {

        var curIndex = $('.carDotItem', $('.carDotWrap')).index($(this));
		
		var cirIndexReverse = ($('.carDotItem', $('.carDotWrap')).length - 1) - curIndex;


        $('li', carWrap).eq(cirIndexReverse).trigger('click');

    });
}
    
    )     
    // toilets

    /*

    if ($('.toilets').length) {

        var oldP;

        var carousel = $("#carousel").featureCarousel({

            trackerSummation: false,

            smallFeatureOffset: 120,

            smallFeatureWidth: 101,

            smallFeatureHeight: 136,

            largeFeatureOffset: 120,

            largeFeatureHeight: 270,

            largeFeatureWidth: 180,

            captionBelow: false,

            trackerIndividual: true

        });

    }

    */

    // fancybox

    if ($('.fancybox').length) {

        $(".fancybox").fancybox();

    }





    //  Scrolled by user interaction

    $('#foo2').carouFredSel({

        auto: true,

        prev: '#prev2',

        next: '#next2',

        scroll: {

            items: 1,

            duration: 1200

        },

        width: "100%"

    }, {

        transition: true

    });





    // fredsel with preview

    $(function() {

        $('#thumbs .thumb a').each(function(i) {

            $(this).addClass('itm' + i);

            $(this).click(function() {

                $('#images').trigger('slideTo', [i, 0, true]);

                return false;

            });

        });

        $('#thumbs a.itm0').addClass('selected');



        $('#images').carouFredSel({

            circular: true,

            infinite: false,

            items: 1,

            height: 523,

            width: 950,

            auto: false,

            scroll: {

                items: 1,

                fx: 'directscroll',

                duration: 1200,

                onBefore: function() {

                    var pos = $(this).triggerHandler('currentPosition');

                    $('#thumbs a').removeClass('selected');

                    $('#thumbs a.itm' + pos).addClass('selected');

                }

            }

        }, {

            transition: true

        });



        $('#thumbs').carouFredSel({

            direction: 'left',

            scroll: {

                duration: 1200

            },

            circular: true,

            infinite: false,

            items: 1,

            height: 129,

            width: 892,

            align: false,

            auto: false,

            transition: true,

            prev: {

                button: '#prev',

                onBefore: function() {

                    $('#images').trigger('prev');

                }

            },

            next: {

                button: '#next',

                onBefore: function() {

                    $('#images').trigger('next');

                }

            }

        }, {

            transition: true

        });







        //uslugi i ceni

        var currentTime = new Date();

        var hours = currentTime.getHours();

        $(".serv_btn_order").click(function(e) {

            e.preventDefault();

            if (1) { //hours >= 9 && hours <= 17

                $('.form-overlay').fadeIn(300);

                $('#formDay').fadeIn(300);

            } else {

                $('.form-overlay').fadeIn(300);

                $('#formNight').fadeIn(300);

            }

        });
		
		
		$(document).on('click', '.formDay_closed', function() {

			$('.form-overlay').fadeOut(300);

			$('.formUslugi').add('.popup').fadeOut(300);

		});



		$('.form-overlay').on('click', function() {

			$(this).fadeOut(300);

			$('.formUslugi').add('.popup').fadeOut(300);

		});
      
        
   
        

    });


    
jQuery(function($){
    $("#phoneNumber").mask("+38 (999) 999-99-99");
    //to remove underline just add this after comma: {placeholder:" "} 
});


 
                    
$('a.hprod').hover(
    function(){
        href_selector = $("[href='"+ $(this).attr('href') + "']");
     
        href_selector.filter('a.hprod').not('this').addClass('hprod_hover');
    },
    function(){
        href_selector = $("[href='"+ $(this).attr('href') + "']");
        href_selector.filter('a.hprod').not('this').removeClass('hprod_hover');
    }
)


            

    //endDocumentReady

});