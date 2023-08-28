{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<!--============================== content =================================-->
	<div id="content"><div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span12">
				<h3><div sup-editor-meta ng-model="meta.title"></div></h3>
				</article>
				<div class="clear"></div>
				<ul class="thumbnails thumbnails-1 list-services"
				 sup-editor-widget-gallery ng-model="meta.gallery">
					<li class="span4" ng-repeat="item in meta.gallery">
						<div class="thumbnail thumbnail-1">
							<img class="thumbnail-img" ng-src="{{theme_url}}/img/bg350.png" style="background-image: url('{{item.src}}')">
							<section>
								<a href="#" class="link-1">{{item.title}}</a>
								<p class="line-clamp">{{item.caption}}</p>
							</section>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}