{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="bg-content">
	<div id="content">
		<div class="ic"></div>
		<div class="container">
			<div class="row">
				<h1><div sup-widget-text ng-model="meta.title"></div></h1>
				<div sup-angular-wysiwyg ng-model="content">
					<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum delenit augue duis dolore te feugait nulla facilisi.</p>
				</div>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}