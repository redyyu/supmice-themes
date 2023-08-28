{% include 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}" class="segment">
  <div class="container">
    <div class="row">
      <article class="col-md mb-4">
        <header>
          <h2 sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></h2>
        </header>
        <div sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"></div>
      </article>
      <div class="col-md mb-4 text-center">
        <figure sup-widget-media
                ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || g.default_img}}" />
        </figure>
      </div>
    </div>
  </div>
</section>