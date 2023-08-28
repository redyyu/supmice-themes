<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/assets/add.png'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<!-- webfonts -->
<link ng-href="{{res_url}}/font/lato/lato.css"
      rel="stylesheet"
      type="text/css">

<!-- bootstrap -->
<link ng-href="{{theme_url}}/assets/bootstrap.min.css"
      rel="stylesheet"
      type="text/css">

<!-- styles -->
<link ng-href="{{theme_url}}/assets/main.css"
      rel="stylesheet"
      type="text/css">

<!-- custom -->
<style ng-bind="theme_meta.styles"></style>

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

<div class="scroller position-absolute d-none d-md-block"
     toggle-affix>
  <a class="indicator active" href="#"></a>
  <a class="indicator" href="#"
     ng-repeat="x in [1,2,3]"></a>
</div>

<!-- Hero -->
<section class="parallax-bg hero {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div class="pb-4 parallax-fade">
    <h1>
      <a class="entrance" href="#"
         sup-widget-media
         ng-model="meta.logo"
         sup-ico-inset="top"
         style="{{meta.logo.src|bg_img}}">
        {{meta.logo.title || site_meta.title}}
      </a>
    </h1>
  </div>
</section>

<!-- page -->
<sup-template id="page">
  <div class="container">
    <div class="row justify-content-center">
      <article class="col-md-8 text-center">
        <header>
          <h2>{{page.title}}</h2>
        </header>
        <div sup-bind-html="page.content"></div>
      </article>
    </div>
  </div>
</sup-template>


<!-- page-column -->
<sup-template id="page-column">
  <div class="container">
    <div class="row">
      <article class="col-md">
        <header>
          <h2>{{page.title}}</h2>
        </header>
        <div sup-bind-html="page.content"></div>
      </article>
      <div class="col-md text-center">
        <figure>
          <img ng-src="{{page.featured_img.src || g.default_img}}" />
        </figure>
      </div>
    </div>
  </div>
</sup-template>


<!-- features -->
<sup-template id="features">
  <div class="container">
    <div class="row">
      <div class="col-md-4 text-center"
           ng-repeat="item in page.series">
        <div class="feature {{item.class}}">
          <div>
            <figure class="mx-auto mb-4">
              <img class="icon"
                   ng-src="{{g.trans}}"
                   style="{{item.src|bg_img}}"
                   alt="{{item.title}}" />
            </figure>
            <h2 class="title text-truncate">
              {{item.title || '&nbsp;'}}
            </h2>
            <p class="text-clamp-6">
              {{item.caption || '&nbsp;'}}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</sup-template>


<!-- portfolio -->
<sup-template id="portfolio">
  <div class="container"
       sup-query='works'
       perpage='8'
       ng-model="query.works">
    <div class="carousel slide portfolio">
      <ol class="carousel-indicators">
        <li class="{{$first ? 'active' : ''}}"
            ng-repeat="x in [1,2,3]"></li>
        <li class="more">
          <a href="#"></a>
        </li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="container">
            <div class="row media-gallery">
              <figure class="col-6 col-lg-3"
                      ng-repeat="item in query.works.contents">
                <a href="#">
                  <div class="flip">
                    <div class="text-truncate">
                      {{item.title || item.slug}}
                    </div>
                  </div>
                  <img ng-src="{{g.trans}}"
                       style="{{item.featured_img.src|thumbnail|bg_img}}" />
                </a>
              </figure>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</sup-template>

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}" class="segment"
           ng-repeat="page in segments"
           sup-load-template="page.template"
           import-with-context="{'g':g, 'page':page}"
           segment>
  </section>
  <section class="segment">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>
</div>

<!-- Footer -->
<footer class="footer container text-center">
  <span sup-bind-html="site_meta.copyright"></span>
  <span sup-bind-html="site_meta.license"></span>
</footer>
