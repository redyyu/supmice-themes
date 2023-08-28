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

  <!-- banner -->
  <div class="container">
    <div id="carousel"
         class="carousel slide"
         sup-widget-carousel
         default="{{[
           {'src': g.default_banner}
         ]}}"
         ng-model="meta.carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
          <li ng-repeat="item in meta.carousel"
              ng-class="{'active': $first}"></li>
      </ol>
      <!-- /Indicators -->
       <!-- carousel -->
       <div class="carousel-inner">
          <div class="active">
            <img ng-src="{{g.img_holder_cover}}"
                 class="img-holder carousel-holder"
                 style="{{meta.carousel[0].src|bg_img}}"/>
          </div>
       </div>
       <!-- /carousel -->
       <a class="carousel-control left"
          href="#"
          data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left"
               aria-hidden="true"></span>
       </a>
       <a class="carousel-control right"
          href="#"
          data-slide="next">
         <span class="glyphicon glyphicon-chevron-right"
               aria-hidden="true"></span>
       </a>
    </div>
  </div>
  <!-- /banner -->

  <div class="container">
    <div class="row"
         sup-query='product'
         perpage='6'
         ng-model="query.products">

      <div class="col-md-4 col-sm-6 col-xs-12 prd">
        <div sup-widget-create type="product">
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="{{item.class}} img-holder"
                 style="{{g.add_img|bg_img}}"/>
          </a>
        </div>
      </div>

      <div class="col-md-4 col-sm-6 col-xs-12 prd"
           ng-repeat="prd in query.products.contents">
        <div sup-widget-open
             file="prd">
          <a href="#">
    		    <img ng-src="{{g.img_holder}}"
                 class="img-holder"
                 style="{{(prd.featured_img.src || g.default_img)|bg_img}}"/>
    	    </a>
        </div>
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