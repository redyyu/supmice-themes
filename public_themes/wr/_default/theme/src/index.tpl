{% import 'g.tpl' %}
{% include '_css_.tpl' %}

<div>
  <section id="{{meta.slug}}"
           class="section {{meta.hero.class || 'primary-bg'}}"
           style="{{meta.hero.style}}">
    <div sup-widget-bg
         presets="g.bg_presets"
         ng-model="meta.hero"></div>
    <div class="container">
      <h1>
        <div sup-widget-text
             default="{{_('Title')}}"
             ng-model="meta.title"></div>
      </h1>
      <h3>
        <div sup-widget-text
             default="{{_('Description text here')}}"
             ng-model="meta.description"></div>
      </h3>
    </div>
  </section>
</div>