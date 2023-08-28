<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.logo"
         value="{{theme_url+'/assets/logo.png'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<sup-set ng-model="g.trans_4x7"
         value="{{theme_url+'/assets/trans_4x7.png'}}"></sup-set>

<sup-set ng-model="g.trans_2x5"
         value="{{theme_url+'/assets/trans_2x5.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/assets/bootstrap.min.css"
      rel="stylesheet"
      type="text/css">

<!-- styles -->
<link ng-href="{{theme_url}}/assets/main.css"
      rel="stylesheet"
      type="text/css">

<!-- custom -->
<style sup-bind-html="theme_meta.styles"></style>

<section id="{{meta.slug}}"
         class="segment {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.bg"></div>
  <div class="compact bg-glassy">
    <div class="container text-brighten">
      <div class="row">
        <div class="col-md-6 frame d-flex align-items-center mb-5 mb-md-0">
          <div class="content"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               ng-model="content">
          </div>
        </div>
        <div class="col-md-6 d-flex align-items-center">
          <figure sup-widget-media
                  ng-model="meta.featured_img">
            <img ng-src="{{meta.featured_img.src || g.default_img}}"/>
          </figure>
        </div>
      </div>
    </div>
  </div>
</section>
