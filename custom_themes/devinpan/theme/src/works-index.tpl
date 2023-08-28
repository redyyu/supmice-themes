{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="bg-content">
	<div id="content">
		<div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span12">
				<h3>
					<span sup-widget-text
                ng-model="meta.title"></span>
				</h3>
				</article>
				<div class="clear"></div>
				<ul class="thumbnails thumbnails-1"
            sup-query="works"
            ng-model="query.works">
					<li class="span3 box"
              ng-repeat="w in query.works.contents"
              sup-widget-open="w">
						<a href="{{w.url}}" class="thumbnail thumbnail-1">
							<img class="thumbnail-img"
				           ng-src="{{theme_url}}/img/bg270.png"
				           style="background-image:
				                  {{'url('+(w.featured_img.src|thumbnail)+')'}}">
							<section class="folio-title">
								<div class="text-nowrap">{{w.title}}</div>
							</section>
						</a>
					</li>
				</ul>
				<div class="paginator">
					<a href="#" class="btn btn-danger btn-left">prev</a>
					&nbsp;&nbsp;
					<a href="#" class="btn btn-danger btn-right">next</a>
				</div>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}