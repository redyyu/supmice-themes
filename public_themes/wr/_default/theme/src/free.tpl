{% import 'g.tpl' %}
{% include '_css_.tpl' %}

<div>
  <section id="{{meta.slug}}"
           class="section {{meta.hero.class}}"
           style="{{meta.hero.style}}">
    <div sup-widget-bg
         presets="g.bg_presets"
         ng-model="meta.hero"></div>
    <div class="container">
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content">
      </div>
    </div>
  </section>
</div>