{% import 'g.tpl' %}
{% include '_css.tpl' %}

<sup-body class="parallax-major" style="{{meta.hero.style}}"></sup-body>

{% include '_header.tpl' %}
<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}">
  <div sup-widget-bg
       ng-model="meta.hero"
       presets="[
          {'key': 'inverted', 'label': _('Inverted')},
       ]"></div>
</section>

<!-- endorsement -->
<section class="segment">
  <div class="compact">
    <div class="container">
      <div class="row"
           sup-widget-series
           default="{{[
              {
                'src': theme_url+'/assets/feature.png',
                'caption': 'Description text here'
              },
              {
                'src': theme_url+'/assets/feature.png',
                'caption': 'Description text here'
              }
           ]}}"
           allow-fields="link, !title"
           ng-model="meta.features">

        <div class="col-md-4 mb-4"
             ng-repeat="item in meta.features">
          <div class="text-center {{item.class}}"
               series-item>
            <figure class="m-auto px-lg-3 py-3">
              <img class="thumbnail minify bg-contain"
                   ng-src="{{g.trans_4x7}}"
                   style="{{item.src|bg_img}}"
                   alt="{{item.title}}"/>
            </figure>
            <h6 class="px-5">{{item.caption}}</h6>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="text-center {{item.class}}"
               series-item-create>
            <figure class="m-auto px-lg-3 py-3">
              <img class="thumbnail minify bg-contain"
                   ng-src="{{g.trans_4x7}}"
                   style="{{theme_url+'/assets/add_feature.png'|bg_img}}"
                   alt="{{item.title}}"/>
            </figure>
            <h6 class="px-5">{{_('Add New Feature')}}</h6>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>


<!-- scenes -->
<section class="segment">
  <div id="PRD-GALLERY-CAROUSEL"
       class="carousel slide"
       sup-widget-carousel="major"
       default="{{[
         {
           'src': g.default_img
         },
       ]}}"
       allow-fields="!caption, !link, !target"
       ng-model="meta.carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="w-100 bg-cover"
             ng-src="{{g.trans_2x5}}"
             style="{{meta.carousel[0].src|bg_img}}"
             alt="{{meta.carousel[0].src.title}}"/>
      </div>
    </div>
    <a class="carousel-control-prev"
       href="#PRD-GALLERY-CAROUSEL"
       role="button"
       data-slide="prev">
      <span class="carousel-control-prev-icon"
            aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next"
       href="#PRD-GALLERY-CAROUSEL"
       role="button"
       data-slide="next">
      <span class="carousel-control-next-icon"
            aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</section>


<!-- spec -->
<section class="segment {{meta.specbg.class}}"
         style="{{meta.specbg.style}}">
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.specbg"></div>
  <div class="compact">
    <div class="container">
      <div class="row">
        <div class="col-md-6 listbox mb-5 mb-md-0"
             sup-widget-lines
             default="{{[_('Spec Title|Spec text is here')]}}"
             ng-model="meta.spec">
          <ul>
            <li ng-repeat="item in meta.spec"
                ng-init="_text = item.text.split('|')">
              <div class="row">
                <div class="col-md-4">
                  <b>{{_text[0]}}</b>
                </div>
                <div class="col-md-8">
                  <span>{{_text[1]}}</span>
                </div>
              </div>
            </li>
          </ul>
        </div>
        <div class="col-md-6 d-flex align-items-center">
          <figure class="m-auto"
                  sup-widget-media
                  ng-model="meta.spec_img">
            <img ng-src="{{meta.spec_img.src || g.default_img}}"/>
          </figure>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- spotlight -->
<section class="segment {{meta.spotlightbg.class}}"
         style="{{meta.spotlightbg.style}}">
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.spotlightbg"></div>
  <div class="compact bg-glassy">
    <div class="container text-brighten">
      <div class="row">
        <div class="col-md-6 offset-md-6 frame d-flex align-items-center">
          <div class="content"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               metakey="spotlight"
               ng-model="meta.spotlight">
            {{meta.spotlight}}
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- factory -->
<section class="segment">
  <div>
    <div class="container">
      <header class="divide">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.factory_title"></span>
        </h2>
      </header>
      <div class="row">
        <div class="col-md-6 content mb-5 mb-md-0">
          <div sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               metakey="factory_content"
               ng-model="meta.factory_content">
          </div>
        </div>
        <div class="col-md-6"
             sup-widget-series
             default="{{[
                {
                  'src': g.default_img,
                }
             ]}}"
             allow-fields="!title, !caption"
             limit="2"
             ng-model="meta.factory_gallery">
          <div class="d-block d-md-flex flex-row">
            <figure class="p-2 w-100 text-center"
                    ng-repeat="fpic in meta.factory_gallery"
                    series-item>
              <img class="thumbnail"
                   ng-src="{{g.trans_4x7}}"
                   style="{{fpic.src|bg_img}}"/>
            </figure>
            <figure class="p-2 w-100 text-center"
                    series-item-create>
              <img class="thumbnail"
                   ng-src="{{g.trans_4x7}}"
                   style="{{g.default_img|bg_img}}"/>
            </figure>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- delivery -->
<section class="segment {{meta.deliverybg.class}}"
         style="{{meta.deliverybg.style}}">
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.deliverybg"></div>
  <div class="bg-glassy">
    <div class="container text-brighten">
      <header class="divide">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.delivery_title"></span>
        </h2>
      </header>
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           metakey="delivery_content"
           ng-model="meta.delivery_content">
      </div>
    </div>
  </div>
</section>

{% include '_footer.tpl' %}