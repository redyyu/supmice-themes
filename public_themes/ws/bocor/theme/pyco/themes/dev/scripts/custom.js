/*global jQuery:false */
(function ($) {


	$(window).load(function(){
      $("#navigation").sticky({ topSpacing: 0 });
    });

  $(window).stellar({
    horizontalScrolling: false,
		verticalOffset: 50
  });


	$('ul.nav li.dropdown').hover(function() {
	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
	}, function() {
	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
	});


	//jQuery to collapse the navbar on scroll
	$(window).scroll(function() {
		if ($(".navbar").offset().top > 50) {
			$(".navbar-fixed-top").addClass("top-nav-collapse");
		} else {
			$(".navbar-fixed-top").removeClass("top-nav-collapse");
		}
	});

	//jQuery for page scrolling feature - requires jQuery Easing plugin
  function init_section(){
    $('body section').each(function(event){
      var pos_top = $(this).position().top;
      $(this).data('pos-top', pos_top)
    });
  }
	$(function() {
    $('.navbar-toggle').bind('click', function(event){
      // var hero_height = $('section.hero').outerHeight();
      var hero_height = 400;
      var collapsed = $(this).hasClass('collapsed');
      if($('body').scrollTop() < hero_height && collapsed){
  			$('html, body').stop().animate({
  				scrollTop: hero_height
  			}, 1200, 'easeInOutExpo');
      }
    });

    init_section();
    $(window).resize(init_section);


		$('.navbar-nav li a').bind('click', function(event) {
			var anchor = $(this).attr('href');
      var nav = $(anchor);
      var offset_top = 90;
      var pos_top = nav.data('pos-top') || 0;
			$('html, body').stop().animate({
				scrollTop: pos_top - offset_top
			}, 1500, 'easeInOutExpo');
      var has_toggle = $('.navbar-toggle').css('display') != 'none';
      if(has_toggle){
        $('.navbar-toggle').click();
      }
			event.preventDefault();
		});
	});

	//nivo lightbox
	$('[data-lightbox-gallery]').nivoLightbox({
		effect: 'fadeScale',                             // The effect to use when showing the lightbox
		theme: 'default',                           // The lightbox theme to use
		keyboardNav: true,                          // Enable/Disable keyboard navigation (left/right/escape)
		clickOverlayToClose: true,                  // If false clicking the "close" button will be the only way to close the lightbox
		onInit: function(){},                       // Callback when lightbox has loaded
		beforeShowLightbox: function(){},           // Callback before the lightbox is shown
		afterShowLightbox: function(lightbox){},    // Callback after the lightbox is shown
		beforeHideLightbox: function(){},           // Callback before the lightbox is hidden
		afterHideLightbox: function(){},            // Callback after the lightbox is hidden
		onPrev: function(element){},                // Callback when the lightbox gallery goes to previous item
		onNext: function(element){},                // Callback when the lightbox gallery goes to next item
		errorMessage: 'The requested content cannot be loaded. Please try again later.' // Error message when content can't be loaded
	});

	jQuery('.appear').appear();
	jQuery(".appear").on("appear", function(data) {
			var id = $(this).attr("id");
			jQuery('.nav li').removeClass('active');
			jQuery(".nav a[href='#" + id + "']").parent().addClass("active");
		});

})(jQuery);
