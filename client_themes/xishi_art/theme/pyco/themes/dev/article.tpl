<sup-set ng-model="g.ver"         value="{{theme_meta.version}}"></sup-set><sup-set ng-model="g.opts"         value="{{theme_meta.options}}"></sup-set><sup-set ng-model="g.default_logo"         value="{{theme_url+'/styles/logo.png'}}"></sup-set><sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default_img.png'}}"></sup-set><sup-set ng-model="g.default_cover"         value="{{theme_url+'/styles/default_cover.png'}}"></sup-set><sup-set ng-model="g.default_qr"         value="{{theme_url+'/styles/qr.png'}}"></sup-set><sup-set ng-model="g.img_holder"         object="{'px': theme_url+'/styles/trans.png',                  '16x10': theme_url+'/styles/trans_16x10.png',                  '18x10': theme_url+'/styles/trans_18x10.png',                  '20x10': theme_url+'/styles/trans_20x10.png',                  '30x10': theme_url+'/styles/trans_30x10.png'}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/bootstrap.min.css?{{g.ver}}"
      rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/sup.css?{{g.ver}}" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}" rel="stylesheet">

<!-- custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<header ng-class="{'free':meta.hero.src}">

  <div sup-widget-media

       ng-model="meta.hero">

    <img ng-src="{{meta.hero.src || site_meta.logo || g.default_logo}}" />

  </div>

</header>

<div class="container">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <h1 class="text-center">
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <div class="signature text-center">
        {{meta.author}}
        <span class="bullet">&bullet;</span>
        {{meta.date|date_formatted}}
      </div>
      <div class="featured">
        <div sup-widget-media
             ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src||g.default_cover}}">
        </div>
      </div>
      <hr>
      <article sup-wx-broadcast class="content">
        <div sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"></div>
        <div style="text-align: center; padding-top:30px;">
          <div sup-widget-media
               ng-model="meta.qr">
            <img ng-src="{{meta.qr.src||g.default_qr}}">
          </div>
        </div>
      </article>
    </div>
  </div>
</div>

<footer>

  <p>

    <span>{{site_meta.copyright}}</span>

    <span>{{site_meta.license}}</span>

  </p>

  <hr>

  <p class="count">

    {{site_meta.visit.page}}

  </p>

<footer>
