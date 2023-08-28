(function(){

	// Menu settings
	$('.menu-toggle, .menu-close').on('click', function(){
		$('.menu-toggle').toggleClass('active');
		$('body').toggleClass('body-push-toleft');
		$('.primary-menu').toggleClass('menu-open');
	});

  $('.folio-item').each(function() {
      $(this).magnificPopup({
          delegate: '.img-popup', // the selector for gallery item
          type: 'image',
          gallery: {
            enabled:true
          }
      });
  });

})(jQuery)