<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css"
      rel="stylesheet">

<!-- plugins -->
<link ng-href="{{theme_url}}/styles/gnmenu/gnmenu.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/nivo-lightbox.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/nivo-lightbox-theme/default/default.css"
      rel="stylesheet"/>

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/palette.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/editor.css"
      rel="stylesheet">

<!-- additional -->
<style sup-bind-html="theme_meta.styles"></style>
<div class="container">
  <ul id="gn-menu"
      class="gn-menu-main">
    <li class="gn-trigger">
      <a class="gn-icon gn-icon-menu"><span>Menu</span></a>
    </li>
    <li><a href="#">{{site_meta.title}}</a></li>
  </ul>
</div>

<section id="{{meta.slug}}"
         class="intro {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="slogan">
    <h1>
      <span sup-widget-text
            ng-model="meta.title"
            default="{{_('Title')}}"></span>
    </h1>
    <p>
      <span sup-widget-text
            ng-model="meta.description"
            default="{{_('Description text here')}}"></span>
    </p>
    <a href="#"
       class="btn btn-skin scroll {{meta.entrance.class}}"
       sup-widget-link
       ng-model="meta.entrance">
      <span>{{meta.entrance.name || _('Learn More')}}</span>
    </a>
  </div>
</section>

<div sup-widget-segments ng-model="segments">

  <section id="page.slug"
           class="primary-section"
           ng-repeat="page in segments"
           ng-class="{'palette-gray': $even}">

    <!-- segments -->
    <div ng-if="page.template == 'page'"
         sup-ico-inset="top"
         segment>
      <div class="container text-center">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <div class="section-heading marginbot-50">
        <h2 sup-bind-html="page.title"></h2>
        <p sup-bind-html="page.description"></p>
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <div class="content"
           sup-bind-html="page.content">
      </div>
    </div>
  </div>
</div>
    </div>
    <div ng-if="page.template == 'services'"
         sup-ico-inset="top"
         segment>
      <div class="container text-center">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-2">
      <div class="section-heading marginbot-50">
        <h2 sup-bind-html="page.title"></h2>
        <p sup-bind-html="page.description"></p>
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <div class="row">

    <div class="col-sm-6 col-sm-3 service-box"
         ng-repeat="item in page.series">
      <div>
        <div class="service-icon">
          <img ng-src="{{g.img_holder}}"
               class="img-responsive thumbnail-img"
               style="{{item.src|thumbnail|bg_img}}" />
        </div>
        <div class="service-desc">
          <h5 class="text-nowrap">{{item.title}}</h5>
          <p class="text-clamp-4">{{item.caption}}</p>
        </div>
      </div>
    </div>

  </div>
</div>

    </div>
    <div ng-if="page.template == 'portfolio'"
         sup-ico-inset="top"
         segment>
      <div class="container text-center">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <div class="section-heading marginbot-50">
        <h2 sup-bind-html="page.title"></h2>
        <p sup-bind-html="page.description"></p>
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <div class="row">

    <div class="col-sm-6 col-md-3 gallery-box"
         ng-repeat="work in page.series">
      <div>
        <a href="#">
          <img ng-src="{{g.img_holder}}"
               class="img-responsive thumbnail-img"
               style="{{work.src|thumbnail|bg_img}}">
        </a>
      </div>
    </div>

  </div>
</div>
    </div>
    <div ng-if="page.template == 'team'"
         sup-ico-inset="top"
         segment>
      <div class="container text-center">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <div class="section-heading marginbot-50">
        <h2 sup-bind-html="page.title"></h2>
        <p sup-bind-html="page.description"></p>
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <div class="row">

    <div class="col-sm-6 col-md-3 team-box"
         ng-repeat="item in page.series">
      <div>
        <div class="team boxed-gray">
          <div class="inner">
            <h5 class="text-nowrap">
              {{item.title}}
            </h5>
            <p class="subtitle text-nowrap">
              {{item.caption}}
            </p>
            <div class="avatar">
              <img ng-src="{{g.img_holder}}"
                   class="img-responsive thumbnail-img"
                   style="{{item.src|thumbnail|bg_img}}" />
            </div>
          </div>
        </div>
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

<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-12">
        <p>
          <span sup-bind-html="site_meta.copyright"></span>
          <span sup-bind-html="site_meta.license"></span>
        </p>
      </div>
    </div>
  </div>
</footer>