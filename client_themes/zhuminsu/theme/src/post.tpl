{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
        <hr class="light">
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
      <div class="col-md-8 col-md-offset-2">
        <figure class="text-center">
          <div sup-widget-media
               ng-model="meta.featured_img">
            <img class="img-responsive"
                 ng-src="{{meta.featured_img.src||g.default_img}}" />
          </div>
        </figure>
      </div>
    </div>

    <div class="row">
      <div class="col-md-8 col-md-offset-2">
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
      <div class="col-md-8 col-md-offset-2">
        <div class="row img-gallery attachments"
             sup-widget-collection
             ng-model="meta.attachments">

          <div class="col-md-3 item"
               ng-repeat="pic in meta.attachments">
            <figure>
              <a href="#"
                 class="img-popup">
                <img ng-src="{{theme_url}}/styles/trans.png"
                     class="thumbnail-img"
                     style="{{'background-image:url('+
                              (pic.src|thumbnail)+');'}}"/>
              </a>
            </figure>
          </div>

          <div class="col-md-3 item"
               ng-if="!meta.attachments||meta.attachments.length==0"
               ng-repeat="i in [1,2,3,4]">
            <figure>
              <a href="#"
                 class="img-popup">
                <img ng-src="{{theme_url}}/styles/trans.png"
                     class="thumbnail-img"
                     style="background-image:url('{{g.default_img}}')" />
              </a>
            </figure>
          </div>

        </div>
      </div>
    </div>
  </div>
</section>

{% include '_footer.tpl' %}
