<!--============================== header =================================-->
<header>
	<div class="container clearfix">
		<div class="row">
			<div class="span12">
				<div class="navbar navbar_">
					<div class="container">
						<h1 class="brand brand_">
							<a href="#">
                <img class="logo-img" ng-src="{{site_meta.logo}}">
                {{site_meta.title}}
              </a>
						</h1>
						<a class="btn btn-navbar btn-navbar_"
               data-toggle="collapse"
               data-target=".nav-collapse_">
               {{_('Menu')}} <span class="icon-bar"></span>
            </a>
						<div class="nav-collapse nav-collapse_  collapse">
						 	<ul class="nav sf-menu">
								<li ng-repeat="menu in menu.primary"
                    class="{{menu.class}}">
									<a ng-href="#"
                     target="{{menu.target}}">{{menu.name}}</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
