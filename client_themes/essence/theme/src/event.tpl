{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}

<div class="container wrap-box" style="top: 0;">
  <div class="activity-box">
    <div class="activity text-center">
      <h1>
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <p>
        <span sup-widget-text
              ng-model="meta.description"
              default="{{_('Description text here')}}"></span>
      </p>
      <div sup-widget-media
           ng-model="meta.featured_img">
        <img class="thumbnail-img"
         ng-src="{{theme_url}}/img/postbg.png"
         style="{{meta.featured_img.src|bg_img:g.default_img}">
      </div>
      <div class="content"
           sup-angular-wysiwyg
           ng-model="content"
           default="{{_('$_CONTENT')}}"></div>
    </div>
  </div>
</div>

{% include '_footer_.tpl' %}