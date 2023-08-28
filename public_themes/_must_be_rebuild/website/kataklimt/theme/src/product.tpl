{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
  <div id="content" class="content-extra"><div class="ic"></div>
	<div class="row-1">
		<div class="container">
			<div class="row">
				<ul class="thumbnails thumbnails-1">
					<li class="span3">
						<div class="thumbnail thumbnail-1">
							<h3>
							  <div sup-editor-meta ng-model="meta.title"></div>
							</h3>
							<div sup-editor-media ng-model="meta.photo">
							  <img class="thumbnail-img" ng-src="{{theme_url}}/img/bg270x146.png" style="background-image: url('{{meta.photo.src}}')">
							</div>
							<section>
								<strong>
								  <div sup-editor-meta ng-model="meta.name"></div>
								</strong>
								<p>
								  <div sup-editor-meta ng-model="meta.description"></div>
								</p>
							</section>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}