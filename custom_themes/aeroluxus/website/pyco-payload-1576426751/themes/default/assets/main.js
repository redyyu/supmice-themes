(function($) {

	var	$window = $(window);
	var $body = $('body');
	var $wrapper = $('.wrapper');
	var $header = $('.primary-header');
	var $footer = $('.primary-footer');
	var $main = $('.main-body');
	var $main_articles = $main.children('article');
	var $overlay_menu = $('.overlay-menu');

	// Breakpoints.
	breakpoints({
		xlarge:   [ '1281px',  '1680px' ],
		large:    [ '981px',   '1280px' ],
		medium:   [ '737px',   '980px'  ],
		small:    [ '481px',   '736px'  ],
		xsmall:   [ '361px',   '480px'  ],
		xxsmall:  [ null,      '360px'  ]
	});

	// Play initial animations on page load.
	$window.on('load', function() {
		window.setTimeout(function() {
			$body.removeClass('is-preload');
		}, 100);
	});

	// Fix: Flexbox min-height bug on IE.
	if (browser.name == 'ie') {
		var flexboxFixTimeoutId;
		$window.on('resize.flexbox-fix', function() {
			clearTimeout(flexboxFixTimeoutId);
			flexboxFixTimeoutId = setTimeout(function() {
				if ($wrapper.prop('scrollHeight') > $window.height())
					$wrapper.css('height', 'auto');
				else
					$wrapper.css('height', '100vh');
			}, 250);
		}).triggerHandler('resize.flexbox-fix');
	}

	// Nav.
	var $nav = $header.children('nav');
	var $nav_li = $nav.find('li');

	// Add "middle" alignment classes if we're dealing with an even number of items.
	if ($nav_li.length % 2 == 0) {
		$nav.addClass('use-middle');
		$nav_li.eq( ($nav_li.length / 2) ).addClass('is-middle');
	}

	// Main.
	var	delay = 325;
	var locked = false;

	// Methods.
	$main._show = function(id, initial) {
		var $article = $main_articles.filter('#' + id);
		// No such article? Bail.
		if ($article.length == 0) {
			return;
		}

		// Background activation
		// var cover_img_src = $article.find('[cover-image]').attr('cover-image');
		// if (cover_img_src) {
		// 	$('.primary-bg .primary-bg-after')
		// 	.css('background-image', 'url('+cover_img_src+')');
		// }

		// overlay menu
		var sec_overlay_menu = $article.find('.section-overlay');
		if (sec_overlay_menu.length) {
			$overlay_menu.fadeIn();
			$overlay_menu.html(sec_overlay_menu.html());
			$main.addClass('overlay');
			$('.first.doc-section ').fadeIn();
			$overlay_menu.find('a').on('click', function(e){
				var target_doc = $(this).attr('href');
				$('.doc-section').hide();
				$(target_doc+'.doc-section ').fadeIn();
				e.preventDefault();
				e.stopPropagation();
			});
		} else {
			$overlay_menu.fadeOut();
			$main.removeClass('overlay');
		}

		// Handle lock.

		// Already locked? Speed through "show" steps w/o delays.
		if (locked || (typeof initial != 'undefined' && initial === true)) {

			// Mark as switching.
				$body.addClass('is-switching');
			// Mark as visible.
				$body.addClass('is-article-visible');
			// Deactivate all articles (just in case one's already active).
				$main_articles.removeClass('active');
			// Hide header, footer.
				$header.hide();
				$footer.hide();
			// Show main, article.
				$main.show();
				$article.show();
			// Activate article.
				$article.addClass('active');
			// Unlock.
				locked = false;
			// Unmark as switching.
				setTimeout(function() {
					$body.removeClass('is-switching');
				}, (initial ? 1000 : 0));
			return;
		}

		// Lock.
		locked = true;

		// Article already visible? Just swap articles.
		if ($body.hasClass('is-article-visible')) {
			// Deactivate current article.
			var $currentArticle = $main_articles.filter('.active');
					$currentArticle.removeClass('active');

			// Show article.
			setTimeout(function() {

				// Hide current article.
				$currentArticle.hide();
				// Show article.
				$article.show();
				// Activate article.
				setTimeout(function() {
					$article.addClass('active');
					// Window stuff.
					$window
					.scrollTop(0)
					.triggerHandler('resize.flexbox-fix');
					// Unlock.
					setTimeout(function() {
						locked = false;
					}, delay);
				}, 25);
			}, delay);

		} else { // Otherwise, handle as normal.

			// Mark as visible.
			$body.addClass('is-article-visible');

			// Show article.
			setTimeout(function() {
				// Hide header, footer.
				$header.hide();
				$footer.hide();

				// Show main, article.
				$main.show();
				$article.show();

				// Activate article.
				setTimeout(function() {
					$article.addClass('active');
					// Window stuff.
					$window.scrollTop(0).triggerHandler('resize.flexbox-fix');
					// Unlock.
					setTimeout(function() {
							locked = false;
						}, delay);
				}, 25);
			}, delay);

		}
	};

	$main._hide = function(addState) {
		var $article = $main_articles.filter('.active');

		// $('.primary-bg .primary-bg-after').css('background-image', '');

		// overlay-menu
		$overlay_menu.fadeOut();
		$main.removeClass('overlay');

		// Article not visible? Bail.
		if (!$body.hasClass('is-article-visible')){
			return;
		}

		// Add state?
		if (typeof addState != 'undefined' &&	addState === true){
			history.pushState(null, null, '#');
		}

		// Handle lock.

		// Already locked? Speed through "hide" steps w/o delays.
		if (locked) {
			// Mark as switching.
			$body.addClass('is-switching');
			// Deactivate article.
			$article.removeClass('active');
			// Hide article, main.
			$article.hide();
			$main.hide();
			// Show footer, header.
			$footer.show();
			$header.show();
			// Unmark as visible.
			$body.removeClass('is-article-visible');
			// Unlock.
			locked = false;
			// Unmark as switching.
			$body.removeClass('is-switching');
			// Window stuff.
			$window.scrollTop(0).triggerHandler('resize.flexbox-fix');
			return;
		}

		// Lock.
		locked = true;

		// Deactivate article.
		$article.removeClass('active');

		// Hide article.
		setTimeout(function() {
			// Hide article, main.
			$article.hide();
			$main.hide();

			// Show footer, header.
			$footer.show();
			$header.show();

			// Unmark as visible.
			setTimeout(function() {
				$body.removeClass('is-article-visible');
				// Window stuff.
				$window.scrollTop(0).triggerHandler('resize.flexbox-fix');
				// Unlock.
				setTimeout(function() {
					locked = false;
				}, delay);
			}, 25);
		}, delay);
	};

	// Articles.
	$main_articles.each(function() {
		var $this = $(this);
		// Close.
		$('<div class="close">Close</div>').appendTo($this)
		.on('click', function() {
			location.hash = '';
		});
		// Prevent clicks from inside article from bubbling.
		$this.on('click', function(event) {
			event.stopPropagation();
		});
	});

	// Events.
	$body.on('click', function(event) {
		// Article visible? Hide.
		if ($body.hasClass('is-article-visible')){
			$main._hide(true);
		}
	});

	$window.on('keyup', function(event) {
		switch (event.keyCode) {
			case 27:
				// Article visible? Hide.
				if ($body.hasClass('is-article-visible')){
					$main._hide(true);
				}
				break;

			default:
				break;
		}
	});

	$window.on('hashchange', function(event) {
		// Empty hash?
		if (location.hash == '' ||	location.hash == '#') {
			// Prevent default.
			event.preventDefault();
			event.stopPropagation();
			// Hide.
			$main._hide();

		} else if ($main_articles.filter(location.hash).length > 0) {
		// Otherwise, check for a matching article.
			// Prevent default.
			event.preventDefault();
			event.stopPropagation();
			// Show article.
			$main._show(location.hash.substr(1));
		}
	});

	// Scroll restoration.
	// This prevents the page from scrolling back to the top on a hashchange.
	if ('scrollRestoration' in history)
		history.scrollRestoration = 'manual';
	else {
		var	oldScrollPos = 0;
		var scrollPos = 0;
		var $htmlbody = $('html,body');

		$window.on('scroll', function() {
			oldScrollPos = scrollPos;
			scrollPos = $htmlbody.scrollTop();

		}).on('hashchange', function() {
			$window.scrollTop(oldScrollPos);
		});
	}

	// Scroll links.
	$('.list-menu a[href^="#"]').click(function(e){
		var target = $($(this).attr('href'));
		if (target.length) {
			$('html, body').animate({
        scrollTop: target.offset().top
    	}, 600);
		}
    return false;
	});

	// Mail form
	$('.mailform').on('submit', function(e){
		e.preventDefault();
		var action = $(this).attr('action');
		var subject = $(this).find('[name="subject"]').val();
		var name = $(this).find('input[name="name"]').val();
		var msg = $(this).find('textarea[name="message"]').val();
		var body = 'Name: '+name+'%0D%0AMessage:%0D%0A'+msg

		window.location.href = action+'?subject='+subject+'&body='+body;
	})


	// bg animate
	var slides = $('.primary-bg-slide');
	var duration = 1000;
	function bgAnimate(curr_idx, last_idx){
		if (last_idx){
			$(slides[last_idx]).fadeOut(duration);
		}
		$(slides[curr_idx]).fadeIn(duration);
		setTimeout(function(){
			var next_idx;
			if (curr_idx < slides.length - 1){
				next_idx = curr_idx + 1;
			} else {
				next_idx = 0;
			}
			bgAnimate(next_idx, curr_idx);
		}, 6000);
	}
	bgAnimate(0);

	// Initialize.

	// Hide main, articles.
	$main.hide();
	$main_articles.hide();

	// Initial article.
	if (location.hash != '' &&	location.hash != '#'){
		$window.on('load', function() {
			$main._show(location.hash.substr(1), true);
		});
	}

})(jQuery);