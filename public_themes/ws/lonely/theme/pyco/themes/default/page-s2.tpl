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
<!-- Navigation -->
<div id="navigation">
  <nav class="navbar navbar-custom" role="navigation">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <div class="navbar-brand">{{site_meta.title}}</div>
            <button type="button"
                    class="navbar-toggle"
                    data-toggle="collapse"
                    data-target="#menu">
              <i class="fa fa-bars"></i>
            </button>
          </div>

          <div class="collapse navbar-collapse" id="menu">
            <ul class="nav navbar-nav">
              <li ng-repeat="menu in menu.primary">
                <a href="#"
                   class="{{menu.class}}">
                  {{menu.name}}
                </a>
              </li>
            </ul>
          </div>
          <!-- /.Navbar-collapse -->
        </div>
      </div>
    </div>
    <!-- /.container -->
  </nav>
</div>
<!-- /Navigation -->


<section id="{{meta.slug}}"
         class="primary-section">
  <div class="container">
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
      </div>
      <p class="wow bounceInUp">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
    </header>
    <div class="row">
      <div class="col-md-6 text-center">
        <div sup-widget-media
             ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || g.default_img}}"
               alt="{{meta.featured_img.title}}"/>
        </div>
      </div>
      <div class="col-md-6">
        <div sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"
             class="content"></div>
      </div>
    </div>
  </div>
</section>
