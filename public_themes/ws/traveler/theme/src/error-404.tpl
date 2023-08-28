{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="wrapper">
  <div class="section-header ribbon-bg error-header">
    <div class="container">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Error 404')}}"></span>
          </h2>
        </div>
      </div>
    </div>
  </div>

  <div class="section-primary error">
    <div class="container">
      <div class="row centered">
        <div class="col-lg-8 col-lg-offset-2">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_ERROR404')}}"></div>
        </div>
      </div>
    </div>
  </div>

  {% include '_footer.tpl' %}
</div>