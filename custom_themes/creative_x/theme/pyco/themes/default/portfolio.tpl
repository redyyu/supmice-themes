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

<section id="{{meta.slug}}"
         class="segment-wrapper no-padding no-border">

  <div class="container-fluid">
    <div class="row no-gutter"
         sup-widget-series
         default="{{[
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p1.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p2.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p3.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p4.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p5.jpg'
           }
         ]}}"
         ng-model="meta.series">

      <div class="col-md-4 col-sm-6"
           ng-repeat="item in meta.series">
        <a href="#"
           class="portfolio-box"
           sup-ico-inset="top"
           series-item>
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

      <div class="col-md-4 col-sm-6">
        <a href="#"
           class="portfolio-box"
           sup-ico-inset="top"
           series-item-create>
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{g.add_img|bg_img}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{_('Create New Works')}}
              </div>
              <div class="project-caption caption">
                {{_('Click here to add a new works.')}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>
</section>
