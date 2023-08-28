{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="primary-section text-center album">
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
             'title': _('Photo Title'),
             'caption': _('Click here to edit the photo.'),
             'src': theme_url+'/styles/p1.jpg'
           },
           {
             'title': _('Photo Title'),
             'caption': _('Click here to edit the photo.'),
             'src': theme_url+'/styles/p2.jpg'
           },
           {
             'title': _('Photo Title'),
             'caption': _('Click here to edit the photo.'),
             'src': theme_url+'/styles/p3.jpg'
           }
         ]}}"
         ng-model="meta.series">

      <div class="col-sm-6 col-md-3 text-center item"
           ng-repeat="item in meta.series">
        <div series-item>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|thumbnail|bg_img}}" />
          </a>
        </div>
      </div>
      <div class="item col-xs-6 col-sm-3 text-center">
        <div series-item-create>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{g.add_img|bg_img}}" />
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
