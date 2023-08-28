{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}">
  <div class="section-primary {{meta.bg.class}}"
       style="{{meta.bg.style}}">

    <div sup-widget-bg ng-model="meta.bg"></div>

    <div class="container">

      <div class="row centered section-header">
        <div class="col-md-8 col-md-offset-2">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
        </div>
      </div>

      <div class="row centered">

        <div class="col-md-6 text-right">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>

        <div class="col-md-6 centered">
          <div sup-widget-media
               ng-model="meta.featured_img">
            <img class="thumbnail-img"
                 ng-src="{{meta.featured_img.src||g.default_img}}"
                 alt="{{meta.featured_img.title}}" />
          </div>
        </div>

      </div>

    </div>

  </div>
</section>