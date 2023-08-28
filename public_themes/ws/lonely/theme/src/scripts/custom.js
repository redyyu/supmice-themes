(function ($) {

	new WOW().init();

	$(window).load(function(){
    $("#navigation").sticky({ topSpacing: 0 });
  });

	jQuery(window).load(function() {
		jQuery("#preloader").delay(100).fadeOut("slow");
		jQuery("#load").delay(100).fadeOut("slow");
	});


	//jQuery for page scrolling feature - requires jQuery Easing plugin
  function init_section(){
    $('body section').each(function(event){
      var pos_top = $(this).position().top;
      $(this).data('pos-top', pos_top)
    });
  }
	$(function() {
    init_section();
    $(window).resize(init_section);

		$('.navbar-nav li a').bind('click', function(event) {
			var anchor = $(this).attr('href');
      try {
        var nav = $(anchor);
      } catch (e) {
        return true;
      }
      var offset_top = 50;
      var pos_top = nav.data('pos-top') || 0;
			$('html, body').stop().animate({
				scrollTop: pos_top - offset_top
			}, 900, 'easeInOutExpo');
      var has_toggle = $('.navbar-toggle').css('display') != 'none';
      if(has_toggle){
        $('.navbar-toggle').click();
      }
			event.preventDefault();
		});

		$('.page-scroll a').bind('click', function(event) {
      var sections = $('body > section');
      var target_sec = null;
      if(sections.length > 0) {
        target_sec = $(sections[1])
      }else{
        return false;
      }
      var offset_top = 50;
      var pos_top = target_sec.data('pos-top') || 0;
			$('html, body').stop().animate({
				scrollTop: pos_top - offset_top
			}, 900, 'easeInOutExpo');
			event.preventDefault();
		});
	});

	//nivo lightbox
	$('.gallery .item a').nivoLightbox({
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


	//parallax
  if ($('.parallax').length){
    $(window).stellar({
    	responsive:true,
      scrollProperty: 'scroll',
      parallaxElements: false,
      horizontalScrolling: false,
      horizontalOffset: 0,
      verticalOffset: 0
    });

  }

})(jQuery);
