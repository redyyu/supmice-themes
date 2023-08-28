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
    <div class="container">
      <div class="row">
        <article class="span8">
          <div class="inner-1">
            <ul class="list-blog">
              <li>
                <h3>
                  <div sup-editor-meta ng-model="meta.title"
                       default="Title"></div>
                </h3>
                <time datetime="2012-11-09"
                 class="date-1">{{meta.date|date_formatted}}</time>
								<div class="name-author">
                  by <mark>{{meta.author}}</mark>
                </div>
                <div class="clear"></div>
                <div sup-editor-media ng-model="meta.featured_img">
                  <img class="thumbnial-img"
                   style="background-image: url('{{meta.featured_img.src}}')"
                   ng-src="{{theme_url}}/img/bg740.png">
                </div>
								<div sup-angular-wysiwyg ng-model="content">
									<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</div>
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
