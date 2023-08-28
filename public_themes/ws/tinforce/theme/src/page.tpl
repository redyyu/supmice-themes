{% include 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}" class="segment">
  <div class="container">
    <div class="row justify-content-center">
      <article class="col-md-8 mb-4 text-center">
        <header>
          <h2 sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></h2>
        </header>
        <div sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"></div>
      </article>
    </div>
  </div>
</section>
