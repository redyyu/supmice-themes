<!-- Navigation -->
<div id="navigation">
  <nav class="navbar navbar-custom" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button class="navbar-toggle collapsed"
                type="button"
                data-toggle="collapse"
                data-target="#primary-nav">
          <span class="sr-only">{{_('Toggle navigation')}}</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand site-logo">
          {{site_meta.title}}
        </a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="primary-nav">
        <ul class="nav navbar-nav navbar-right">
          <li ng-repeat="menu in menu.primary">
            <a class="{{menu.class}}"
               href="#">{{menu.name}}</a>
          </li>
        </ul>
      </div>
      <!-- /.Navbar-collapse -->
    </div>
  <!-- /.container -->
  </nav>
</div>
<!-- /Navigation -->
