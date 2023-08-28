<sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default.jpg'}}"></sup-set><sup-set ng-model="g.add_img"         value="{{theme_url+'/styles/add.png'}}"></sup-set><sup-set ng-model="g.img_holder"         value="{{theme_url+'/styles/trans.png'}}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.css"
      rel="stylesheet">
<!-- plugins -->
<link ng-href="{{theme_url}}/styles/magnific-popup.css"
      rel="stylesheet">

<!-- fonts -->
<link ng-href="{{theme_url}}/fonts/lato/lato.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/fonts/raleway/raleway.css"
      rel="stylesheet">

<link ng-href="{{theme_url}}/styles/font-awesome/css/font-awesome.min.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/common.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<nav class="menu primary-menu">

	<!-- Menu button -->

	<div class="menu-toggle"><i class="fa fa-reorder"></i></div>

</nav>

<section id="id-{{meta.slug}}">

  <div class="hero section-primary {{meta.hero.class}}"
       style="{{meta.hero.style}}">
    <div sup-widget-bg ng-model="meta.hero"></div>
    <div class="container text-center">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <h1>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}">
            </span>
          </h1>
          <h2>
            <span sup-widget-text
                  ng-model="meta.description"
                  default="{{_('Description text here')}}">
            </span>
          </h2>
        </div>
      </div>
    </div>

  </div>

  <div class="section-content bg-white">
    <div class="container text-center">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </div>
    </div>
  </div>

</section>

<div sup-widget-segments ng-model="segments">

  <section id="page.slug"
           ng-repeat="page in segments">

    <!-- blocks -->
    <div ng-if="page.template == 'page'" segment>
      <div class="page section-primary {{page.bg.class}}"
           ng-class="{'palette-gray': $odd}"
           style="{{page.bg.style}}">
        <div class="container text-center">

          <div class="row">
            <div class="col-md-8 col-md-offset-2 section-header">
              <h2 ng-bind-html="page.title"></h2>
            </div>
          </div>

          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <div class="content"
                   ng-bind-html="page.content"></div>
            </div>
          </div>

        </div>
      </div>
    </div>
    <div ng-if="page.template == 'services'" segment>
      <div class="service section-primary"
           ng-class="{'palette-gray': $odd}">
        <div class="container text-center">
          <div class="row">
            <div class="col-md-8 col-md-offset-2 section-header">
              <h2 ng-bind-html="page.title"></h2>
            </div>
          </div>

          <div class="row">

            <div class="col-sm-6 col-md-3 service-item"
                 ng-repeat="item in page.series">
              <div>
                <img class="img-holder"
                     ng-src="{{g.img_holder}}"
                     style="{{item.src|thumbnail|bg_img}}">
                <h4 class="text-nowrap">{{item.title}}</h4>
                <p class="text-clamp-3">{{item.caption}}</p>
              </div>
            </div>

          </div>

        </div>
      </div>
    </div>
    <div ng-if="page.template == 'portfolio'" segment>
      <div class="portfolio section-primary {{page.bg.class}}"
           style="{{page.bg.style}}">

        <div class="container text-center">
          <div class="row">
            <div class="col-md-8 col-md-offset-2 section-header">
              <h2 ng-bind-html="page.title"></h2>
            </div>
          </div>
          <div class="row">

            <div class="col-sm-6 col-md-3 folio-item"
                 ng-repeat="item in page.series">
              <div>
                <a href="#"
                   class="img-popup">
                  <img class="img-holder"
                       ng-src="{{g.img_holder}}"
                       style="{{item.src|thumbnail|bg_img}}" />
                </a>
              </div>
            </div>

          </div>

        </div>
      </div>

      <div class="section-content bg-white">
        <div class="container text-center">
          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <div class="content"
                   ng-bind-html="page.content"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div ng-if="page.template == 'team'" segment>
      <div class="team section-primary"
           ng-class="{'palette-gray': $odd}">
        <div class="container text-center">

          <div class="row">
            <div class="col-md-8 col-md-offset-2 section-header">
              <h2 ng-bind-html="page.title"></h2>
            </div>
          </div>

          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <div class="content"
                   ng-bind-html="page.content"></div>
            </div>
          </div>

          <div class="row">

            <div class="col-sm-6 col-md-3 team-item"
                 ng-repeat="item in page.series">
              <div>
                <div class="avatar">
                  <img class="img-circle img-holder"
                       ng-src="{{g.img_holder}}"
                       style="{{item.src|thumbnail|bg_img}}">
                </div>
                <h4 class="text-nowrap">{{item.title}}</h4>
                <p class="text-clamp-4">{{item.caption}}</p>
              </div>
            </div>

          </div>

      </div>
    </div>

  </section>

  <section class="segment">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>

</div>

<div class="copyright">

	<div class="container">

		<p class="text-center">

			<span ng-bind-html="site_meta.copyright"></span>

			<span ng-bind-html="site_meta.license"></span>

		</p>

	</div>

</div>