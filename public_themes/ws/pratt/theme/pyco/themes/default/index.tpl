<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.png'}}"></sup-set>

<sup-set ng-model="g.default_hero"
         value="{{theme_url+'/styles/hero.png'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<sup-set ng-model="g.img_holder_cover"
         value="{{theme_url+'/styles/trans_cover.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/css/bootstrap.css"
      rel="stylesheet">
<!-- plugins -->
<link ng-href="{{theme_url}}/libs/magnific-popup/magnific-popup.css"
      rel="stylesheet">

<!-- fonts -->
<link ng-href="{{theme_url}}/fonts/lato/lato.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/fonts/raleway/raleway.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/sup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
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


<section id="{{meta.slug}}">
  <div class="hero">
    <div class="container">

      <div class="row centered section-header">
        <div class="col-md-8 col-md-offset-2">
          <h1>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h1>
          <h2>
            <span sup-widget-text
                  ng-model="meta.subtitle"
                  default="{{_('Subtitle')}}"></span>
          </h2>
        </div>
      </div>

      <div class="row">

    		<div class="col-lg-2">
    			<h5>
            <span sup-widget-text
                  ng-model="meta.left_hint_title"
                  default="{{_('Hint goes here')}}"></span>
          </h5>
    			<p>
            <span sup-widget-text
                  ng-model="meta.left_hint"
                  default="{{_('$_HINT')}}"></span>
          </p>
    			<img class="hidden-xs hidden-sm hidden-md"
               ng-src="{{theme_url}}/styles/arrow1.png">
    		</div>

        <div class="col-lg-8 hero-imgbox">
          <div sup-widget-media
               ng-model="meta.hero">
            <img ng-src="{{g.img_holder_cover}}"
                 style="{{(meta.hero.src || g.default_hero)|bg_img}}"/>
          </div>
        </div>

    		<div class="col-lg-2">
    			<img class="hidden-xs hidden-sm hidden-md"
               ng-src="{{theme_url}}/styles/arrow2.png">
    			<h5>
            <span sup-widget-text
                  ng-model="meta.right_hint_title"
                  default="{{_('Hint goes here')}}"></span>
          </h5>
    			<p>
            <span sup-widget-text
                  ng-model="meta.right_hint"
                  default="{{_('$_HINT')}}"></span>
          </p>
    		</div>

      </div>

    </div>
  </div>
</section>

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           ng-repeat="page in segments"
           ng-if="page.template != meta.template">

  	<!-- Segments -->
    <div ng-if="page.template == 'page'">
      <div class="section-primary {{page.bg.class}}"
     style="{{page.bg.style}}">

  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row centered">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-bind-html="page.content"></div>
      </div>
    </div>

  </div>

</div>

    </div>
    <div ng-if="page.template == 'page-s1'">
      <div class="section-primary {{page.bg.class}}"
     style="{{page.bg.style}}">

  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row centered">
      <div class="col-md-6 centered">
        <img class="thumbnail-img"
             ng-src="{{page.featured_img.src||g.default_img}}"
             alt="{{page.featured_img.title}}" />
      </div>

      <div class="col-md-6 text-left">
        <div class="content"
             sup-bind-html="page.content"></div>
      </div>

    </div>

  </div>

</div>
    </div>
    <div ng-if="page.template == 'page-s2'">
      <div class="section-primary {{page.bg.class}}"
     style="{{page.bg.style}}">

  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row centered">

      <div class="col-md-6 text-right">
        <div class="content"
             sup-bind-html="page.content"></div>
      </div>

      <div class="col-md-6 centered">
        <img class="thumbnail-img"
             ng-src="{{page.featured_img.src||g.default_img}}"
             alt="{{page.featured_img.title}}" />
      </div>

    </div>

  </div>

</div>
    </div>
    <div ng-if="page.template == 'features'">
      <div class="section-primary features">
  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row centered">
      <div class="col-md-4 feature-item"
           ng-repeat="item in page.series">
        <div>
          <img class="img-holder {{item.class}}"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}">
          <h3 class="text-nowrap">{{item.title}}</h3>
          <p class="text-clamp-3">{{item.caption}}</p>
        </div>
      </div>
    </div>

  </div>
</div>
    </div>
    <div ng-if="page.template == 'portfolio'">
      <div class="section-primary portfolio">
  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="carousel slide portfolio-gallery">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li ng-repeat="i in page.carousel"
                ng-class="{'active':$first}"></li>
          </ol>
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item"
                 ng-repeat="item in page.carousel"
                 ng-class="{'active': $first}">
              <img class="contain-img img-holder-cover"
                   ng-src="{{g.img_holder_cover}}"
                   style="{{item.src|bg_img}}">
            </div>
          </div>

        </div>
      </div>
    </div>

  </div>
</div>
    </div>
  	<!-- #Segments -->

  </section>
  <section>
    <div>
      <div class="container">
        <div segment-create="major"></div>
      </div>
    </div>
  </section>
</div>

<div class="copyright">
  <div class="container centered">
    <p>
      <span sup-bind-html="site_meta.copyright"></span>
      <span sup-bind-html="site_meta.license"></span>
    </p>
  </div>
</div>