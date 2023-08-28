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
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <h3 class="sec-title">
          <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
        </h3>
        <div class="content"
             sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"></div>
      </div>
    </div>
  </div>
</section>
