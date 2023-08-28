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
         class="primary-section text-center album">
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
    <div class="row"
         sup-widget-series
         default="{{[
           {
             'title': _('Photo Title'),
             'caption': _('Click here to edit the photo.'),
             'src': theme_url+'/styles/p1.jpg'
           },
           {
             'title': _('Photo Title'),
             'caption': _('Click here to edit the photo.'),
             'src': theme_url+'/styles/p2.jpg'
           },
           {
             'title': _('Photo Title'),
             'caption': _('Click here to edit the photo.'),
             'src': theme_url+'/styles/p3.jpg'
           }
         ]}}"
         ng-model="meta.series">

      <div class="col-sm-6 col-md-3 text-center item"
           ng-repeat="item in meta.series">
        <div series-item>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|thumbnail|bg_img}}" />
          </a>
        </div>
      </div>
      <div class="item col-xs-6 col-sm-3 text-center">
        <div series-item-create>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{g.add_img|bg_img}}" />
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
