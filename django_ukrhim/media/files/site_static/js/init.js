$().ready(function () {

    $('.gallery').gallery();
    
    $('.gallery-in img').live('mouseover', function () {
        this.style.opacity = 1;
    });

    $('.gallery-in img').live('mouseout', function () {
        this.style.opacity = 0.7;
    });

    $.localScroll({
        hash: true
    });
});