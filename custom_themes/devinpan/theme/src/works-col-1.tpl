{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<div id="content">
		<div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span12">
					<div class="inner-1">
						<ul class="list-blog">
							<li>
								<h3>
									<span sup-widget-text
                        ng-model="meta.title"
                        default="title"></span>
								</h3>
								<time datetime="2012-11-09"
                      class="date-1">
                  {{meta.date|date_formatted}}
                </time>
								<div class="name-author">
                  by <mark>{{meta.author}}</mark>
                </div>
								<div class="clear"></div>
                <div sup-widget-media
                     ng-model="meta.featured_img">
								  <img ng-src="{{meta.featured_img.src || g.default_img}}">
                </div>
								<div sup-angular-wysiwyg ng-model="content">
									<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="attachments">
						<h5>Attachments</h5>
						<ul class="list-photo"
                sup-widget-series
                ng-model="meta.attachments">
							<li ng-repeat="item in meta.attachments"
                  series-item>
								<a class="magnifier" href="#">
									<img class="thumbnail-img"
                       ng-src="{{theme_url}}/img/bg120x87.png"
                       style="{{'background-image:url('+item.src+')'}}"/>
								</a>
							</li>
							<li series-item-create>
								<a class="magnifier" href="#">
									<img class="thumbnail-img"
                       ng-src="{{theme_url}}/img/bg120x87.png"
                       style="{{'background-image:url('
                                +theme_url+'/img/default_img.jpg)'}}"/>
								</a>
							</li>
						</ul>
					</div>
					<ul class="pmenu">
						<li><a href="#">Back</a></li>
					</ul>
				</article>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}