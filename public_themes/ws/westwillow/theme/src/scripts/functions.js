$(document).ready(function() {

  $('.img-gallery').each(function() {
      $(this).magnificPopup({
          delegate: '.img-popup', // the selector for gallery item
          type: 'image',
          gallery: {
            enabled:true
          }
      });
  });

});
