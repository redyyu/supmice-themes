<sup-set ng-model="g.ver"
         value="{{theme_meta.version}}"></sup-set>
<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.default_avatar"
         value="{{theme_url+'/styles/avatar.png'}}"></sup-set>
<sup-set ng-model="g.img_trans"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<link ng-href="{{theme_url}}/styles/mini-ui.css?{{g.ver}}"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet">

<div class="container">
  <h1>Title</h1>
  <div sup-widget-carousel
       link-to-type="product"
       ng-model="meta.carousel">
    <div ng-repeat="slide in meta.carousel">
      <img ng-src="{{slide.src}}" />
    </div>
  </div>
</div>

