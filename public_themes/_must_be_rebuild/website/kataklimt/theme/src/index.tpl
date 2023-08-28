{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<div class="container">
		<div class="row">
			<div class="span12">
				<!--============================== slider =================================-->
				<div class="flexslider">
					<ul class="">
						<li sup-editor-widget-gallery
						ng-model="meta.slides">
							<a href=""><img class="thumbnail-img" ng-src="{{theme_url}}/img/bg960.png" style="background-image: url('{{meta.slides[0].src}}')"></a>
						</li>
					</ul>
				</div>
				<span id="responsiveFlag"></span>
				<div class="block-slogan">
					<h2>
						<div sup-editor-meta ng-model="meta.subtitle"></div>
					</h2>
					<div>
						<p>
							<div sup-editor-meta ng-model="meta.description"></div>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--============================== content =================================-->

	<div id="content" class="content-extra"><div class="ic"></div>
		<div class="row-1">
			<div class="container">
				<div class="row">
					<ul class="thumbnails thumbnails-1"
					sup-query="product"
					ng-model="query.product">
						<li class="span3"
						ng-repeat="product in query.product"
						sup-editor-open
						file="product">
							<div class="thumbnail thumbnail-1">
								<h3>{{product.title}}</h3>
								<img class="thumbnail-img" ng-src="{{theme_url}}/img/bg270x146.png" style="background-image: url('{{product.photo.src}}')">
								<section>
									<strong>{{product.name}}</strong>
									<p>{{product.description}}</p>
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
							<img class="thumbnail-img" ng-src="{{theme_url}}/img/bg270x321.png" style="background-image: url('{{meta.lphoto.src}}')" />
						</figure>
						<div class="inner-1 overflow extra"
						sup-angular-wysiwyg
						ng-model="content">
							<p>I'm a photographer, I have a lot of good works. No matter which side I'm very professional. If you want to shoot only part of your photograph, contact I will not let you down.</p>
						</div>
					</div>
				</article>
				<article class="span6">
					<h3>
						<span sup-editor-meta ng-model="meta.rtitle"></span>
					</h3>
					<div>
						<ul class="list-photo" sup-query="works" ng-model="query.works" length="12">
							<li ng-repeat="works in query.works"
							sup-editor-open
							file="works">
								<a href="{{works.photo.src}}" class="magnifier">
									<img class="thumbnail-img" ng-src="{{theme_url}}/img/bg120x87.png" style="background-image: url('{{works.photo.src}}')"/>
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
