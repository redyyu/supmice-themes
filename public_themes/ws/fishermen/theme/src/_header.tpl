<header class="masthead">
  <nav class="container nav-primary">
    <div class="navbar">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <div class="navbar-brand">
          {{site_meta.title}}
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li ng-repeat="nav in menu.primary">
            <a href="#" class="parallax-link {{nav.meta.class}}">
              {{nav.name}}
            </a>
          </li>
          <li ng-if="languages.length">
            <a href="#" class="language">
              <span class="language-switcher-text">
                {{_('Languages')}}
              </span>&nbsp;<span class="caret"></span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>