<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.default_banner"
         value="{{theme_url+'/styles/banner.jpg'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<sup-set ng-model="g.img_holder_cover"
         value="{{theme_url+'/styles/trans_cover.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/css/bootstrap.min.css"
      rel="stylesheet">

<!-- plugin -->
<link ng-href="{{theme_url}}/libs/magnific/magnific-popup.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/sup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet">

<!-- Custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
<div class="wrapper">
  <!-- logo -->
<header class="container logo">
  <img ng-src="{{g.img_holder}}"
       class="img-responsive center-block"
       style="{{(site_meta.logo || g.logo)|bg_img}}"
       alt="{{site_meta.title}}" />
</header>
<!-- /logo -->

<!-- navbar -->
<nav class="navbar">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target="#primary-navbar"
              aria-expanded="false">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="primary-navbar">
      <ul class="nav navbar-nav">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
             class="{{menu.class}}"
             target="{{menu.target}}">
            {{menu.name}}
          </a>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>
<!-- /navbar -->

  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <article>
          <header>
            <h2 class="text-center error-header">
              <span sup-widget-text
                    ng-model="meta.title"
                    default="{{_('Error 404')}}"></span>
            </h2>
          </header>
          <div class="content text-center"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_ERROR404')}}"></div>
        </article>
      </div>
    </div>
  </div>

</div>

<div class="footer">
  <div class="container">
    <p class="text-center">
      <span sup-bind-html="site_meta.copyright"></span>
      <span sup-bind-html="site_meta.license"></span>
    </p>
  </div>
</div>
