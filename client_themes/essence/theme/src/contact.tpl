{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}

<div class="jumbotron {{meta.bg.class}}"
     style="{{meta.bg.style || site_meta.bg.style}}">
  <div sup-widget-bg ng-model="meta.bg"></div>
</div>

<div class="container wrap-box">
  <div class="contact-box text-center">
    <h1>
      <span sup-widget-text
            ng-model="meta.title"
            default="{{_('Title')}}"></span>
    </h1>
    <hr class="post-hr" />
    <p>
      <span sup-widget-text
            ng-model="meta.description"
            default="{{_('Description text here')}}"></span>
    </p>
    <div sup-widget-media
         ng-model="meta.contact_img">
      <img class="thumbnail-img"
           ng-src="{{theme_url}}/img/postbg.png"
           style="{{meta.contact_img.src|bg_img:g.default_img}}">
    </div>
    <div class="content"
         sup-angular-wysiwyg
         ng-model="content"
         default="{{_('$_CONTENT')}}"></div>
  </div>
</div>

{% include '_footer_.tpl' %}