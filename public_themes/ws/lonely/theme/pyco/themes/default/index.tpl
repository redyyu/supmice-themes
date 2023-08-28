<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css"
      rel="stylesheet">

<!-- plugins -->
<link ng-href="{{theme_url}}/styles/animate.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/nivo-lightbox.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/nivo-lightbox-theme/default/default.css}}"
      rel="stylesheet"/>

<!-- font awesome -->
<link ng-href="{{theme_url}}/styles/font-awesome/css/font-awesome.min.css"
      rel="stylesheet">

<!-- plugins -->
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/palette.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/editor.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>

<section id="{{meta.slug}}"
         class="intro {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="slogan">
    <div sup-widget-media
         ng-model="meta.logo">
      <img ng-src="{{meta.logo.src || site_meta.logo.src || g.logo}}"
           alt="{{meta.title}}" />
    </div>
    <div class="page-scroll">
      <a href="#">
        <i class="fa fa-angle-down fa-5x animated"></i>
      </a>
    </div>
  </div>

</section>

<div sup-widget-segments ng-model="segments">
  <div ng-repeat="page in segments">
    <div ng-if="page.template == 'page'">
      <section id="{{page.slug}}"
         class="primary-section"
         ng-class="{'bg-white': $odd,
                    'bg-gray': $even}">
  <div class="container" segment>
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2 sup-bind-html="page.title"></h2>
      </div>
      <p class="wow bounceInUp"
         sup-bind-html="page.description"></p>
    </header>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div sup-bind-html="page.content"
             class="content"></div>
      </div>
    </div>
  </div>
</section>

    </div>
    <div ng-if="page.template == 'page-s1'">
      <section id="{{page.slug}}"
         class="primary-section"
         ng-class="{'bg-white': $odd,
                    'bg-gray': $even}">
  <div class="container" segment>
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2 sup-bind-html="page.title"></h2>
      </div>
      <p class="wow bounceInUp"
         sup-bind-html="page.description"></p>
    </header>
    <div class="row">
      <div class="col-md-6">
        <div sup-bind-html="page.content"
             class="content"></div>
      </div>
      <div class="col-md-6 text-center">
        <div>
          <img ng-src="{{page.featured_img.src || g.default_img}}"
               alt="{{page.featured_img.title}}"/>
        </div>
      </div>
    </div>
  </div>
</section>

    </div>
    <div ng-if="page.template == 'page-s2'">
      <section id="{{page.slug}}"
         class="primary-section"
         ng-class="{'bg-white': $odd,
                    'bg-gray': $even}">
  <div class="container" segment>
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2 sup-bind-html="page.title"></h2>
      </div>
      <p class="wow bounceInUp"
         sup-bind-html="page.description"></p>
    </header>
    <div class="row">
      <div class="col-md-6 text-center">
        <div>
          <img ng-src="{{page.featured_img.src || g.default_img}}"
               alt="{{page.featured_img.title}}"/>
        </div>
      </div>
      <div class="col-md-6">
        <div sup-bind-html="page.content"
             class="content"></div>
      </div>
    </div>
  </div>
</section>

    </div>
    <div ng-if="page.template == 'album'">
      <section id="{{page.slug}}"
         class="primary-section text-center album"
         ng-class="{'bg-white': $odd,
                    'bg-gray': $even}">
  <div class="container" segment>
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2 sup-bind-html="page.title"></h2>
      </div>
      <p class="wow bounceInUp"
         sup-bind-html="page.description"></p>
    </header>
    <div class="row">

      <div class="col-sm-6 col-md-3 text-center item"
           ng-repeat="item in page.series">
        <div>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|thumbnail|bg_img}}" />
          </a>
        </div>
      </div>

    </div>

  </div>
</section>

    </div>
    <div ng-if="page.template == 'features'">
      <section id="{{page.slug}}"
         class="primary-section parallax features {{page.bg.class}}"
         style="{{page.bg.style}}">
  <div class="container" segment>
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2 sup-bind-html="page.title"></h2>
      </div>
      <p class="wow bounceInUp"></p>
    </header>
    <div class="row">

      <div class="col-sm-6 col-md-3 text-center item"
           ng-repeat="item in page.series">
        <figure class="icon">
          <img class="icon img-responsive"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}">
          <figcaption class="info text-clamp-2">
            <p>{{item.title}}</p>
          </figcaption>
        </figure>
      </div>

    </div>
  </div>
</section>
    </div>
  </div>

  <section class="primary-section text-center">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>
</div>

<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-12">
        <p>
          <span sup-bind-html="site_meta.copyright"></span>
          <span sup-bind-html="site_meta.license"></span>
        </p>
      </div>
    </div>
  </div>
</footer>
