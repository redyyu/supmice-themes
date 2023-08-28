$(document).ready(function () {
  "use strict";

  /* 
   * Parallax
   * ---------------------------------->
   */
  $('.parallax-link[href*=#]').click(function(e) {
    var target_top=0;
    var current_hash='';
    var loc_path = location.pathname.replace(/^\//,'');
    if (loc_path == this.pathname.replace(/^\//,'') 
    && location.hostname == this.hostname) {
      var target;
      if(this.hash){
        current_hash = this.hash;
      }
      if (current_hash) {
        target = target ? $(target) : $(current_hash);
        target_top = target.offset().top;
      }
    }
    $('html, body').animate({
      scrollTop: target_top
    }, 600, function() {
      if (current_hash.charAt(0) == '#'){
        hash_path = current_hash.slice(1);
      }else{
        hash_path = current_hash;
      }  
      window.location.hash = '/'+hash_path;
      // for stupid IE, if no slash the window might brink some how.
    });
    $('.navbar-collapse').collapse('hide');
    e.preventDefault();
    return false;
  });
  
  /* 
   * Slider
   * ---------------------------------->
   */
  var sliding = function (current_slide, slides){
    for (var i=0; i<slides.length; i++){
      slides[i].style.left = (i-current_slide)*100+'%'
    }
  };
  
  $('.slider').each(function(e){
    var btn_prev = $(this).find('> .controls .prev').eq(0);
    var btn_next = $(this).find('> .controls .next').eq(0);
    var sticker_current = $(this).find('> .sticker .current').eq(0);
    var sticker_total = $(this).find('> .sticker .total').eq(0);
    var slides = $(this).children('.slides').children();

    var current_slide = 0;
    
    // set total
    sticker_total.html(slides.length);
    
    // run first
    sliding(current_slide, slides);
    
    // btns
    btn_next.click(function(e){
      if (current_slide < slides.length-1) {
        current_slide++;
      } else {
        current_slide = 0;
      }
      sliding(current_slide, slides);
      sticker_current.html(current_slide+1);
      return false;
    });
    
    btn_prev.click(function(e){
      if (current_slide > 0) {
        current_slide--;
      } else {
        current_slide = slides.length-1;
      }
      sliding(current_slide, slides);
      sticker_current.html(current_slide+1);
      return false;
    });
    
  });
  
  
  /* 
   * Showreel 3D Rotate
   * ---------------------------------->
   */
  var rotating = function(deg, element) {
    element = $(element)[0];
    if(!element){
      return false;
    }
    element.style.transform = 'translateZ(-160px) rotateY('+deg+'deg)';
  }
  $('.showreel').each(function(e){
    var btn_prev = $(this).find('> .controls .prev').eq(0);
    var btn_next = $(this).find('> .controls .next').eq(0);
    var reel = $(this).find('.showreel-cube').eq(0);
    var faces = ['front', 'right', 'back', 'left'];
    var currnet_deg = 0;
    rotating(currnet_deg, reel);
    // btns
    btn_next.click(function(e){
      currnet_deg+=90;
      rotating(currnet_deg, reel);
      return false;
    });
    
    btn_prev.click(function(e){
      currnet_deg-=90;
      rotating(currnet_deg, reel);
      return false;
    });
  });
  
});