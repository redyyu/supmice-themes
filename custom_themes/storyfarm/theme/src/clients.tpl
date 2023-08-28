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

<section class="no-padding no-border">
  <div class="container">
    <div class="row"
         sup-widget-series
         ng-model="meta.series">

      <div class="col-lg-3 col-md-4 col-sm-6 text-center"
           ng-repeat="item in meta.series">
        <a href="#"
           series-item>
          <img class="img-responsive img-client"
               ng-src="{{theme_url}}/styles/trans_16x10.png"
               style="{{item.src|thumbnail|bg_img}}">
        </a>
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6 text-center">
        <a href="#"
           series-item-create>
          <img class="img-responsive img-client"
               ng-src="{{theme_url}}/styles/trans_16x10.png"
               style="{{g.add_img|bg_img}}">
        </a>
      </div>

    </div>
  </div>
</section>

{% include '_footer.tpl' %}
