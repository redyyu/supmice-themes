{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="segment {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.bg"></div>
  <div>
    <div class="container">
      <header class="divide">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
      </header>
      <div class="m-auto text-center">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
      </div>
    </div>
  </div>
</section>
