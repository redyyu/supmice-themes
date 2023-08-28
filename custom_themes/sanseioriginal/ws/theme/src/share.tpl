{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg
       presets="[
         {'key': 'accent', 'label': _('Accent')},
         {'key': 'light', 'label': _('Lighten')}
       ]"
       ng-model="meta.bg"></div>
  <div class="container hero-inner">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <h3 class="sec-title">
          <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
        </h3>
        <div style="height: 100px; background: red;"
             sup-widget-catalog="major"
             ng-model="meta.catalog"></div>
        <div class="content"
             sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"></div>
      </div>
    </div>
  </div>
</section>

</div>

{% include '_footer.tpl' %}
