<sup-set ng-model="g.font_cdn" value="{{gfw?'fonts.useso.com':'fonts.googleapis.com'}}"></sup-set><sup-set ng-model="g.default_favicon" value="{{theme_url+'/img/default_favicon.png'}}"></sup-set><sup-set ng-model="g.default_img" value="{{theme_url+'/img/default_img.jpg'}}"></sup-set><sup-set ng-model="g.default_slide" value="{{theme_url+'/img/default_slide.jpg'}}"></sup-set><sup-set ng-model="g.default_highlight" value="{{theme_url+'/img/default_highlight.jpg'}}"></sup-set>
<link rel="stylesheet" ng-href="{{theme_url}}/styles/bootstrap.min.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/responsive.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/style.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/touchTouch.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/kwicks-slider.css" type="text/css" media="screen">
<style ng-bind="theme_meta.styles"></style>
<!--============================== header =================================-->
<header>
	<div class="container clearfix">
		<div class="row">
			<div class="span12">
				<div class="navbar navbar_">
					<div class="container">
						<h1 class="brand brand_">
							<a href="#">
                <img class="logo-img" ng-src="{{site_meta.logo}}">
                {{site_meta.title}}
              </a>
						</h1>
						<a class="btn btn-navbar btn-navbar_" 
               data-toggle="collapse" data-target=".nav-collapse_">
               Menu <span class="icon-bar"></span>
            </a>
						<div class="nav-collapse nav-collapse_  collapse">
						 	<ul class="nav sf-menu">
								<li ng-repeat="menu in menu.primary">
									<a ng-href="#">{{menu.title}}</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<div class="bg-content">
	<div class="container">
		<div class="row">
			<div class="span12">
				<!--============================== slider =================================-->
				<div class="flexslider" sup-editor-widget-gallery
         ng-model="meta.slides">
					<ul class="home-slides">
						<li class="flex-active-slide" ng-if="meta.slides.length > 0">
							<a href="#">
                <img class="thumbnail-img"
                 ng-src="{{theme_url}}/img/bg960.png" 
                 style="background-image: 
                        url('{{meta.slides[0].src}}')">
              </a>
						</li>
						<li class="flex-active-slide" ng-if="meta.slides.length == 0">
							<a href="#">
                <img class="thumbnail-img"
                 ng-src="{{theme_url}}/img/bg960.png" 
                 style="background-image: 
                        url('{{g.default_slide}}')">
              </a>
						</li>
					</ul>
				</div>
				<span id="responsiveFlag"></span>
				<div class="block-slogan">
					<h2>
						<div sup-editor-meta ng-model="meta.subtitle"
                 sup-ico-hide></div>
					</h2>
					<div>
						<p sup-editor-meta ng-model="meta.description"
               sup-ico-hide></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--============================== content =================================-->

	<div id="content" class="content-extra"><div class="ic"></div>
		<div class="row-1">
			<div class="container">
				<div class="row" sup-editor-widget-gallery
             ng-model="meta.highlights">
					<ul class="thumbnails thumbnails-1">
						<li class="span3" ng-repeat="item in meta.highlights">
							<div class="thumbnail thumbnail-1">
								<h3>{{item.title}}</h3>
								<img class="thumbnail-img"
                 ng-src="{{theme_url}}/img/bg270x146.png"
                 style="background-image: url('{{item.src}}')">
								<section>
									<p>{{item.caption}}</p>
								</section>
							</div>
						</li>
						<li class="span3" ng-if="meta.highlights.length == 0" 
                ng-repeat="item in [1,2,3,4]">
							<div class="thumbnail thumbnail-1">
								<h3>Title</h3>
								<img class="thumbnail-img"
                 ng-src="{{theme_url}}/img/bg270x146.png"
                 style="background-image: url('{{g.default_highlight}}')">
								<section>
									<p>
                    Click here to add highlights,
                    otherwise will not showing up on homepage.
                  </p>
								</section>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<article class="span6">
					<h3>
						<span sup-editor-meta ng-model="meta.ltitle"></span>
					</h3>
					<div class="wrapper">
						<figure class="img-indent" sup-editor-media ng-model="meta.lphoto">
							<img class="thumbnail-img"
               ng-src="{{theme_url}}/img/bg270x321.png"
               style="background-image: url('{{meta.lphoto.src}}')" />
						</figure>
						<div class="inner-1 overflow extra"
						sup-angular-wysiwyg
						ng-model="content">
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
						</div>
					</div>
				</article>
				<article class="span6">
					<h3>
						<span sup-editor-meta ng-model="meta.rtitle"></span>
					</h3>
					<div>
						<ul class="list-photo" sup-query="works"
                ng-model="query.works" length="12">
							<li ng-repeat="works in query.works" 
                  sup-widget-open file="works">
								<a href="{{works.featured_img.src}}" class="magnifier">
									<img class="thumbnail-img"
                   ng-src="{{theme_url}}/img/bg120x87.png"
                   style="background-image:
                          url('{{works.featured_img.src}}')"/>
								</a>
							</li>
						</ul>
					</div>
				</article>
			</div>
		</div>
	</div>
</div>
<!--============================== footer =================================-->
<footer>
	<div class="container clearfix">
		<ul class="list-social pull-right">
			<li ng-repeat="item in socials">
				<a class="icon-{{item.code}}" ng-href="{{item.url}}">{{item.title}}</a>
			</li>
		</ul>
		<div class="privacy pull-left">
			<p>{{site_meta.copyright}}</p>
		</div>
	</div>
</footer>
