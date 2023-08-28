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
             'title': _('Works Title'),
             'src': theme_url+'/styles/p1.jpg'
           },
           {
             'title': _('Works Title'),
             'src': theme_url+'/styles/p2.jpg'
           },
           {
             'title': _('Works Title'),
             'src': theme_url+'/styles/p3.jpg'
           }
         ]}}"
         ng-model="meta.series">

      <div class="folio col-md-3 col-sm-6"
           ng-repeat="item in meta.series">
        <div series-item>
          <div class="folio-wrapper">
            <a href="#"
               class="img-popup">
              <img class="thumbnail-img"
                   ng-src="{{theme_url}}/styles/trans_cover.png"
                   alt="{{item.title}}"
                   style="{{item.src|bg_img}}" />
            </a>
            <div class="label">
              <div class="label-text text-nowrap">
                {{item.title}}
              </div>
              <div class="label-bg"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="folio col-md-3 col-sm-6">
        <div series-item-create>
          <div class="folio-wrapper">
            <a href="#"
               class="img-popup">
              <img class="thumbnail-img"
                   ng-src="{{theme_url}}/styles/trans_cover.png"
                   style="{{g.add_img|bg_img}}" />
            </a>
            <div class="label">
              <div class="label-text text-nowrap">
                {{_('New Works')}}
              </div>
              <div class="label-bg"></div>
            </div>
          </div>
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
