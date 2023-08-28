{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="complex">
  <div class="container">
    <header>
      <h2>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h2>
      <p>
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
    </header>

    <div class="row"
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
           },
           {
             'title': _('Service Title'),
             'caption': _('Click here to edit the service.'),
             'src': theme_url+'/styles/f3.png'
           },
         ]}}"
         ng-model="meta.series">

      <div class="service col-md-3 col-sm-6"
           ng-repeat="item in meta.series">
        <div class="text-center"
             series-item>
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/styles/trans_cover.png"
               style="{{item.src|bg_img}}">
          <h2 class="text-nowrap">{{item.title}}</h2>
          <p class="caption text-clamp-3">{{item.caption}}</p>
        </div>
      </div>

      <div class="service col-md-3 col-sm-6">
        <div class="text-center"
             series-item-create>
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/styles/trans_cover.png"
               style="{{g.add_img|bg_img}}">
          <h2 class="text-nowrap">
            {{_('New Service')}}
          </h2>
          <p class="caption text-clamp-3">
            {{_('Click here add a new service.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
  <div class="tagline">
    <div class="container">
      <h2>
        <span sup-widget-text
              default="{{_('Add a Tagline here')}}"
              ng-model="meta.tagline"></span>
      </h2>
    </div>
  </div>
</section>
