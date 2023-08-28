<!--============================== footer =================================-->
<footer>
	<div class="container clearfix">
		<ul class="list-social pull-right">
			<li ng-repeat="item in socials">
				<a class="icon-{{item.code}}" ng-href="{{item.url}}">{{item.title}}</a>
			</li>
		</ul>
		<div class="privacy pull-left">
			<p>{{site_meta.copyright}}</p>
		</div>
	</div>
</footer>