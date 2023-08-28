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


<div sup-gap="10"></div>

<section id="{{meta.slug}}" class="segment-wrapper no-border">
  <header class="container">
    <h2 class="section-heading">
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h2>
    <hr class="divider">
  </header>
  <div class="container">
    <div class="row"
         sup-widget-series
         default="{{[
            {
              'title': _('Service Title'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/styles/s1.jpg'
            },
            {
              'title': _('Service Title'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/styles/s2.jpg'
            },
            {
              'title': _('Service Title'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/styles/s3.jpg'
            }
         ]}}"
         ng-model="meta.series">

      <div class="col-md-3 col-sm-6 text-center"
           ng-repeat="item in meta.series">
        <div class="service-box"
             series-item>
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

      <div class="col-md-3 col-sm-6 text-center">
        <div class="service-box"
             series-item-create>
          <figure>
            <img ng-src="{{theme_url}}/styles/trans.png"
                 class="img-responsive thumbnail-img"
                 style="{{g.add_img|bg_img}}" />
          </figure>
          <h3 class="text-nowrap">
            {{_('Create New Service')}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{_('Click here add a new service.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>
