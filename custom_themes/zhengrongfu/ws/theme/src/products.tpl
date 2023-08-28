{% import 'g.tpl' %}
{% include '_css.tpl' %}

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
