(function($) {
  "use strict";

  /* parallax */
  var runParallax = function (){
    var win_h = $(window).height();
    var win_scroll = $(window).scrollTop();

    $('.parallax-bg').each(function(){
      var offset_percent = ($(this).offset().top - win_scroll) / win_h;
      $(this).css({
        'background-position':'50% '+(offset_percent * 100)+'%'
      });
    });
  }

  var fadeLogo = function (){
    var scroll = $(document).scrollTop();
    var height =  $(document).height();
    $('.hero > div').css({
        'opacity': 1 - (scroll / height) * 10
    });
  }

  /* modal */
  $('.open-modal').magnificPopup({
    type: 'inline',
    showCloseBtn: false,
    preloader: false,
    removalDelay: 600,
    fixedContentPos: true,
    callbacks: {
      beforeOpen: function() {
        this.st.mainClass = this.st.el.attr('data-effect');
      }
    },
  });

  /* video */
  $('.open-video').magnificPopup({
    type: 'inline',
    showCloseBtn: true,
    preloader: false,
    removalDelay: 600,
    fixedContentPos: true,
    callbacks: {
      beforeOpen: function() {
        this.st.mainClass = this.st.el.attr('data-effect');
      },
      open: function() {
        var video_el = $('#MODAL-video video').get(0);
        if (video_el) {
          video_el.play();
        }
      },
      beforeClose: function() {
        var video_el = $('#MODAL-video video').get(0);
        if (video_el) {
          video_el.pause();
          video_el.currentTime = 0;
        }
      },
    },
  });

  /* gallery */
  $('.open-image').magnificPopup({
    type: 'image',
    preload: [0, 2],
    removalDelay: 600,
    closeBtnInside: false,
    fixedContentPos: true,
    gallery: {
      enabled: true,
      navigateByImgClick: true,
    },
    image: {
      verticalFit: true,
      tError: '404...',
      titleSrc: function(item) {
        return item.el.attr('title');
      }
    },
    callbacks: {
      beforeOpen: function() {
        this.st.image.markup = this.st.image.markup.replace(
          'mfp-figure', 'mfp-figure mfp-with-anim');
        this.st.mainClass = this.st.el.attr('data-effect');
        this.st.tLoading = this.st.el.attr('title');
      }
    }
  });


  /* history back */
  $('.history-back').on('click', function(){
    console.log(history);
    history.back();
    return false;
  });

  /* navbar collapse */
  $('.navbar').on('show.bs.collapse', function (e) {
    $(this).addClass('is-collapse');
  })
  $('.navbar').on('hidden.bs.collapse', function (e) {
    $(this).removeClass('is-collapse');
  })

  /* navbar affix */
  var toggleAffix = function() {
    var affix_element = $('[toggle-affix]');
    var offset = parseInt($('.hero').height() / 2) || 60;
    if ($(window).scrollTop() >= offset) {
        affix_element.addClass("affix");
    } else {
        affix_element.removeClass("affix");
    }
  };

  /* navbar inverted */
  var navbar_inverted = Boolean($('.hero.inverted').length);
  if (navbar_inverted) {
    $('#primary-header .navbar').addClass('inverted');
    $('.footer').addClass('inverted');
  }

  /* navigate */
  var hash_scroll_locked = false;
  var curr_hash = window.location.hash;
  var auto_hash = $('#primary-header').data('autoHash');
  var nav_offset = -$('#primary-header').height();

  var scrollToSection = function(hash) {
    curr_hash = hash;
    var pos_top;
    try {
        pos_top = $(hash).offset().top;
    } catch (e) {
        pos_top = 0;
    }
    hash_scroll_locked = true;
    $('html, body').stop().animate({
      scrollTop: pos_top + nav_offset
    }, 900, 'easeInOutSine', function(){
      hash_scroll_locked = false;
    });
  }

  var autoSectionHash = function() {
    if (hash_scroll_locked || !auto_hash){
      return;
    }
    $('.segment, .hero').each(function() {
      var sec_top = $(this).offset().top;
      var sec_bottom = $(this).offset().top + $(this).height();
      var win_offset = window.pageYOffset;
      if (sec_top < win_offset && sec_bottom > win_offset) {
        var hash = '#' + ($(this).attr('id') || '');
        if (hash != curr_hash) {
          curr_hash = hash;
          console.info('Navigate to:', curr_hash);
          try {
            history.replaceState({}, '', hash);
          } catch(err) {
            console.error(err);
          }
        }
      }
    });
  }

  var autoNavActive = function(){
    $('#primary-navbar .nav-item[data-hash]').each(function() {
      var target = (curr_hash || '#');
      var hash = $(this).data('hash');

      if (target == '#'){
        target = '#index';
      }
      if (hash == '#') {
        hash = '#index';
      }

      if (hash && hash == target) {
        $(this).addClass('active');
      } else {
        $(this).removeClass('active');
      }
    });
  }

  /* links */
  $('a[href^="#"]').on('click', function(e) {
    scrollToSection(this.hash);
    // closes the responsive menu after clicked.
    $('.navbar-collapse').collapse('hide');
  });

  $('.entrance').on('click', function(e) {
    scrollToSection('#' + $('.segment').attr('id'));
    // closes the responsive menu after clicked.
    $('.navbar-collapse').collapse('hide');
    return false;
  });

  $('.card.trigger').on('click', function(e) {
    if (e.target && e.target.tagName == 'A'){
      return false;
    } else {
      var link = $(this).find('a').attr('href');
      if (!link) {
        return false;
      }
      else if (link.indexOf('#') == 0) {
        scrollToSection(link);
      } else {
        window.location.href = link;
      }
      return false;
    }
  });


  /* init */
  toggleAffix();
  runParallax();
  autoNavActive();
  if (curr_hash) {
    scrollToSection(curr_hash);
  }


  /* listener */
  $(window).on('scroll', function() {
    autoSectionHash();
    autoNavActive();
    runParallax();
    fadeLogo();
  });
  $(window).on('scroll resize', function() {
    toggleAffix();
    nav_offset = -$('#primary-header').height();
  });

})(jQuery);
