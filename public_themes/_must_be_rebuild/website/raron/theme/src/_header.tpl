<nav class="nav_wrapper">
  <div class="wrap">
    <div class="logo"><img ng-src="{{site_meta.logo || g.default_logo}}" alt="logo" /></div>
    <a href="#" class="header_toggle">Menu</a>
    <ul class="navigation">
      <li ng-repeat="m in menu.primary" class="scroll">
        <a ng-href="{{m.url}}">{{m.title}}</a>
      </li>
      <div class="clear"> </div>
    </ul>
    <div class="social_icons">
      <ul>
        <li ng-repeat="s in socials" class="{{s.code}}">
          <a href="{{s.url}}"><span> </span></a>
        </li>
      </ul>
    </div>
    <div class="clear"> </div>
  </div>
</nav>
