{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
        <hr>
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <figure class="text-center"
                sup-widget-media
                ng-model="meta.featured_img">
          <img class="img-responsive"
               ng-src="{{meta.featured_img.src || g.default_img}}"
               alt="{{meta.featured_img.title}}" />
        </figure>
      </div>
    </div>
  </div>
</section>

<section class="no-padding no-border">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
        <hr>
      </div>
    </div>
  </div>
</section>

<section class="no-border">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <div class="row img-gallery attachments"
             sup-widget-series
             ng-model="meta.attachments">

          <div class="col-md-3 item"
               ng-repeat="pic in meta.attachments">
            <figure series-item>
              <a href="#"
                 class="img-popup"
                 title="{{pic.title}}">
                <img ng-src="{{theme_url}}/styles/trans_16x10.png"
                     class="img-responsive"
                     style="{{pic.src|thumbnail|bg_img}}"
                     alt="{{pic.title}}" />
              </a>
            </figure>
          </div>

          <div class="col-md-3 item">
            <figure series-item-create>
              <a href="#"
                 class="img-popup">
                <img ng-src="{{theme_url}}/styles/trans_16x10.png"
                     class="img-responsive"
                     style="{{g.add_img|bg_img}}"/>
              </a>
            </figure>
          </div>

        </div>
      </div>
    </div>
  </div>
</section>

{% include '_footer.tpl' %}
