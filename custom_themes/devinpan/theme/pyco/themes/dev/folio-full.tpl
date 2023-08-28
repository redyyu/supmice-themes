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
	<div id="content">
		<div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span12">
				<h3>
					<span sup-editor-meta ng-model="meta.title"></span>
				</h3>
				</article>
				<div class="clear"></div>
				<ul class="thumbnails thumbnails-1"
				 sup-query="works"
				 ng-model="query.works">
					<li class="span3 box"
					 ng-repeat="w in query.works"
					 sup-widget-open
					 file="w">
						<a href="{{w.url}}" class="thumbnail thumbnail-1">
							<img class="thumbnail-img"
               ng-src="{{theme_url}}/img/bg270.png"
               style="background-image: 
                      url('{{w.featured_img.src | thumbnail}}')">
							<section>
								<strong>{{w.title}}</strong>
							</section>
						</a>
					</li>
				</ul>
				<div class="paginator">
					<a href="#" class="btn btn-danger btn-left">prev</a>
					<a href="#" class="btn btn-danger btn-right">next</a>
				</div>
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