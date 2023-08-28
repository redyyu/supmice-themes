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
  <div class="compact bg-glassy">
    <div class="container text-brighten">
      <div class="row">
        <div class="col-md-6 frame d-flex align-items-center mb-5 mb-md-0">
          <div class="content"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               ng-model="content">
          </div>
        </div>
        <div class="col-md-6 d-flex align-items-center">
          <figure sup-widget-media
                  ng-model="meta.featured_img">
            <img ng-src="{{meta.featured_img.src || g.default_img}}"/>
          </figure>
        </div>
      </div>
    </div>
  </div>
</section>
