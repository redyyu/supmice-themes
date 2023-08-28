<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<!-- webfonts -->
<link ng-href="{{res_url}}/font/roboto/roboto.css"
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
<style sup-bind-html="theme_meta.styles"></style>

<sup-body class="parallax-major" style="{{meta.hero.style}}"></sup-body>

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
               href="#">{{menu.name}}</a>
          </li>
        </ul>
        <div class="navbar-aside"
             ng-if="languages">
          <button class="btn icon-btn open-modal-language"
                  type="button"
                  data-mfp-src="#MODAL-language-switcher"
                  data-effect="mfp-slide-bottom">
            <svg width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zm6.93 6h-2.95c-.32-1.25-.78-2.45-1.38-3.56 1.84.63 3.37 1.91 4.33 3.56zM12 4.04c.83 1.2 1.48 2.53 1.91 3.96h-3.82c.43-1.43 1.08-2.76 1.91-3.96zM4.26 14C4.1 13.36 4 12.69 4 12s.1-1.36.26-2h3.38c-.08.66-.14 1.32-.14 2 0 .68.06 1.34.14 2H4.26zm.82 2h2.95c.32 1.25.78 2.45 1.38 3.56-1.84-.63-3.37-1.9-4.33-3.56zm2.95-8H5.08c.96-1.66 2.49-2.93 4.33-3.56C8.81 5.55 8.35 6.75 8.03 8zM12 19.96c-.83-1.2-1.48-2.53-1.91-3.96h3.82c-.43 1.43-1.08 2.76-1.91 3.96zM14.34 14H9.66c-.09-.66-.16-1.32-.16-2 0-.68.07-1.35.16-2h4.68c.09.65.16 1.32.16 2 0 .68-.07 1.34-.16 2zm.25 5.56c.6-1.11 1.06-2.31 1.38-3.56h2.95c-.96 1.65-2.49 2.93-4.33 3.56zM16.36 14c.08-.66.14-1.32.14-2 0-.68-.06-1.34-.14-2h3.38c.16.64.26 1.31.26 2s-.1 1.36-.26 2h-3.38z"/></svg>
          </button>
        </div>

      </div>
    </div>
  </nav>
</header>

<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}">
  <div sup-widget-bg
       ng-model="meta.hero"></div>
  <div>
    <h1>
      <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
    </h1>
    <h3 class="lead">
      <span sup-widget-text
            default="{{_('Description text here')}}"
            ng-model="meta.description"></span>
    </h3>
    <a class="entrance anim-fade-in-out"
       href="#">
      <svg width="48" heigth="48" viewBox="0 0 48 48"><path d="M14,24A10,10,0,1,1,24,34,10.0036,10.0036,0,0,1,14,24Zm10,6a6,6,0,1,0-6-6A6.0048,6.0048,0,0,0,24,30Z"/><path d="M19.41,40,24,44.58,28.59,40,30,41.41l-6,6-6-6Z"/></svg>
    </a>
  </div>
</section>

<!-- page -->
<sup-template id="page">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead"
          ng-show="!page.attrs.hide_description">
        {{page.description}}
      </h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-bind-html="page.content"></div>
    </div>
  </div>
</sup-template>


<!-- articles -->
<sup-template id="articles">
  <div class="container"
       sup-query='post'
       perpage='1'
       ng-model="query.posts">
    <div class="carousel text-carousel slide"
         ng-if="query.posts.contents.length">
      <ol class="carousel-indicators">
        <li class="{{$first ? 'active' : ''}}"
            ng-repeat="x in [1,2,3]"></li>
        <li class="more">
          <a href="#"
             aria-label="_('More')"></a>
        </li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active"
             ng-repeat="post in query.posts.contents">
          <header>
            <h2 class="text-truncate">{{post.title || _('Title')}}</h2>
            <h4 class="lead text-truncate">{{post.description}}</h4>
          </header>
          <div class="m-auto pb-1 text-center">
            <p class="excerpt text-clamp-3">{{post.excerpt}}</p>
            <a class="mt-2 btn btn-sm btn-link"
               href="#">{{_('Read Detail')}}</a>
          </div>
        </div>
      </div>
    </div>
    <p class="text-center text-muted"
       ng-if="!query.posts.contents.length">
      {{_('There is no post yet.')}}
    </p>
  </div>
