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

<div class="cover {{meta.bg.class}}"
     palette="{{g.opts.palette}}"
     style="{{meta.bg.style}}">

  <div sup-widget-bg ng-model="meta.bg"></div>

  <div class="wrapper">
    <a href="#"
       class="entrance {{meta.entrance.class}}"
       sup-widget-link="figure, name"
       ng-model="meta.entrance">
      <img ng-if="meta.entrance.figure"
           ng-src="{{meta.entrance.figure}}" />
      <span ng-if="!meta.entrance.figure">
        {{ meta.entrance.name || _('Title') }}
      </span>
    </a>
  </div>
  <div class="container cr">
  <p>
    <span sup-bind-html="site_meta.copyright"></span>
    <span sup-bind-html="site_meta.license"></span>
  </p>
</div>
</div>
