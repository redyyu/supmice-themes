<sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default_img.jpg'}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css" rel="stylesheet">
<!-- plugin -->
<link ng-href="{{theme_url}}/styles/animate.min.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/magnific-popup.css" rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/style.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/editor.css" rel="stylesheet">

<!-- custom styles -->
<style ng-bind-html="theme_meta.styles"></style>
<nav id="primary-nav"
     class="navbar navbar-default navbar-fixed-top"
     ng-class="{'affix': meta.template!='index'}">
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
         href="#">
           <img class="logo"
                ng-src="{{site_meta.logo}}"
                ng-if="site_meta.logo"/>
           {{site_meta.logo?'':site_meta.title}}
      </a>
    </div>

    <div class="collapse navbar-collapse" id="primary-navbar">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
             class="{{menu.class}}"
             target="{{menu.target}}">{{menu.title}}</a>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</nav>

<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="header-content">
    <div class="header-content-inner">
      <h1>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <hr>
      <p>
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
      <a href="#"
         class="btn btn-primary btn-xl"
         sup-widget-button
         ng-model="meta.entrance">
         {{meta.entrance.name || _('Learn More')}}</a>
    </div>
  </div>
</section>

<section class="no-padding no-border"
         sup-query="post"
         ng-model="query.posts">

  <div class="container-fluid">
    <div class="row no-gutter">

      <div class="col-lg-4 col-sm-6"
           ng-repeat="item in query.posts"
           sup-widget-open
           file="post">
        <a href="{{item.url}}"
           class="portfolio-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{'background-image:url('+
                        (item.featured_img.src|thumbnail)+');'}}"
               alt="{{item.title}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{item.title}}
              </div>
              <div class="project-caption faded">
                {{item.description}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>

</section>

<section>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.subject"></span>
        </h2>
        <hr class="primary">
      </div>
    </div>
    <div class="row"
         sup-widget-gallery
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="item in meta.series">
        <div class="service-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{'background-image:url('+
                        (item.src|thumbnail)+');'}}"
               alt="{{item.title}}">
          <h3 class="text-nowrap">
            {{item.title}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{item.caption}}
          </p>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="i in [1,2,3,4]"
           ng-if="meta.series|is_empty">
        <div class="service-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{'background-image:url('+g.default_img+');'}}" >
          <h3 class="text-nowrap">
            {{_('Item Title')}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{_('Click here add series content')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>