</sup-template>


<!-- features -->
<sup-template id="features">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>

    <div class="row">
      <div class="col-lg-3 col-md-6"
           ng-repeat="item in page.series">
        <div class="p-3 text-center {{item.class}}">
          <figure class="w-50 py-1 m-auto">
            <img class="rounded-circle thumbnail"
                 ng-src="{{g.trans}}"
                 style="{{item.src|bg_img}}" />
          </figure>
          <h5 class="text-truncate title">
            {{item.title || _('Feature Title')}}
          </h5>
          <p class="text-clamp-4">
            {{item.caption || _('Description text here')}}
          </p>
        </div>
      </div>
    </div>

  </div>
</sup-template>


<!-- services -->
<sup-template id="services">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>

    <div class="row">
      <div class="col-lg-3 col-md-6 mb-3"
           ng-repeat="item in page.series">
        <div class="p-3 card trigger border-0 text-center {{item.class}}">
          <figure class="m-auto">
            <img class="avatar"
                 ng-src="{{g.trans}}"
                 style="{{item.src|bg_img}}" />
          </figure>
          <div class="card-body">
            <h5 class="text-truncate card-title">
              {{item.title || _('Service Title')}}
            </h5>
            <p class="text-clamp-4 card-text">
              {{item.caption || _('Description text here')}}
            </p>
            <a class="btn btn-sm btn-link text-secondary"
               href="#">{{_('Learn More')}}</a>
          </div>
        </div>
      </div>
    </div>

  </div>
</sup-template>


<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           class="segment {{page.bg.class}}"
           style="{{page.bg.style}}"
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

