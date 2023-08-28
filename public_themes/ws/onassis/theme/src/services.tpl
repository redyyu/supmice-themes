{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="id-{{meta.slug}}">
  <div class="service section-primary">
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
             {
               'src': theme_url+'/styles/s1.png',
               'title': _('Service Title'),
               'caption': _('Click here to edit the service.')
             },
             {
               'src': theme_url+'/styles/s2.png',
               'title': _('Service Title'),
               'caption': _('Click here to edit the service.')
             },
             {
               'src': theme_url+'/styles/s3.png',
               'title': _('Service Title'),
               'caption': _('Click here to edit the service.')
             }
           ]}}"
           ng-model="meta.series">

        <div class="col-sm-6 col-md-3 service-item"
             ng-repeat="item in meta.series">
          <div series-item>
            <img class="img-holder"
                 ng-src="{{g.img_holder}}"
                 style="{{item.src|thumbnail|bg_img}}">
            <h4 class="text-nowrap">{{item.title}}</h4>
            <p class="text-clamp-3">{{item.caption}}</p>
          </div>
        </div>

        <div class="col-sm-6 col-md-3 service-item">
          <div series-item-create>
            <img class="img-holder"
                 ng-src="{{g.img_holder}}"
                 style="{{g.add_img|bg_img}}">
            <h4 class="text-nowrap">
              {{_('Create New Service')}}
            </h4>
            <p class="text-clamp-3">
              {{_('Click here to add add a new service.')}}
            </p>
          </div>
        </div>

      </div>

    </div>
  </div>
</section>