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
  <div>
    <div class="container">
      <div class="row"
           sup-widget-series
           default="{{[
              {
                'title': _('Product name'),
                'src': theme_url+'/assets/prd.png',
                'link': '#'
              },
              {
                'title': _('Product name'),
                'src': theme_url+'/assets/prd.png',
                'link': '#'
              },
              {
                'title': _('Product name'),
                'src': theme_url+'/assets/prd.png',
                'link': '#'
              }
           ]}}"
           allow-fields="link, !caption"
           ng-model="meta.series">

        <div class="col-lg-3 col-md-6 mb-5"
             ng-repeat="item in meta.series">
          <div class="text-center {{item.class}}"
               series-item>
            <figure class="m-auto">
              <img class="thumbnail minify"
                   ng-src="{{g.trans}}"
                   style="{{item.src|bg_img}}"
                   alt="{{item.title}}"/>
            </figure>
            <div>
              <a class="btn btn-ancient-secondary"
                 href="#">{{_('View Detail')}}</a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 mb-5">
          <div class="text-center"
               series-item-create>
            <figure class="m-auto">
              <img class="thumbnail minify"
                   ng-src="{{g.trans}}"
                   style="{{theme_url+'/assets/add_prd.png'|bg_img}}"
                   alt="{{item.title}}"/>
            </figure>
            <div>
              <a class="btn btn-ancient-secondary"
                 href="#">{{_('Add Product')}}</a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
