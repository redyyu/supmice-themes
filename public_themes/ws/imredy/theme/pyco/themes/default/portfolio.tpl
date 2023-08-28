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
    <div class="container entries">
      <header>
        <h1>
          <span default="{{_('Works')}}"
                sup-widget-text ng-model="meta.title"></span>
        </h1>
      </header>
      <!-- entries -->
      <div class="row"
           sup-widget-series
           ng-model="meta.series">
        <figure ng-repeat="works in meta.series"
             class="col-lg-3 col-md-4 col-sm-6">
          <div series-item>
            <a href="#"
               class="img-popup {{works.class}}">
              <img class="img-responsive img-holder"
                   alt="{{works.title}}"
                   ng-src="{{g.img_holder}}"
                   style="{{works.src|thumbnail|bg_img}}" />
            </a>
          </div>
        </figure>
        <figure class="col-lg-3 col-md-4 col-sm-6">
          <div series-item-create>
            <a href="#" class="img-popup">
              <img class="img-responsive"
                   ng-src="{{g.add_img}}"/>
            </a>
          </div>
        </figure>
      </div>
      <!-- #entries -->
      <hr class="row">
    </div>
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
