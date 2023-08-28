{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="wrapper">
  <div class="section-header ribbon-bg {{meta.hero.class}}"
       ng-class="{'ribbon-cover': meta.hero.src}"
       style="{{meta.hero.style}}">
    <div sup-widget-bg
         presets="[
           {'key': 'palette-light', 'label': _('Light')}
         ]"
         ng-model="meta.hero"></div>
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
               'title': _('Team Member'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/t1.jpg'
             },
             {
               'title': _('Team Member'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/t2.jpg'
             },
             {
               'title': _('Team Member'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/t3.jpg'
             },
           ]}}"
           ng-model="meta.series">

        <div class="col-sm-6 team-item"
             ng-class="{'col-md-3': meta.series.length > 2,
                        'col-md-4': meta.series.length == 2,
                        'col-md-6': meta.series.length < 2,
                        'col-sm-4': meta.series.length % 2 != 0,
                        'col-sm-6': meta.series.length % 2 == 0}"
             ng-repeat="item in meta.series">
          <div series-item>
            <img class="img-circle avatar-img"
                 ng-src="{{g.img_holder}}"
                 style="{{item.src|thumbnail|bg_img}}" />
            <h4 class="text-nowrap">
              {{item.title}}
            </h4>
            <p class="text-clamp-4">
              {{item.caption}}
            </p>
          </div>
        </div>

        <div class="col-sm-6 team-item"
             ng-class="{'col-md-3': meta.series.length > 2,
                        'col-md-4': meta.series.length == 2,
                        'col-md-6': meta.series.length < 2,
                        'col-sm-4': meta.series.length % 2 != 0,
                        'col-sm-6': meta.series.length % 2 == 0}">
          <div series-item-create>
            <img class="img-circle avatar-img"
                 ng-src="{{g.img_holder}}"
                 style="{{g.add_img|bg_img}}" />
            <h4 class="text-nowrap">
              {{_('Create New Item')}}
            </h4>
            <p class="text-clamp-4">
              {{_('Click here to add a new item.')}}
            </p>
          </div>
        </div>

      </div>
    </div>
  </div>

  <div class="section-primary deep-dark-bg">
    <div class="container">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2 section-header">
          <h3 class="headline">
            <span sup-widget-text
                  ng-model="meta.badges_title"
                  default="{{_('Title')}}"></span>
          </h3>
        </div>
      </div>
      <div class="row centered"
           sup-widget-series
           default="{{[
             {
               'title': _('Title'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/award.png'
             },
             {
               'title': _('Title'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/award.png'
             },
             {
               'title': _('Title'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/award.png'
             },
           ]}}"
           ng-model="meta.badges">

        <div class="col-sm-6 award-item"
             ng-class="{'col-md-3': meta.badges.length > 2,
                        'col-md-4': meta.badges.length == 2,
                        'col-md-6': meta.badges.length < 2,
                        'col-sm-4': meta.badges.length % 2 != 0,
                        'col-sm-6': meta.badges.length % 2 == 0}"
             ng-repeat="item in meta.badges">
          <div ng-class="item.class"
               series-item>
            <img class="award-img"
                 ng-src="{{g.img_holder}}"
                 style="{{item.src|thumbnail|bg_img}}">
            <h4 class="text-nowrap">
              {{item.title}}
            </h4>
            <p class="text-clamp-4">
              {{item.caption}}
            </p>
          </div>
        </div>

        <div class="col-sm-6 award-item"
             ng-class="{'col-md-3': meta.badges.length > 2,
                        'col-md-4': meta.badges.length == 2,
                        'col-md-6': meta.badges.length < 2,
                        'col-sm-4': meta.badges.length % 2 != 0,
                        'col-sm-6': meta.badges.length % 2 == 0}">
          <div series-item-create>
            <img class="award-img"
                 ng-src="{{g.img_holder}}"
                 style="{{g.add_img|bg_img}}">
            <h4 class="text-nowrap">
              {{_('Create New Item')}}
            </h4>
            <p class="text-clamp-4">
              {{_('Click here to add a new item.')}}
            </p>
          </div>
        </div>

      </div>
    </div>
  </div>

  <div class="section-primary hl-bg">
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
</div>