<!-- Header -->
<header class="fixed-top position-absolute">
  <nav class="navbar navbar-expand-lg">

    <a class="navbar-brand"
       href="#">
      {{site_meta.title}}
    </a>

    <button class="btn icon-btn navbar-toggler"
            type="button">
      <svg width="24" height="24" viewBox="0 0 24 24"><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"/></svg>
    </button>

    <div id="primary-navbar"
         class="collapse navbar-collapse">
      <div class="d-flex flex-fill
                  justify-content-end
                  justify-content-lg-center">
        <ul class="navbar-nav">
          <li class="nav-item {{menu.class}}"
              ng-repeat="menu in menu.primary">
            <a class="nav-link"
               href="#"
               target="{{menu.target}}">{{menu.name}}</a>
          </li>
        </ul>
      </div>
    </div>

    <div class="navbar-aside">
      <button class="btn icon-btn"
              type="button"
              ng-if="languages.length">
        <svg width="20" height="20" viewBox="0 0 20 20"><path d="M9.991,1A9,9,0,1,0,19,10,8.9956,8.9956,0,0,0,9.991,1Zm6.237,5.4H13.573a14.0842,14.0842,0,0,0-1.242-3.204A7.2267,7.2267,0,0,1,16.228,6.4ZM10,2.836A12.6781,12.6781,0,0,1,11.719,6.4H8.281A12.6781,12.6781,0,0,1,10,2.836ZM3.034,11.8a7.04,7.04,0,0,1,0-3.6H6.076A14.8638,14.8638,0,0,0,5.95,10a14.8638,14.8638,0,0,0,.126,1.8Zm.738,1.8H6.427a14.0841,14.0841,0,0,0,1.242,3.204A7.1881,7.1881,0,0,1,3.772,13.6ZM6.427,6.4H3.772A7.1881,7.1881,0,0,1,7.669,3.196,14.0842,14.0842,0,0,0,6.427,6.4ZM10,17.164A12.6781,12.6781,0,0,1,8.281,13.6h3.438A12.6781,12.6781,0,0,1,10,17.164ZM12.106,11.8H7.894A13.2415,13.2415,0,0,1,7.75,10a13.1265,13.1265,0,0,1,.144-1.8h4.212A13.1265,13.1265,0,0,1,12.25,10,13.2415,13.2415,0,0,1,12.106,11.8Zm.225,5.004A14.0842,14.0842,0,0,0,13.573,13.6h2.655A7.2267,7.2267,0,0,1,12.331,16.804ZM13.924,11.8A14.8638,14.8638,0,0,0,14.05,10a14.8638,14.8638,0,0,0-.126-1.8h3.042a7.04,7.04,0,0,1,0,3.6Z"/></svg>
      </button>
    </div>
  </nav>
</header>
