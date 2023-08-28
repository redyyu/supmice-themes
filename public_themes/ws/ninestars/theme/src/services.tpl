{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="primary-section">

  <div class="container text-center">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
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
           {
             'title': _('Service Title'),
             'caption': _('Click here to edit the server.'),
             'src': theme_url+'/styles/f1.png'
           },
           {
             'title': _('Service Title'),
             'caption': _('Click here to edit the server.'),
             'src': theme_url+'/styles/f2.png'
           },
           {
             'title': _('Service Title'),
             'caption': _('Click here to edit the server.'),
             'src': theme_url+'/styles/f3.png'
           }
         ]}}"
         ng-model="meta.series">

      <div class="col-sm-6 col-sm-3 service-box"
           ng-repeat="item in meta.series">
        <div series-item>
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

      <div class="col-sm-6 col-md-3 service-box">
        <div series-item-create>
          <div class="service-icon">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{g.add_img|bg_img}}" />
          </div>
          <div class="service-desc">
            <h5 class="text-nowrap">
              {{_('Create New Service')}}
            </h5>
            <p class="text-clamp-4">
              {{_('Click here to add a new service.')}}
            </p>
          </div>
        </div>
      </div>

    </div>
  </div>

</section>
