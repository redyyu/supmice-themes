<!--============================== header =================================-->
<header>
	<div class="container clearfix">
		<div class="row">
			<div class="span12">
				<div class="navbar navbar_">
					<div class="container">
						<h1 class="brand brand_">
							<a ng-href="{{menu.primary.link | url}}"><img class="logo-img" ng-src="{{site_meta.logo}}">{{site_meta.title}}</a>
						</h1>
						<a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
						<div class="nav-collapse nav-collapse_  collapse">
						 	<ul class="nav sf-menu">
								<li ng-repeat="menu in menu.primary">
									<a ng-href="{{menu.link | url}}">{{menu.title}}</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
