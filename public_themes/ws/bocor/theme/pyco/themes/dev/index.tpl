<sup-set ng-model="g.ver" value="{{theme_meta.version}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set><sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<!-- Bootstrap CSS -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css?{{g.ver}}"
      rel="stylesheet" />
<!-- Lightbox -->
<link ng-href="{{theme_url}}/styles/nivo-lightbox.css?{{g.ver}}"
      rel="stylesheet" />
<link ng-href="{{theme_url+'/styles/nivo-lightbox-theme/'+
                 'default/default.css?'+g.ver}}"
      rel="stylesheet" />

<!-- Styles -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/palette.css?{{g.ver}}"
      rel="stylesheet" />

<!-- Custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<section id="id-{{meta.slug}}"
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         palette="{{g.opts.palette}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-right navicon">
        <a id="nav-toggle" class="nav_slide_button" href="#"><span></span></a>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-md-offset-2 text-center inner">
        <h1>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h1>
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
  </div>
</section>
<!-- Navigation -->
<div id="navigation">
  <nav class="navbar navbar-custom" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button class="navbar-toggle collapsed"
                type="button"
                data-toggle="collapse"
                data-target="#primary-nav">
          <span class="sr-only">{{_('Toggle navigation')}}</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand site-logo">
          {{site_meta.title}}
        </a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="primary-nav">
        <ul class="nav navbar-nav navbar-right">
          <li ng-repeat="menu in menu.primary">
            <a class="{{menu.class}}"
               target="{{menu.target}}"
               href="#">{{menu.title}}</a>
          </li>
        </ul>
      </div>
      <!-- /.Navbar-collapse -->
    </div>
  <!-- /.container -->
  </nav>
</div>
<!-- /Navigation -->

<div sup-widget-segments ng-model="segments">
  <section id="id-{{page.slug}}"
           class="segment"
           ng-repeat="page in segments"
           ng-if="page.template != meta.template"
           ng-class="{'bg-white': $odd,
                      'bg-gray': $even}">

  	<!-- Segments -->
    <div ng-if="page.template == 'page'" segment>
      <div class="container marginbot-50">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="section-heading text-center">
              <h2 class="h-bold">
                <div ng-bind-html="page.title"></div>
              </h2>
              <div class="divider-header"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="content"
                 ng-bind-html="page.content">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div ng-if="page.template == 'page-s1'" segment>
      <div class="container marginbot-50">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="section-heading text-center">
              <h2 class="h-bold">
                <div ng-bind-html="page.title"></div>
              </h2>
              <div class="divider-header"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row marginbot-80">
          <div class="col-md-8 col-md-offset-2">
            <div class="row">
              <div class="col-sm-6">
                <div class="content"
                     ng-bind-html="page.content">
                </div>
              </div>
              <div class="col-sm-6">
                <div>
                  <img class="img-responsive center-block"
                       ng-src="{{page.featured_img.src||g.default_img}}"
                       alt="{{page.featured_img.title}}" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div ng-if="page.template == 'page-s2'" segment>
      <div class="container marginbot-50">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="section-heading text-center">
              <h2 class="h-bold">
                <div ng-bind-html="page.title"></div>
              </h2>
              <div class="divider-header"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row marginbot-80">
          <div class="col-md-8 col-md-offset-2">
            <div class="row">
              <div class="col-sm-6">
                <div>
                  <img class="img-responsive center-block"
                       ng-src="{{page.featured_img.src||g.default_img}}"
                       alt="{{page.featured_img.title}}" />
                </div>
              </div>
              <div class="col-sm-6">
                <div class="content"
                     ng-bind-html="page.content">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div ng-if="page.template == 'portfolio'" segment>
      <div class="container marginbot-50">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="section-heading text-center">
              <h2 class="h-bold">
                <div ng-bind-html="page.title"></div>
              </h2>
              <div class="divider-header"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="container text-center">
        <div class="row">

          <div class="col-sm-6 col-md-3 gallery-item"
               ng-repeat="item in page.series">
            <div class="item-hover">
              <img class="img-responsive thumbnail-img"
                   ng-src="{{theme_url}}/styles/trans.png"
                   style="{{item.src|bg_img}}">
            </div>
          </div>

        </div>
      </div>
    </div>
    <div ng-if="page.template == 'services'" segment>
      <div class="container marginbot-50">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="section-heading text-center">
              <h2 class="h-bold">
                <div ng-bind-html="page.title"></div>
              </h2>
              <div class="divider-header"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="container text-center">
        <div class="row">
          <!-- items -->
          <div class="col-sm-4"
               ng-repeat="item in page.series">
            <div class="service-box">
              <div class="service-icon">
                <img class="thumbnail-img"
                     ng-src="{{theme_url}}/styles/trans.png"
                     style="{{item.src|bg_img}}">
              </div>
              <div class="service-desc">
                <h5 class="text-nowrap">
                  {{item.title}}
                </h5>
                <div class="divider-header"></div>
                <p class="text-clamp-3">
                  {{item.caption}}
                </p>
              </div>
            </div>
          </div>
          <!-- #items -->
        </div>
      </div>
    </div>
  	<!-- #Segments -->

  </section>
  <section ng-class="{'bg-white': $odd,
                      'bg-gray': $even}">
    <div>
      <div class="container">
        <div segment-create="major"></div>
      </div>
    </div>
  </section>
</div>

<footer>

	<div class="container">

		<div class="row">

			<div class="text-center">

				<p>

					<span ng-bind-html="site_meta.copyright"></span>

					<span ng-bind-html="site_meta.license"></span>

				</p>

			</div>

		</div>

	</div>

</footer>