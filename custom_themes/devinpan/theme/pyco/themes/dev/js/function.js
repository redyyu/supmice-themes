jQuery(window).load(function() {
  jQuery("#content .row").preloader();
  jQuery('.magnifier').touchTouch();
  jQuery('.spinner').animate({'opacity':0},1000,'easeOutCubic',
    function (){jQuery(this).css('display','none')
  });
});

$(function(){

  // slider
  if($('.flexslider').length > 0){
  	timer = setTimeout(function(){
  		$('.flexslider').show();
  		clearTimeout(timer);
  	}, 1000);
  }

  // folio

	if ($('#portfolio').length > 0) {
    
		var paged = 1;
		var prepage = $('#portfolio').data('prepage') || 12;

		function refresh_portfolio_list(){
			$('#portfolio .box').each(function(idx, entry){
				if (idx < prepage*paged) {
					$(entry).show();
				}
			});
			if ($('#portfolio .box').length <= prepage*paged){
				$('.more').hide();
			}else{
			  $('.more').show();
			}
		}

		refresh_portfolio_list();

		$('.more').click(function(e){
			paged++;
			refresh_portfolio_list();
			return false;
		});
	}
});
