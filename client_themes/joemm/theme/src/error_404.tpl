{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}

<div class="container text-center error-404">
	<h1>
		<span sup-widget-text
          ng-model="meta.title"
          default="{{_('Error 404')}}"></span>
	</h1>
	<p>
		<span sup-widget-text
          ng-model="meta.description"
          default="{{_('Can not found the page')}}"></span>
	</p>
</div>