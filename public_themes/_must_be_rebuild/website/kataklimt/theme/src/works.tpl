{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<div class="container">
		<div class="row">
			<h3>
				<div sup-editor-meta ng-model="meta.title"></div>
			</h3>
			<div sup-editor-media ng-model="meta.photo">
				<img class="thumbnail-img" ng-src="{{theme_url}}/img/bg270.png" style="background-image: url('{{meta.photo.src}}')">
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}