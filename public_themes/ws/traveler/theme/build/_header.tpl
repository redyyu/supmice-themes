<!-- Fixed navbar -->
<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">
        <img ng-src="{{site_meta.logo || g.logo}}" />
        <span>{{site_meta.title || _('Title')}}</span>
      </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary"
            class="{{menu|active:meta.path:match_nodes}}"
            ng-class="{'dropdown': menu.nodes.length}">
          <a href="#"
             class="navbar-item {{menu.class}}"
             ng-class="{'dropdown-toggle': menu.nodes.length}"
             target="{{menu.target}}">
            {{menu.name}}
            <span class="caret"
                  ng-if="menu.nodes.length"></span>
          </a>
        </li>
        <li class="language"
            ng-if="languages.length">
          <a class="popup-modal btn-lg"
             href="#">
            <span class="glyphicon glyphicon-globe"></span>
          </a>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>
