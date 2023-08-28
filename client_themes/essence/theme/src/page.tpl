{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_header_.tpl' %}

<div class="jumbotron {{meta.bg.class}}"
     style="{{meta.bg.style || site_meta.bg.style}}">
 <div sup-widget-bg ng-model="meta.background"></div>
</div>

<div class="container wrap-box">
  <div class="contact-box">
      <h1 class="text-center">
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <div class="content"
           sup-angular-wysiwyg
           ng-model="content"
           default="{{_('$_CONTENT')}}"></div>
  </div>
</div>
{% include '_footer_.tpl' %}
