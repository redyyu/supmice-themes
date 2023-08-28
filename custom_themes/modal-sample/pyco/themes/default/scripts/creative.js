/*!
 * Start Bootstrap - Creative Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

(function($) {
    "use strict"; // Start of use strict

    $('.img-gallery').each(function() {
        $(this).magnificPopup({
            delegate: '.img-popup', // the selector for gallery item
            type: 'image',
            gallery: {
              enabled:true
            }
        });
    });

    $('.popup-modal').each(function () {
        $(this).magnificPopup({
            type: 'inline',
            preloader: false,
        });
    });



    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var anchor = $(this);
        try {
            var scorll_target = $(anchor.attr('href'));
        } catch (e) {
            return true;
        }
        var pos_top = 0;
        if (scorll_target.length > 0){
          pos_top = scorll_target.offset().top
        }
        $('html, body').stop().animate({
            scrollTop: pos_top - 50
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    })

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    // Offset for Main Navigation
    $('#primary-nav').affix({
        offset: {
            top: 100
        }
    })

})(jQuery); // End of use strict
