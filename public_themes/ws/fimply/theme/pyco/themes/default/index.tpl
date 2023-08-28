<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<!-- bootstrap -->
<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/bootstrap.min.css">

<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/animate.css">

<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/owl.carousel.css">
<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/owl.transitions.css">
<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/owl.theme.css">

<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/style.css">

<!-- Custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
<nav id="primary-nav"
     class="navbar navbar-default navbar-fixed-top sticky">
  <div class="container-fluid">
  <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target=".primary-navbar">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">{{site_meta.title}}</a>
    </div>

    <div class="collapse navbar-collapse primary-navbar">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a href="{{menu.url}}"
             class="page-scroll {{menu.class}}"
             target="{{menu.target}}">{{menu.name}}</a>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</nav>

<section id="{{meta.slug}}"
         class="carousel fade-carousel slide"
         sup-widget-carousel="major"
         default="{{[
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-01.jpg'
           },
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-02.jpg'
           },
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-03.jpg'
           },
         ]}}"
         ng-model="meta.carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li ng-repeat="item in meta.carousel"
        ng-class="{'active': $first}">
    </li>
  </ol>
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item slides active">
      <div class="slide"
           style="{{meta.carousel[0].src|bg_img}}">
      </div>
      <div class="hero">
        <header>
          <h1>{{meta.carousel[0].title}}</h1>
          <h3>{{meta.carousel[0].caption}}</h3>
        </header>
      </div>
    </div>
  </div>
</section>

<div sup-widget-segments ng-model="segments">

  <div ng-repeat="page in segments">
    <div ng-if="page.template == 'page'">
      <section id="{{page.slug}}"
         class="common">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>
    <article>
      <div class="content"
           sup-bind-html="page.content"></div>
    </article>
  </div>
</section>
    </div>
    <div ng-if="page.template == 'page-s1'">
      <section id="{{page.slug}}"
         class="common">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>
    <div class="row">
      <div class="col-md-7">
        <article>
          <div class="content"
               sup-bind-html="page.content"></div>
        </article>
      </div>
      <div class="col-md-5">
        <aside>
          <figure>
            <img ng-src="{{page.featured_img.src||g.default_img}}"
                 alt="{{page.featured_img.title}}"/>
          </figure>
        </aside>
      </div>
    </div>

  </div>
</section>
    </div>
    <div ng-if="page.template == 'page-s2'">
      <section id="{{page.slug}}"
         class="common">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>
    <div class="row">
      <div class="col-md-5">
        <aside>
          <figure>
            <img ng-src="{{page.featured_img.src||g.default_img}}"
                 alt="{{page.featured_img.title}}"/>
          </figure>
        </aside>
      </div>
      <div class="col-md-7">
        <article>
          <div class="content"
               sup-bind-html="page.content"></div>
        </article>
      </div>
    </div>

  </div>
</section>
    </div>
    <div ng-if="page.template == 'portfolio'">
      <section id="{{page.slug}}"
         class="complex">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>

    <div class="row">

      <div class="folio col-md-3 col-sm-6"
           ng-repeat="item in page.series">
        <div>
          <div class="folio-wrapper">
            <a href="#"
               class="img-popup">
              <img class="thumbnail-img"
                   ng-src="{{theme_url}}/styles/trans_cover.png"
                   alt="{{item.title}}"
                   style="{{item.src|bg_img}}" />
            </a>
            <div class="label">
              <div class="label-text text-nowrap">
                {{item.title}}
              </div>
              <div class="label-bg"></div>
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
  <div class="tagline">
    <div class="container">
      <h2 sup-bind-html="page.tagline"></h2>
    </div>
  </div>
</section>

    </div>
    <div ng-if="page.template == 'services'">
      <section id="{{page.slug}}"
         class="complex">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>

    <div class="row">

      <div class="service col-md-3 col-sm-6"
           ng-repeat="item in page.series">
        <div class="text-center">
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/styles/trans_cover.png"
               style="{{item.src|bg_img}}">
          <h2 class="text-nowrap">{{item.title}}</h2>
          <p class="caption text-clamp-3">{{item.caption}}</p>
        </div>
      </div>

    </div>
  </div>
  <div class="tagline">
    <div class="container">
      <h2 sup-bind-html="page.tagline"></h2>
    </div>
  </div>
</section>
    </div>
    <div ng-if="page.template == 'clients'">
      <section id="{{page.slug}}"
         class="common">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>

    <div id="owl-carosuel"
         class="owl-carousel owl-theme is-block">

      <div class="client">
        <h3>{{page.carousel[0].title}}</h3>
        <img class="thumbnail-img"
             ng-src="{{theme_url}}/styles/trans_cover.png"
             style="{{page.carousel[0].src|bg_img}}">
        <p>{{page.carousel[0].caption}}</p>
      </div>

    </div>
  </div>
</section>

    </div>
  </div>

  <section class="common">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>
</div>

<footer>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<p>
					<span sup-bind-html="site_meta.copyright"></span>
					<span sup-bind-html="site_meta.license"></span>
				</p>
			</div>
		</div>
	</div>
</footer>
