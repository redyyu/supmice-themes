<!-- logo -->
<header class="container logo">
  <img ng-src="{{g.img_holder}}"
       class="img-responsive center-block"
       style="{{(site_meta.logo || g.logo)|bg_img}}"
       alt="{{site_meta.title}}" />
</header>
<!-- /logo -->

<!-- navbar -->
<nav class="navbar">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target="#primary-navbar"
              aria-expanded="false">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="primary-navbar">
      <ul class="nav navbar-nav">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
             class="{{menu.class}}"
             target="{{menu.target}}">
            {{menu.name}}
          </a>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>
<!-- /navbar -->