(function ($) {
    $.fn.gallery = function () {
        $(this).each(function () {
            func.hideMenu.apply(this);
            func.init.apply(this);
        })
    }

    var func = {
        init: function () {
            //Add handlers to bottom menu.
            $(this).find('.gallery-menu-bottom').click(func.selectBottomMenuItem);

            //Add handlers to top menu
            $(this).find('.gallery-button').click(function () {
                href = $(this).attr('href');

                $.post(href, func.showPhotos);

                return false;
            });

            $(this).find('.gallery-menu-bottom').first().click();

            //Add handlers to scroll buttons
            $('.gallery-scroll-top').click(func.scrollUp);
            $('.gallery-scroll-bottom').click(func.scrollDown);
        },
        selectBottomMenuItem: function () {
            $this = $(this);
            $gallery = $this.parents('.gallery');
            func.hideMenu.apply($gallery);

            var menuIndex = $(this).attr('menuIndex');
            $gallery.find('.gallery-menu-top_' + menuIndex).show();

            if (menuIndex) {
                $gallery.find('.gallery-menu-top_' + menuIndex).children().first().click();
            }

            return false;
        },
        hideMenu: function () {
            $(this).find('.gallery-menu-top').hide();
        },
        scrollDown: function () {
            $galleryContent = $(this).parents('.gallery').find('.gallery-in');

            $scrollVal = $galleryContent.scrollTop();
            $galleryContent.scrollTop($scrollVal + 123.5);
        },
        scrollUp: function () {
            $galleryContent = $(this).parents('.gallery').find('.gallery-in');

            $scrollVal = $galleryContent.scrollTop();
            $galleryContent.scrollTop($scrollVal - 123.5);
        },
		scrollHide: function(){
			$('.gallery-scroll-top').hide();
			$('.gallery-scroll-bottom').hide();
		},
		scrollShow: function(){
			$('.gallery-scroll-top').show();
			$('.gallery-scroll-bottom').show();
		},
		scrollUpdate: function(){
		    $content = $('.gallery .gallery-content');
		    $gallery = $('.gallery .gallery-in');
			
		    if ($content.height() > $gallery.height()) {
			    func.scrollShow();                
			}
			else{
			    func.scrollHide();
			}
		},
        showPhotos: function (photos) {
            $content = $('.gallery .gallery-content');
            $content.children().remove();

            $(photos).appendTo($content);
            $content.scrollTop(0);
						
            $content.find('a').fancybox();
			
			setTimeout(func.scrollUpdate, 300);			
        }
    }
})(jQuery)