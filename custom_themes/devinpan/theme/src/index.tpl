{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="bg-content">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="flexslider"
             sup-widget-carousel
             default="{{[
               {
                 'title': 'Default Slide',
                 'src': g.default_slide
               },
             ]}}"
         		 ng-model="meta.slides">
					<ul class="home-slides">
						<li class="flex-active-slide">
							<a href="#">
                <img class="thumbnail-img"
                     ng-src="{{theme_url}}/img/bg960.png"
                     style="{{meta.slides[0].src|bg_img:g.default_slide}}">
              </a>
						</li>
					</ul>
				</div>
				<span id="responsiveFlag"></span>
				<div class="block-slogan">
					<h2>
						<div sup-widget-text
                 ng-model="meta.subtitle"
                 sup-ico-hide></div>
					</h2>
					<div>
						<p sup-widget-text
               ng-model="meta.description"
               sup-ico-hide></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="content" class="content-extra"><div class="ic"></div>
		<div class="row-1">
			<div class="container">
				<div class="row"
             sup-widget-series
             ng-model="meta.highlights">
					<ul class="thumbnails thumbnails-1">
						<li class="span3"
                series-item
                ng-repeat="item in meta.highlights">
							<div class="thumbnail thumbnail-1">
								<h3>{{item.title}}</h3>
								<img class="thumbnail-img"
			               ng-src="{{theme_url}}/img/bg270x146.png"
			               style="{{item.src|bg_img}}">
								<section>
									<p>{{item.caption}}</p>
								</section>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail thumbnail-1"
                   series-item-create>
								<h3>{{_('Add New Highlight')}}</h3>
								<img class="thumbnail-img"
			               ng-src="{{theme_url}}/img/bg270x146.png"
			               style="background-image:
                            url('img/default_hightlight.jpg')">
								<section>
									<p>{{_('Click here to add hightlights.')}}</p>
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
						<span sup-widget-text
                  ng-model="meta.ltitle"></span>
					</h3>
					<div class="wrapper">
						<figure class="img-indent"
                    sup-widget-media
                    ng-model="meta.lphoto">
							<img class="thumbnail-img"
	                 ng-src="{{theme_url}}/img/bg270x321.png"
	                 style="background-image: {{'url('+meta.lphoto.src+')'}}" />
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
						<span sup-widget-text
                  ng-model="meta.rtitle"></span>
					</h3>
					<div>
						<ul class="list-photo"
                sup-query="works"
                perpage="12"
                ng-model="query.works">
							<li ng-repeat="works in query.works.contents">
								<a href="{{works.featured_img.src}}"
                   class="magnifier">
									<img class="thumbnail-img"
           						 ng-src="{{theme_url}}/img/bg120x87.png"
                       style="background-image:
                              {{'url('+works.featured_img.src+')'}}"/>
								</a>
							</li>
						</ul>
					</div>
				</article>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}
