{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="primary-section parallax features {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg ng-model="meta.bg"></div>
  <div class="container">
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
      </div>
      <p class="wow bounceInUp">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
    </header>
    <div class="row"
         sup-widget-series
         default="{{[
           {
             'title': _('Favorite Title'),
             'caption': _('Click here to edit the feature.'),
             'src': theme_url+'/styles/f1.png'
           },
           {
             'title': _('Favorite Title'),
             'caption': _('Click here to edit the feature.'),
             'src': theme_url+'/styles/f2.png'
           },
           {
             'title': _('Favorite Title'),
             'caption': _('Click here to edit the feature.'),
             'src': theme_url+'/styles/f3.png'
           }
         ]}}"
         ng-model="meta.series">

      <div class="col-sm-6 col-md-3 text-center item"
           ng-repeat="item in meta.series">
        <figure series-item>
          <img class="icon img-responsive"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}">
          <figcaption class="info text-clamp-2">
            <p>{{item.title}}</p>
          </figcaption>
        </figure>
      </div>

      <div class="col-sm-6 col-md-3 text-center item">
        <figure series-item-create>
          <img class="icon img-responsive"
               ng-src="{{g.img_holder}}"
               style="{{g.add_img|bg_img}}">
          <figcaption class="info text-clamp-2">
            <p>{{_('Create New Feature')}}</p>
          </figcaption>
        </figure>
      </div>

    </div>
  </div>
</section>