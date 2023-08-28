{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<div id="content"><div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span12">
				<h3><div sup-editor-meta ng-model="meta.title"></div></h3>
				</article>
				<div class="clear"></div>
				<ul class="portfolio clearfix" sup-query="works" ng-model="query.works">
					<li class="box" ng-repeat="works in query.works"
					 sup-editor-open
					 file="works">
						<a href="{{works.photo.src}}" class="magnifier">
							<img class="thumbnail-img" ng-src="{{theme_url}}/img/bg270.png" style="background-image: url('{{works.photo.src}}')">
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}