{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_header_.tpl' %}

<div class="container">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <h1 class="text-center">
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <div class="signature text-center">
        {{meta.author}}
        <span class="bullet">&bullet;</span>
        {{meta.date|date_formatted}}
      </div>
      <div class="featured">
        <div sup-widget-media
             ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src||g.default_img}}">
        </div>
      </div>
      <hr>
      <article sup-wx-broadcast class="content">
        <div sup-angular-wysiwyg
             ng-model="content"
             presets="g.content_presets"
             default="{{_('$_CONTENT')}}"></div>
        <div style="text-align: center; padding-top:30px;">
          <div sup-widget-media
               ng-model="meta.qr">
            <img ng-src="{{meta.qr.src||g.default_qr}}">
          </div>
        </div>
      </article>
    </div>
  </div>
</div>

{% include '_footer_.html' %}
