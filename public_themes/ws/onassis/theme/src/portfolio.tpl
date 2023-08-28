{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="id-{{meta.slug}}">
  <div class="portfolio section-primary {{meta.bg.class}}"
       style="{{meta.bg.style}}">
    <div sup-widget-bg ng-model="meta.bg"></div>
    <div class="container text-center">
      <div class="row">
        <div class="col-md-8 col-md-offset-2 section-header">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
        </div>
      </div>
      <div class="row"
           sup-widget-series
           default="{{[
             {'src': theme_url+'/styles/w1.png'},
             {'src': theme_url+'/styles/w2.png'},
             {'src': theme_url+'/styles/w3.png'}
           ]}}"
           ng-model="meta.series">

        <div class="col-sm-6 col-md-3 folio-item"
             ng-repeat="item in meta.series">
          <div series-item>
            <a href="#"
               class="img-popup">
              <img class="img-holder"
                   ng-src="{{g.img_holder}}"
                   style="{{item.src|thumbnail|bg_img}}" />
            </a>
          </div>
        </div>

        <div class="col-sm-6 col-md-3 folio-item">
          <div series-item-create>
            <a href="#"
               class="img-popup">
              <img class="img-holder"
                   ng-src="{{g.img_holder}}"
                   style="{{g.add_img|bg_img}}" />
            </a>
          </div>
        </div>

      </div>

    </div>
  </div>

  <div class="section-content bg-white">
    <div class="container text-center">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </div>
    </div>
  </div>
</section>