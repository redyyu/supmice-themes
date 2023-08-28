{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}">

<div class="section-primary features">
  <div class="container">

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2>
          <span sup-widget-text
                ng-model="meta.title"
                default="{{_('Title')}}"></span>
        </h2>
      </div>
    </div>

    <div class="row centered"
         sup-widget-series
         default="{{[
           {
             'title': _('Feature Title'),
             'caption': _('Click here to edit the feature.'),
             'src': theme_url+'/styles/f1.png',
           },
           {
             'title': _('Feature Title'),
             'caption': _('Click here to edit the feature.'),
             'src': theme_url+'/styles/f2.png',
           },
         ]}}"
         ng-model="meta.series">
      <div class="col-md-4 feature-item"
           ng-repeat="item in meta.series">
        <div series-item>
          <img class="img-holder {{item.class}}"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}">
          <h3 class="text-nowrap">{{item.title}}</h3>
          <p class="text-clamp-3">{{item.caption}}</p>
        </div>
      </div>

      <div class="col-md-4 feature-item">
        <div series-item-create>
          <img class="img-holder {{item.class}}"
               ng-src="{{g.img_holder}}"
               style="{{g.add_img|bg_img}}">
          <h3>{{_('Create New Feature')}}</h3>
          <p>{{_('Click here to add a new feature.')}}</p>
        </div>
      </div>

    </div>

  </div>
</div>

</section>