// loader
$(window).load(function() {
  // makes sure the whole site is loaded
  $('#status').fadeOut();
  // will first fade out the loading animation
  $('#preloader').delay(350).fadeOut('slow');
  // will fade out the white DIV that covers the website.
  $('body').delay(350).css({'overflow':'visible'});
});

// Sticky Header
$(window).scroll(function() {
  if ($(window).scrollTop() > 100) {
    $('#primary-nav').addClass('sticky');
  } else {
    $('#primary-nav').removeClass('sticky');
  }
});

$(document).ready(function(){
  // navigation scroll lijepo radi materem
  $('#primary-navbar a').click(function(event) {
    var id = $(this).attr("href");
    try {
      var el_sec = $(id);
    } catch (e){
      return true
    }
    var offset = $('#primary-nav').outerHeight();
    var pos_top = 0;
    if (el_sec.length > 0){
      pos_top = el_sec.offset().top
    }
    var target_pos = pos_top - offset;
    $('html, body').animate({
        scrollTop: target_pos
    }, 500);
    event.preventDefault();
  });

  // Closes the Responsive Menu on Menu Item Click
  $('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
  });

  $('.folio').each(function() {
    $(this).magnificPopup({
      delegate: '.img-popup', // the selector for gallery item
      type: 'image',
      gallery: {
        enabled:true
      }
    });
  });


  // portfolio rollover
  $('.folio').hover(
    function () {
      $(this).find('.label').stop()
        .animate({bottom: 0}, 200, 'easeOutQuad');
      $(this).find('img').stop()
        .animate({top: -30}, 500, 'easeOutQuad');
    },
    function () {
      $(this).find('.label').stop()
        .animate({bottom: -40}, 200, 'easeInQuad');
      $(this).find('img').stop()
        .animate({top: 0}, 300, 'easeOutQuad');
    }
  );

  // nice scroll
  $("html").niceScroll({
    cursorwidth:"8",
    cursorborderradius:"none",
    cursorborder:"none",
    cursorcolor:"#3498db",
    mousescrollstep:"60"
  });

  // Owl carousel
  $("#owl-carosuel").owlCarousel({
    slideSpeed : 3000,
    paginationSpeed : 400,
    singleItem:true,
    autoPlay : true,
    transitionStyle : "backSlide",
    // "singleItem:true" is a shortcut for:
    // items : 1,
    // itemsDesktop : false,
    // itemsDesktopSmall : false,
    // itemsTablet: false,
    // itemsMobile : false
  });

  // Up to top js
  $().UItoTop({ easingType: 'easeOutQuart' });

});
