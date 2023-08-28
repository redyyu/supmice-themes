{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}

<div class="container">
	<div id="columns">
		<figure>
			<a sup-widget-media
         ng-model="meta.photo">
				<img ng-src="{{meta.photo.src}}">
			</a>
			<figcaption>
				<span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
			</figcaption>
		</figure>
	</div>
</div>
{% include '_footer_.tpl' %}