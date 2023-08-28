{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<div id="content"><div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span12">
				<h3><div sup-widget-text
                 ng-model="meta.title"></div></h3>
				</article>
				<div class="clear"></div>
				<ul class="thumbnails thumbnails-1 list-services"
            sup-widget-series
            ng-model="meta.services">
					<li class="span4"
              series-item
              ng-repeat="item in meta.services">
						<div class="thumbnail thumbnail-1">
							<img class="thumbnail-img"
                   ng-src="{{theme_url}}/img/bg350.png"
                   style="background-image:{{'url('+item.src}}+')'}}" />
              <section>
								<h3>{{item.title}}</h3>
								<p class="line-clamp">{{item.caption}}</p>
							</section>
						</div>
					</li>
					<li class="span4"
              series-item-create>
						<div class="thumbnail thumbnail-1">
							<img class="thumbnail-img"
                   ng-src="{{theme_url}}/img/bg350.png"
                   style="background-image:{{'url('+item.src}}+')'}}" />
              <section>
								<h3>{{_('Create A Service')}}</h3>
								<p class="line-clamp">
                  {{_('Click here to add a service.')}}
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