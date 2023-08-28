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

    $('.popup-video').each(function () {
        $(this).magnificPopup({
            disableOn: 700,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,
            fixedContentPos: false
        });
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