<footer class="footer">
  <div class="container">
    <div class="pt-4 pb-2">
      <img class="logo"
           ng-if="meta.logo.src || site_meta.logo"
           ng-src="{{meta.logo.src || site_meta.logo}}" />
      <div ng-if="!meta.logo.src && !site_meta.logo">
        <svg class="logo" width="100" height="50" viewBox="0 0 80 40"><path d="M78.3814,14.4273a6.16,6.16,0,0,0-1.3649-2.137,5.8038,5.8038,0,0,0-2.0353-1.3181,6.9505,6.9505,0,0,0-2.5271-.4522,7.833,7.833,0,0,0-3.33.7331,8.6345,8.6345,0,0,0-1.9607,1.2539l.2994-1.5348a3.0549,3.0549,0,0,0-1.2944-.2963,3.5466,3.5466,0,0,0-2.2618.8892,8.8565,8.8565,0,0,0-2.0277,2.5424V12.267a1.4131,1.4131,0,0,0-.4213-1.1466,1.7748,1.7748,0,0,0-1.17-.3509H57.7919l-.3949,3.25c-.012-.0451-.0207-.0946-.0334-.1387a5.4365,5.4365,0,0,0-.9359-1.9108A3.64,3.64,0,0,0,55,10.8709a4.6257,4.6257,0,0,0-1.8252-.351,5.3359,5.3359,0,0,0-2.9011.8579A9.2214,9.2214,0,0,0,47.81,13.7331V12.267a1.4128,1.4128,0,0,0-.4214-1.1466,1.7739,1.7739,0,0,0-1.17-.3509H43.7229l-.4262,3.5413A6.1235,6.1235,0,0,0,41.9839,12.29a5.805,5.805,0,0,0-2.0356-1.3181,6.95,6.95,0,0,0-2.527-.4522,7.8333,7.8333,0,0,0-3.33.7331,8.7114,8.7114,0,0,0-2.7842,2.0433,9.524,9.524,0,0,0-1.3451,1.9156,6.6233,6.6233,0,0,0-.2459-.7847,6.16,6.16,0,0,0-1.3648-2.137,5.805,5.805,0,0,0-2.0356-1.3181,6.95,6.95,0,0,0-2.5269-.4522,7.833,7.833,0,0,0-3.33.7331,8.7114,8.7114,0,0,0-2.7842,2.0433,9.8892,9.8892,0,0,0-1.847,2.9679,4.4072,4.4072,0,0,0-.6721-.9246,5.4834,5.4834,0,0,0-1.3259-1.0139,14.375,14.375,0,0,0-1.513-.7174q-.772-.312-1.5052-.5772a9.4263,9.4263,0,0,1-1.318-.5849,3.1884,3.1884,0,0,1-.9359-.7409,1.5772,1.5772,0,0,1-.351-1.0451A3.0314,3.0314,0,0,1,8.3856,9.6a2.3131,2.3131,0,0,1,.5382-.8422,2.4905,2.4905,0,0,1,.8969-.5616,3.5568,3.5568,0,0,1,1.2556-.2028,3.5991,3.5991,0,0,1,1.3571.234,6.4543,6.4543,0,0,1,1.0216.5147q.4446.2808.8034.5147a1.3043,1.3043,0,0,0,.7174.234,1.19,1.19,0,0,0,.6474-.1715,1.992,1.992,0,0,0,.5382-.546l1.5285-2.09a5.8779,5.8779,0,0,0-1.1074-1.0684,7.6569,7.6569,0,0,0-1.4507-.85,8.7888,8.7888,0,0,0-1.7079-.5615A8.6457,8.6457,0,0,0,11.5442,4a8.6574,8.6574,0,0,0-3.4.64A7.8642,7.8642,0,0,0,5.57,6.3552,7.555,7.555,0,0,0,3.94,8.8275a7.6318,7.6318,0,0,0-.5693,2.9091,6.0827,6.0827,0,0,0,.351,2.2072A4.6322,4.6322,0,0,0,5.9446,16.455a12.7,12.7,0,0,0,1.4974.6629q.7639.2808,1.4975.5225a7.8307,7.8307,0,0,1,1.3024.5538,2.6624,2.6624,0,0,1,.92.7643,2.3944,2.3944,0,0,1,.3683,1.1387,2.714,2.714,0,0,1-.79,2.3006A3.1009,3.1009,0,0,1,8.55,23.17a3.8959,3.8959,0,0,1-1.63-.3042,6.611,6.611,0,0,1-1.1621-.6706q-.4995-.3663-.9124-.6707a1.42,1.42,0,0,0-.85-.3042,1.4009,1.4009,0,0,0-.6552.1717,1.5762,1.5762,0,0,0-.53.4367L1,24.2a6.4987,6.4987,0,0,0,1.3258,1.2166,9.6931,9.6931,0,0,0,1.6924.9437,10.2813,10.2813,0,0,0,1.903.6161,9.1459,9.1459,0,0,0,1.9732.2183,9.15,9.15,0,0,0,3.5641-.6629,8.0766,8.0766,0,0,0,2.6906-1.7938,7.705,7.705,0,0,0,1.2915-1.7714c.035.1069.0648.2178.1046.3208a6.066,6.066,0,0,0,1.3571,2.137,5.7844,5.7844,0,0,0,2.0433,1.3181,7.0115,7.0115,0,0,0,2.5346.4522,7.7674,7.7674,0,0,0,3.33-.7409,8.76,8.76,0,0,0,2.7842-2.0588,9.6406,9.6406,0,0,0,1.3374-1.9088,6.7042,6.7042,0,0,0,.2457.8012,6.066,6.066,0,0,0,1.3571,2.137,5.7844,5.7844,0,0,0,2.0433,1.3181,7.0121,7.0121,0,0,0,2.5347.4522,7.7673,7.7673,0,0,0,3.33-.7409,8.758,8.758,0,0,0,2.7841-2.0588,9.47,9.47,0,0,0,1.0187-1.3514l-1.3086,10.874h4.7762l.88-7.9238a4.84,4.84,0,0,0,1.4038.8734,4.716,4.716,0,0,0,1.8093.3275,5.7521,5.7521,0,0,0,2.9871-.85,8.7737,8.7737,0,0,0,2.5192-2.3007,11.1521,11.1521,0,0,0,1.0837-1.7856l-.5695,4.6868h4.7419l.8734-7.2686A8.4748,8.4748,0,0,1,62.9472,16.19a2.7525,2.7525,0,0,1,2.1056-1.0827,10.8259,10.8259,0,0,0-.6238,1.3011,10.6917,10.6917,0,0,0-.71,3.9541,8.0756,8.0756,0,0,0,.4914,2.9246,6.0684,6.0684,0,0,0,1.3569,2.137,5.7865,5.7865,0,0,0,2.0436,1.3181,7.0105,7.0105,0,0,0,2.5347.4522,7.7675,7.7675,0,0,0,3.33-.7409A8.76,8.76,0,0,0,76.26,24.3945a10.0531,10.0531,0,0,0,1.9108-3.12,10.6108,10.6108,0,0,0,.71-3.923A7.9662,7.9662,0,0,0,78.3814,14.4273ZM25.138,19.793a7.7654,7.7654,0,0,1-.6864,1.9809,3.9813,3.9813,0,0,1-1.0839,1.3415,2.32,2.32,0,0,1-1.4507.4913,1.6824,1.6824,0,0,1-1.5519-.772,4.9639,4.9639,0,0,1-.4759-2.5036,11.6017,11.6017,0,0,1,.2419-2.4177,7.6282,7.6282,0,0,1,.6862-1.9809,4.001,4.001,0,0,1,1.0841-1.3337,2.3188,2.3188,0,0,1,1.4506-.4913,1.6935,1.6935,0,0,1,1.552.7565,4.9553,4.9553,0,0,1,.4758,2.5191A11.5085,11.5085,0,0,1,25.138,19.793Zm13.6326,0a7.7692,7.7692,0,0,1-.6863,1.9809A3.9827,3.9827,0,0,1,37,23.1154a2.32,2.32,0,0,1-1.4507.4913,1.6824,1.6824,0,0,1-1.5519-.772,4.9639,4.9639,0,0,1-.4759-2.5036,11.6085,11.6085,0,0,1,.2419-2.4177,7.6319,7.6319,0,0,1,.6862-1.9809,4.0022,4.0022,0,0,1,1.0841-1.3337,2.3188,2.3188,0,0,1,1.4506-.4913,1.6938,1.6938,0,0,1,1.5521.7565,4.9565,4.9565,0,0,1,.4757,2.5191A11.5085,11.5085,0,0,1,38.7706,19.793ZM52.6062,19.52a8.2434,8.2434,0,0,1-.8034,2.0822,4.953,4.953,0,0,1-1.2244,1.4741,2.4485,2.4485,0,0,1-1.5522.5615,3.8814,3.8814,0,0,1-1.0528-.156,2.8361,2.8361,0,0,1-1.006-.5147l.4835-3.8995a11.3737,11.3737,0,0,1,.7409-1.903,9.69,9.69,0,0,1,.9514-1.5521,4.8663,4.8663,0,0,1,1.0529-1.0449,1.8385,1.8385,0,0,1,1.0452-.3822,1.3739,1.3739,0,0,1,1.201.7019,4.2731,4.2731,0,0,1,.4524,2.246A9.938,9.938,0,0,1,52.6062,19.52Zm21.1972.2729a7.7769,7.7769,0,0,1-.6864,1.9809,3.9837,3.9837,0,0,1-1.0839,1.3415,2.32,2.32,0,0,1-1.4508.4913,1.6827,1.6827,0,0,1-1.5519-.772,4.9651,4.9651,0,0,1-.4758-2.5036,11.6017,11.6017,0,0,1,.2419-2.4177,7.6282,7.6282,0,0,1,.6863-1.9809,3.9983,3.9983,0,0,1,1.084-1.3337,2.3185,2.3185,0,0,1,1.4507-.4913,1.6937,1.6937,0,0,1,1.5519.7565,4.9551,4.9551,0,0,1,.4759,2.5191A11.5084,11.5084,0,0,1,73.8034,19.793Z"/></svg>
      </div>
    </div>
    <div class="certificate">
      <p sup-bind-html="site_meta.copyright"></p>
      <p sup-bind-html="site_meta.license"></p>
    </div>
  </div>
</footer>


