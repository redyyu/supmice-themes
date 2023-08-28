{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="primary-section">

  <div class="container text-center">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="section-heading marginbot-50">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
          <p>
            <span sup-widget-text
                  ng-model="meta.description"
                  default="{{_('Description text here')}}"></span>
          </p>
        </div>
      </div>
    </div>
  </div>

  <div class="container text-center">
    <div class="row"
         sup-widget-series
         default="{{[
           {'src': theme_url+'/styles/w1.jpg'},
           {'src': theme_url+'/styles/w2.jpg'},
           {'src': theme_url+'/styles/w3.jpg'}
         ]}}"
         ng-model="meta.series">

      <div class="col-sm-6 col-md-3 gallery-box"
           ng-repeat="work in meta.series">
        <div series-item>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{work.src|thumbnail|bg_img}}">
          </a>
        </div>
      </div>

      <div class="col-sm-6 col-md-3 gallery-box">
        <div series-item-create>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{g.add_img|bg_img}}">
          </a>
        </div>
      </div>

    </div>
  </div>

</section>
