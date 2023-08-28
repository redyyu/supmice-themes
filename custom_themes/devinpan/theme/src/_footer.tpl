<footer>
	<div class="container clearfix">
		<ul class="list-social pull-right">
			<li ng-repeat="item in socials">
				<a class="icon-{{item.code}}" ng-href="{{item.url}}">{{item.title}}</a>
			</li>
		</ul>
		<div class="privacy pull-left">
			<p>
			  <span ng-bind-html="site_meta.copyright"></span>
        <span ng-bind-html="site_meta.license"></span>
			</p>
		</div>
	</div>
</footer>