{% import "g.tpl" %}
{% include '_css_.tpl' %}

<div class="body {{meta.bg.class}}"
     palette="{{g.opts.palette}}"
     style="{{meta.bg.style}}">
  <div sup-widget-bg ng-model="meta.bg"></div>

  {% include '_nav_.tpl' %}
  <section class="wrapper">
    <article class="container paper">
      <figure class="row"
              ng-if="meta.featured_img.src"
              sup-widget-media
              ng-model="meta.featured_img">
        <img class="img-responsive banner"
             ng-src="{{meta.featured_img.src}}">
      </figure>
      <header class="upper">
        <h1>
          <span default="{{_('Title')}}"
                sup-widget-text
                ng-model="meta.title"></span>
        </h1>
      </header>
      <hr class="row">
      <!-- content -->
      <div class="content"
           default="{{_('$_CONTENT')}}"
           sup-angular-wysiwyg
           ng-model="content">
      </div>
      <!-- #content -->
      <hr class="row">
    </article>
    {% include '_cr_.tpl' %}
  </section>
  {% include '_sider_.tpl' %}
</body>
</html>
