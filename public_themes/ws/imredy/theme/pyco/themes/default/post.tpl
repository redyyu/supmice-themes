<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>



<!-- styles -->
<link ng-href="{{theme_url}}/libs/bootstrap.min.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/libs/magnific-popup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/redy.css"
      ng-if="theme_meta.options.imredy"
      rel="stylesheet">

<!-- custom styles -->
<style ng-bind="theme_meta.styles"></style>

<div class="body {{meta.bg.class}}"
     palette="{{g.opts.palette}}"
     style="{{meta.bg.style}}">

  <div sup-widget-bg ng-model="meta.bg"></div>

  <nav id="primary-nav">
  <a href="#" class="icon-btn menu menu-toggle" data-toggle="collapse"></a>
  <a href="#" class="logo">
    <img ng-src="{{site_meta.logo || g.logo}}"
         alt="{{site_meta.title}}" />
  </a>
  <ul class="nav">
    <li ng-repeat="item in menu.primary">
      <a href="#"
         class="{{item.class}} {{item|active:meta.path}}">
        {{item.name}}
      </a>
    </li>
  </ul>
</nav>
  <section class="wrapper">
    <article class="container paper">
      <figure class="featured-img">
        <div sup-widget-media
             ng-model="meta.featured_img">
          <img class="img-responsive"
               ng-src="{{meta.featured_img.src || g.default_img}}">
        </div>
      </figure>
      <header class="upper">
        <h1>
          <span default="{{_('Title')}}"
                sup-widget-text
                ng-model="meta.title"></span>
        </h1>
      </header>
      <div class="date">
        {{meta.date|date_formatted}}
      </div>
      <hr class="row">
      <!-- content -->
      <div class="content"
           default="{{_('$_CONTENT')}}"
           sup-angular-wysiwyg
           ng-model="content">
      </div>
      <!-- #content -->
      <!-- entries -->
      <div class="attachments"
           sup-widget-series
           ng-model="meta.attachments">
        <div class="row">
          <figure ng-repeat="pic in meta.attachments"
                  ng-if="pic.type == 'image'"
                  class="col-md-2 col-xs-3">
            <div series-item>
              <a href="#"
                 class="img-popup">
                <img class="img-responsive img-holder"
                     ng-src="{{g.img_holder}}"
                     style="{{pic.src|bg_img}}"/>
              </a>
            </div>
          </figure>
          <figure class="col-md-2 col-xs-3">
            <div series-item-create>
              <a href="#"
                 class="img-popup">
                <img class="img-responsive img-holder"
                     ng-src="{{g.img_holder}}"
                     style="{{g.add_img|bg_img}}"/>
              </a>
            </div>
          </figure>
        </div>
      </div>

      <!-- #entries -->

      <!-- paginator -->
      <div class="paginator clearfix">
        <div class="text-left">
          <div class="ln prev"
               sup-widget-link="plain"
               ng-model="meta.prevpage">
            <a href="#">{{_('Previous')}}</a>
          </div>
        </div>
        <div class="text-right">
          <div class="ln next"
               sup-widget-link="plain"
               ng-model="meta.nextpage">
            <a href="#">{{_('Next')}}</a>
          </div>
        </div>
      </div>
      <!-- #paginator -->
      <hr class="row">
    </article>
    <div class="container cr">
  <p>
    <span sup-bind-html="site_meta.copyright"></span>
    <span sup-bind-html="site_meta.license"></span>
  </p>
</div>
  </section>
  <aside id="sider">
  <a href="#" class="icon-btn share share-modal"></a>
</aside>
</div>
