<!-- Header -->
<header id="header"
        class="container">
	<div class="row">
		<div id="language"
         class="col-sm-3 pull-right"
         ng-if="languages">
			<a href="#"
         class="language-switcher-btn-disabled">
        <span class="language-switcher-text">{{_('Languages')}}</span>
      </a>
		</div>
		<div id="logo"
         class="col-sm-3">
			<a href="#">
        <img ng-src="{{site_meta.logo || g.logo}}"
             alt="{{ site_meta.title }}"/>
      </a>
		</div>

		<nav id="nav"
         class="col-sm-6">
			<ul>
				<li class="{{nav.class}}"
            ng-repeat="nav in menu.primary">
            <a href="#">{{nav.name}}</a>
        </li>
			</ul>
		</nav>
	</div>
</header>
<!-- #Header -->
