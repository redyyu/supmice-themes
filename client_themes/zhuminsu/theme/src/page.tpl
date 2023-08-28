{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
               default="{{_('Title')}}"
               ng-model="meta.title"></span>
        </h2>
        <hr class="light">
        <p>
          <span sup-widget-text
               default="{{_('Description text here')}}"
               ng-model="meta.description"></span>
        </p>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
        <hr>
      </div>
    </div>
  </div>
</section>

{% include '_footer.tpl' %}
