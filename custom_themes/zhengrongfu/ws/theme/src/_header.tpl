<!-- Header -->
<header class="fixed-top">
  <nav class="navbar navbar-expand-lg affix"
       toggle-affix>
    <div class="container-fluid">
      <a class="navbar-brand"
         href="#">
        {{site_meta.title}}
      </a>

      <button class="btn icon-btn navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#primary-navbar"
              aria-expanded="false"
              aria-label="{{_('Toggle navigation')}}">
        <svg width="24" height="24" viewBox="0 0 24 24"><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"/></svg>
      </button>

      <div id="primary-navbar"
           class="collapse navbar-collapse">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item {{menu.class}}"
              ng-repeat="menu in menu.primary">
            <a class="nav-link"
               target="{{menu.target}}"
               href="#">
              <span>{{menu.name}}</span>
              <div class="ico">
              {% include 'inc/navmark.inc' %}
              </div>
            </a>
          </li>
        </ul>
        <div class="navbar-aside">
          <button class="btn icon-btn open-modal"
                  type="button"
                  sup-widget-slot="ministore"
                  allow-fields="media">
            <span class="d-lg-none">{{_('Online Store')}}</span>
            <svg width="24" height="24" viewBox="0 0 24 24"><path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
          </button>
        </div>

      </div>
    </div>
  </nav>
</header>
