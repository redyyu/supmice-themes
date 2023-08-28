{% import "g.tpl" %}
{% include '_css_.tpl' %}

<div class="body {{meta.bg.class}}"
     palette="{{g.opts.palette}}"
     style="{{meta.bg.style}}">

  <section class="wrapper">
    <article class="container paper">
      <header class="upper">
        <h1>
          <span default="{{_('Error 404')}}"
                sup-widget-text ng-model="meta.title"></span>
        </h1>
      </header>
      <hr class="row">
      <!-- content -->
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_ERROR404')}}"
           ng-model="content">
      </div>
      <!-- #content -->
      <hr class="row">
    </article>
    {% include '_cr_.tpl' %}
  </section>
</body>
</html>
