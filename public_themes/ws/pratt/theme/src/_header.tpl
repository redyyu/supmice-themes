<!-- Fixed navbar -->
<div class="primary-nav navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle"
              data-toggle="collapse"
              data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">
         <b>{{site_meta.title}}</b>
      </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li ng-repeat="menu in menu.primary">
          <a href="{{menu.url}}"
             class="smothscroll {{menu.class}}"
             target="{{menu.target}}">
            {{menu.name}}
          </a>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>
