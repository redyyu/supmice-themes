{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<!--============================== content =================================-->
	<div id="content">
		<div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span8">
					<div class="inner-1">
						<ul class="list-blog" sup-query="post" ng-model="query.post">
							<li ng-repeat="post in query.post"
							 sup-editor-open
							 file="post">
								<h3>{{post.title}}</h3>
								<time datetime="2012-11-09" class="date-1">{{meta.date_formatted}}</time>
								<div class="name-author">by <mark>{{post.author}}</mark></div>
								<div class="clear"></div>
								<img class="thumbnial-img" style="background-image: url('{{post.photo.src}}')" ng-src="{{theme_url}}/img/bg740.png">
								<p>{{post.article}}</p>
							</li>
						</ul>
					</div>
				</article>
				<article class="span4">
					<h3><div sup-editor-meta ng-model="meta.ctitle">{{meta.ctitle}}</div></h3>
					<ul class="list extra extra1" sup-editor-widget-collect ng-model="meta.categories">
						<li ng-repeat="item in meta.categories">
				           	<a href="#">{{item.content}}</a>
				           </li>
					</ul>
				</article>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}