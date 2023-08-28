/* about js */
$(window).load(function() {
  $("#flexiselClients").flexisel({
    visibleItems: 5,
    animationSpeed: 1000,
    autoPlay: true,
    autoPlaySpeed: 3000,
    pauseOnHover: true,
    enableResponsiveBreakpoints: true,
      responsiveBreakpoints: {

        portrait: {
          changePoint:480,
          visibleItems: 1
        },
        landscape: {
          changePoint:640,
          visibleItems: 2
        },
        tablet: {
          changePoint:768,
          visibleItems: 3
        }
      }
    });

});

/* Prettify */
$(document).ready(function() {
  $("#owlde").owlCarousel({
   items : 3,
   lazyLoad : true,
   autoPlay : true,
   navigation : true,
   navigationText : ["",""],
   rewindNav : false,
   scrollPerPage : false,
   pagination : true,
   paginationNumbers: false,
  });
});

/* portfolio_js */
$(document).ready(function(){
  $('#nivo-lightbox-demo a').nivoLightbox({ effect: 'fade' });
});

/* scroll_top_btn */
$(document).ready(function() {
  var defaults = {
      containerID: 'toTop', // fading element id
    containerHoverID: 'toTopHover', // fading element hover id
    scrollSpeed: 1200,
    easingType: 'linear'
  };
  $().UItoTop({ easingType: 'easeOutQuart' });
});


jQuery(document).ready(function($) {
  $(".scroll").click(function(event){
    event.preventDefault();
    $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
  });
});
