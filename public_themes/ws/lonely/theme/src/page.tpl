{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="primary-section">
  <div class="container">
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
      </div>
      <p class="wow bounceInUp">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
    </header>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"
             class="content"></div>
      </div>
    </div>
  </div>
</section>
