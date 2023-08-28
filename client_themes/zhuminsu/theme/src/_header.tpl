<nav id="primary-nav"
     class="navbar navbar-default navbar-fixed-top"
     ng-class="{'affix': meta.template!='index'}">
  <div class="container-fluid">
  <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target="#primary-navbar">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">
           <img class="logo"
                ng-src="{{site_meta.logo}}"
                ng-if="site_meta.logo"/>
           {{site_meta.logo?'':site_meta.title}}
      </a>
    </div>

    <div class="collapse navbar-collapse" id="primary-navbar">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
             class="{{menu.class}}"
             target="{{menu.target}}">{{menu.title}}</a>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</nav>
