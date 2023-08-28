if(navigator.languages && navigator.languages.length > 1){
  navigator_language = navigator.languages[0];
}else{
  navigator_language = navigator.language || navigator.userLanguage;
}

var userLang = navigator_language;
var userLocale = userLang.replace('-','_');

//fix old browser no console
if (!window.console) {
	window["console"] = {log: function(){}};
}

$(document).ready(function () {

  var top_offset = function(update){
    if (typeof this._offset !== 'number'){
      this._offset = 0;
    }
    if (update){
      // updated top offset
      this._offset = $('.masthead').height();
    }
    return this._offset;
  }

  // get top offset. also will update when resized.

  $('.navbar-collapse').collapse({toggle: false});
  // init collapse. otherwise will init when .collapse, event it is 'hide';


  //Parallax
  $('.parallax-link[href*=#]').click(function(e) {
    $('.navbar-collapse').collapse('hide');
    var target_top=0;
    var current_hash='';
    var loc_path = location.pathname.replace(/^\//,'');
    var loc_path_matched = loc_path == this.pathname.replace(/^\//,'');
    var hostname_matched = location.hostname == this.hostname;
    if (loc_path_matched && hostname_matched) {
      var target;

      var _go_first = $(this).hasClass('parallax-go-first');
      if(this.hash){
        current_hash = this.hash;
      }else if(_go_first){
        try {
          target = $('.content-block')[0];
        } catch(e) {
          target = null;
        }
        current_hash = '#'+target.id;
      }
      if (current_hash) {
        target = target ? $(target) : $(current_hash);
        target_top = target.offset().top - top_offset();
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

    e.preventDefault();
    return false;
  });

  var default_top_padding = parseInt($('.main-section').css('padding-top'));

  function resizeHandler(){
    top_offset(true);

    if ($('.main-section').length > 0){
      var win_height = $(window).height();
      var obj_height = $('.main-section > div').height() + top_offset();
      var new_height = (win_height < obj_height) ? obj_height : win_height;

      $('.main-section').css('min-height', new_height);

      // set brand top gap
      var gap = parseInt(Math.max((new_height - obj_height) * 0.5, 0));
      if (gap > default_top_padding){
        $('.main-section').css('padding-top', gap);
      } else {
        $('.main-section').css('padding-top', '');
      }
    }
  }

  //Resize
  resizeHandler();
  $(window).resize( function(){
    resizeHandler();
  });

});