{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="id-{{meta.slug}}">
  <div class="page section-primary {{meta.bg.class}}"
       style="{{meta.bg.style}}">
    <div sup-widget-bg
         presets="[{'key': 'palette-dark', 'label': 'Darkness'}]"
         ng-model="meta.bg"></div>
    <div class="container text-center">

      <div class="row">
        <div class="col-md-8 col-md-offset-2 section-header">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
        </div>
      </div>

      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </div>

    </div>
  </div>
</section>