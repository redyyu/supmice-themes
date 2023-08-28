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
      <h2>
        <div sup-widget-text
             default="{{_('Title')}}"
             ng-model="meta.title"></div>
      </h2>
      <figure>
        <div sup-widget-media
             ng-model="meta.featured_img">
            <img ng-src="{{meta.featured_img.src || g.default_img}}"
                 alt="{{meta.featured_img.title}}" />
        </div>
      </figure>
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content">
      </div>
    </div>
  </section>
</div>