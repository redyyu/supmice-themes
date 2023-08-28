{% import 'g.tpl' %}
<div class="wrapper">
	<div class="container clearfix">
		<h1>
			<span sup-editor-meta default="{{_('Title')}}" ng-model="meta.title"></span>
		</h1>
		<div class="date">
			{{meta.date_formatted}}
		</div>
		<div class="date">
			{{meta.author}}
		</div>
		<div class="featured text-center" sup-editor-media ng-model="meta.featured_img">
			<img ng-src="{{meta.featured_img.src}}">
		</div>
		<article class="content clearfix">
			<div default="{{_('$_CONTENT')}}" sup-angular-wysiwyg ng-model="content"></div>
		</article>
	</div>
	{% include '_footer.html' %}
</div>