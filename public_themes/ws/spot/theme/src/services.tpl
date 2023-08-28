{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="section-header blue-bg">
  <div class="container">
    <div class="row centered">
      <div class="col-md-8 col-md-offset-2">
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

<div class="section-primary">
  <div class="container">
    <div class="row centered"
         sup-widget-series
         default="{{[
           {
             'title': _('Service Title'),
             'caption': _('Click here to edit the service.'),
             'src': theme_url+'/styles/f1.png'
           },
           {
             'title': _('Service Title'),
             'caption': _('Click here to edit the service.'),
             'src': theme_url+'/styles/f2.png'
           }
         ]}}"
         ng-model="meta.series">

      <div class="service-item"
           ng-class="{
             'col-sm-4': meta.series.length >= 2,
             'col-sm-6': meta.series.length < 2,
           }"
           ng-repeat="item in meta.series">
        <div ng-class="item.class"
             series-item>
          <img ng-src="{{g.img_holder}}"
               style="{{item.src|bg_img}}">
          <h4 class="text-nowrap">
            {{item.title}}
          </h4>
          <p class="text-clamp-4">
            {{item.caption}}
          </p>
        </div>
      </div>

      <div class="service-item"
           ng-class="{
             'col-md-4': meta.series.length >= 2,
             'col-md-6': meta.series.length < 2
           }">
        <div series-item-create>
          <img ng-src="{{g.img_holder}}"
               style="{{g.add_img|bg_img}}">
          <h4 class="text-nowrap">
            {{_('Create New Service')}}
          </h4>
          <p class="text-clamp-4">
            {{_('Click here add a new service.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</div>

<div class="section-primary red-bg">
  <div class="container">
    <div class="row centered">
      <div class="col-lg-8 col-lg-offset-2">
        <h4>
          <span sup-widget-text
                ng-model="meta.statement"
                default="{{_('We are the only option you have')}}"></span>
        </h4>
      </div>
    </div>
  </div>
</div>

{% include '_footer.tpl' %}
