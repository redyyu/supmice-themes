<!-- Navigation -->
<nav class="navbar navbar-custom navbar-fixed-top affix">
  <div class="container">
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle"
              data-toggle="collapse"
              data-target=".navbar-collapse">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand page-scroll"
         href="{{base_url}}">
        <span class="glyphicon glyphicon-asterisk"></span>
        {{site_meta.title}}
      </a>
    </div>

    <div class="collapse navbar-collapse navbar-right">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a class="page-scroll {{menu.class}}"
             href="#"
             target="{{menu.target}}">{{menu.name}}</a>
        </li>
        <li class="language"
            ng-if="translates">
          <a class="pop-modal"
             href="#">
            <span class="glyphicon glyphicon-globe"></span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
