{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div sup-gap="10"></div>

<section id="{{meta.slug}}"
         class="segment {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg
       presets="[
         {'key': 'accent', 'label': _('Accent')},
         {'key': 'light', 'label': _('Lighten')}
       ]"
       ng-model="meta.bg"></div>
  <div class="container">
    <div class="row prd-group">
      <div class="col-md-4 col-md-push-4">
        <figure sup-widget-media
                ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || g.item_logo}}"
               class="{{meta.featured_img.class}}">
        </figure>
      </div>

      <div class="col-md-4 col-md-pull-4">
        <h3 class="sec-title">
          <span sup-widget-text
                default="{{_('Item Title')}}"
                ng-model="meta.left_title"></span>
        </h3>
        <h4 class="sec-subtitle">
          <span sup-widget-text
                default="{{_('Item Subtitle')}}"
                ng-model="meta.left_subtitle"></span>
        </h4>
        <figure class="padding"
                sup-widget-media
                ng-model="meta.item_left">
          <img ng-src="{{meta.item_left.src || g.default_img}}"
               class="{{meta.item_left.class}}">
        </figure>
      </div>

      <div class="col-md-4">
        <h3 class="sec-title">
          <span sup-widget-text
                default="{{_('Item Title')}}"
                ng-model="meta.right_title"></span>
        </h3>
        <h4 class="sec-subtitle">
          <span sup-widget-text
                default="{{_('Item Subtitle')}}"
                ng-model="meta.right_subtitle"></span>
        </h4>
        <figure class="padding"
                sup-widget-media
                ng-model="meta.item_right">
          <img ng-src="{{meta.item_right.src || g.default_img}}"
               class="{{meta.item_right.class}}">
        </figure>
      </div>

    </div>
  </div>
</section>
