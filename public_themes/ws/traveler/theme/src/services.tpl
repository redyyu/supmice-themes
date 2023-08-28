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
               'title': _('Title'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/f1.png'
             },
             {
               'title': _('Title'),
               'caption': _('Click here to edit the item.'),
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

  <div class="section-primary dark-bg">
    <div class="container">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2 section-header">
          <h3 class="headline">
            <span sup-widget-text
                  ng-model="meta.badges_title"
                  default="{{_('Our Clients')}}"></span>
          </h3>
        </div>
      </div>
      <div class="row centered"
           sup-widget-series
           default="{{[
             {'src': theme_url+'/styles/c1.png'},
             {'src': theme_url+'/styles/c2.png'},
             {'src': theme_url+'/styles/c3.png'}
           ]}}"
           ng-model="meta.badges">
        <div class="col-sm-2 col-xs-4
             {{$first?(meta.badges|col_offset:'col-sm-offset-':2:10):''}}"
             ng-repeat="item in meta.badges">
          <div ng-class="item.class"
               series-item>
            <a href="#"
               target="{{item.target}}">
              <img class="img-holder contain"
                   ng-src="{{g.img_holder}}"
                   alt="{{item.title}}"
                   style="{{item.src|thumbnail|bg_img}}" />
            </a>
          </div>
        </div>

        <div class="col-sm-2 col-xs-4"
             ng-class="{'col-sm-offset-5':(meta.badges|is_empty)}">
          <div series-item-create>
            <img class="img-holder contain"
                 ng-src="{{g.img_holder}}"
                 style="{{g.add_img|bg_img}}" />
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