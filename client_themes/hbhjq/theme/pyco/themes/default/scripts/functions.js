$(document).ready(function () {
  "use strict";

  var goAnchor = function(current_hash, target_top) {
    $('#primary-nav #nav-menu li').removeClass('active');
    var hash_path;
    $('html, body').animate({
      scrollTop: target_top
    }, 600, function() {
      if (current_hash.charAt(0) == '#'){
        hash_path = current_hash.slice(1);
      }else{
        hash_path = current_hash;
      }  
      window.location.hash = '/'+hash_path;
      var navs = $('#primary-nav #nav-menu li a');
      for(var i=0; i<navs.length; i++){
        var nav = navs[i];
        var nav_hash;
        try {
          nav_hash = nav.hash.replace(/\//,'').replace(/^\#/,'');
          if(nav_hash == hash_path){
            $(nav).parent('li').addClass('active');
          }
        }catch(e){
          console.log(e)
        }
      }
      // for stupid IE, if no slash the window might brink some how.
    });
  }

  
  /* 
   * Automatic hash 
   * ---------------------------------->
   */
  var onloaded_hash = location.hash.replace(/\//,'');
  var onloaded_offset = $(onloaded_hash).offset();
  if (onloaded_hash && onloaded_offset) {
    goAnchor(onloaded_hash, onloaded_offset.top);
  }
  
  /* 
   * Parallax
   * ---------------------------------->
   */
  $('.parallax-link[href*=#]').click(function(e) {
    var target;
    var target_top=0;
    var current_hash='';
    var loc_path = location.pathname.replace(/^\//,'');

    if (loc_path == this.pathname.replace(/^\//,'') 
    && location.hostname == this.hostname) {
      try {
        current_hash = this.hash.replace(/\//,'');
        target_top = $(current_hash).offset().top;
      }catch(e){
        target_top = 0;
      }
    }else{
      return true;
    }
    
    goAnchor(current_hash, target_top);
    
    $('.navbar-collapse').collapse('hide');
    e.preventDefault();
    return false;
  });
  
  
  /* 
   * Nav scrolling
   * ---------------------------------->
   */
  var is_nav_fixed = false;
  var set_fixed_navbar = function(is_fixed) {
    if (is_fixed == is_nav_fixed) {
      return;
    }

    if(is_fixed){
      $('#primary-nav').fadeOut(300, function(e){
        $('#primary-nav')
          .addClass('navbar-fixed-top')
          .removeClass('navbar-static-top')
          .fadeIn(300);
      });
    }else{
      $('#primary-nav').fadeOut(300, function(e){
        $('#primary-nav')
          .removeClass('navbar-fixed-top')
          .addClass('navbar-static-top')
          .show();
      });
    }
    is_nav_fixed = is_fixed;
  };
  
  var testScroll = function(){
    var _start_top, pagestart;
    try {
      _start_top = $('[rel="startpage"]').offset().top || 0;
      pagestart = _start_top + ($('[rel="startpage"]').height() || 0);
    }catch(e){
      pagestart = 0;
    }
    
    var scroll = $(window).scrollTop();
    if(!pagestart || !scroll){
      return false;
    }
    if(scroll > pagestart){
      set_fixed_navbar(true);
    }else{
      set_fixed_navbar(false);
    }
  }
  
  $(window).scroll(function (event) {
    testScroll();
  });

  /* 
   * Slider
   * ---------------------------------->
   */
  var sliding = function (current_slide, slides){
    for (var i=0; i<slides.length; i++){
      $(slides[i]).css('left', (i-current_slide)*100+'%');
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
    $(element).css('transform', 'translateZ(-160px) rotateY('+deg+'deg)');
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