<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css"
      rel="stylesheet">
<!-- plugin -->
<link ng-href="{{theme_url}}/styles/magnific-popup.css"
      rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/creative.css"
      rel="stylesheet">

<!-- Custom styles -->
<style sup-bind-html="theme_meta.styles"></style>

<nav id="primary-nav"
     class="navbar navbar-default navbar-fixed-top affix">
  <div class="container-fluid">
  <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target="#primary-navbar">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">{{site_meta.title}}</a>
    </div>

    <div class="collapse navbar-collapse" id="primary-navbar">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
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
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="header-content">
    <div class="header-content-inner">
      <div class="logo"
           style="{{site_meta.logo|bg_img}}"
           ng-if="site_meta.logo"></div>
      <h1>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <hr class="divider">
      <p class="lead">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
      <a href="#"
         class="btn btn-primary btn-xl"
         sup-widget-link
         ng-model="meta.entrance">
         {{meta.entrance.name || _('Learn More')}}</a>
    </div>
  </div>
</section>

<div sup-widget-segments ng-model="segments">
  <div ng-repeat="page in segments">
  	<!-- segments -->
    <div ng-if="page.template == 'page'"
         sup-ico-inset="top"
         segment>
      <section id="{{page.slug}}"
         class="segment-wrapper {{page.bg.class}}"
         style="{{page.bg.style}}">
  <header class="container">
    <h2 class="section-heading"
        sup-bind-html="page.title || _('Title')">
    </h2>
    <hr class="divider">
    <p class="caption text-center"
       sup-bind-html="page.description"></p>
  </header>

  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-bind-html="page.content"></div>
      </div>
    </div>
  </div>
</section>

    </div>
    <div ng-if="page.template == 'portfolio'"
         sup-ico-inset="top"
         segment>
      <section id="{{page.slug}}" class="segment-wrapper no-padding no-border">

  <div class="container-fluid">
    <div class="row no-gutter">

      <div class="col-md-4 col-sm-6"
           ng-repeat="item in page.series">
        <a href="#" class="portfolio-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{item.src|bg_img}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{item.title}}
              </div>
              <div class="project-caption caption">
                {{item.caption}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>
</section>

    </div>
    <div ng-if="page.template == 'features'"
         sup-ico-inset="top"
         segment>
      <section id="{{page.slug}}" class="segment-wrapper">

  <header class="container">
    <h2 class="section-heading"
        sup-bind-html="page.title || _('Title')">
    </h2>
    <hr class="divider">
  </header>

  <div class="container">
    <div class="row">

      <div class="col-md-3 col-sm-6 text-center"
           ng-repeat="item in page.series">
        <div class="feature-box">
          <figure>
            <img ng-src="{{theme_url}}/styles/trans.png"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|bg_img}}" />
          </figure>
          <h3 class="text-nowrap">
            {{item.title}}
          </h3>
          <p class="text-muted text-clamp-3">
            {{item.caption}}
          </p>
        </div>
      </div>

    </div>
  </div>

</section>

    </div>
    <div ng-if="page.template == 'services'"
         sup-ico-inset="top"
         segment>
      <section id="{{page.slug}}" class="segment-wrapper">

  <header class="container">
    <h2 class="section-heading"
        sup-bind-html="page.title || _('Title')">
    </h2>
    <hr class="divider">
  </header>

  <div class="container">
    <div class="row">

      <div class="col-md-3 col-sm-6 text-center"
           ng-repeat="item in page.series">
        <div class="service-box">
          <figure>
            <img ng-src="{{theme_url}}/styles/trans.png"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|bg_img}}" />
          </figure>
          <h3 class="text-nowrap">
            {{item.title}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{item.caption}}
          </p>
        </div>
      </div>

    </div>
  </div>

</section>

    </div>
  	<!-- #segments -->
  </div>

  <section class="segment-wrapper">
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


