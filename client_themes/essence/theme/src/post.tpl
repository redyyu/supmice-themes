{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_header_.tpl' %}

<div class="jumbotron {{meta.bg.class}}"
     style="{{meta.bg.style || site_meta.bg.style}}">
<div sup-widget-bg ng-model="meta.bg"></div>
</div>

<div class="container wrap-box">
  <div class="post-box">
    <span class="post-title"
          sup-widget-text
          ng-model="meta.title"
          default="{{_('Title')}}"></span>
    <div class="post-subtitle">
      <span sup-widget-text
            ng-model="meta.description"
            default="{{_('Description text here')}}"></span>
    </div>
    <div>
      <img class="thumbnail-img"
           ng-src="{{theme_url}}/img/postbg.png"
           style="meta.featured_img.src|bg_img:g.default_img">
    </div>
    <div class="content"
         sup-angular-wysiwyg
         ng-model="content"
         default="{{_('$_CONTENT')}}"></div>
  </div>
</div>

{% include '_footer_.tpl' %}