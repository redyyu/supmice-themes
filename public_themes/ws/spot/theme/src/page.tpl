{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="section-header blue-bg">
  <div class="container">
    <div class="row centered">
      <div class="col-md-8 col-md-offset-2">
        <h2>
          <span sup-widget-text
                ng-model="meta.title"
                default="{{_('Title')}}"></span>
        </h2>
        <p>
          <span sup-widget-text
                ng-model="meta.description"
                default="{{_('Description text here')}}"></span>
        </p>
      </div>
    </div>
  </div>
</div>

<div class="section-primary page">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"></div>
      </div>
    </div>
  </div>
</div>

{% include '_footer.tpl' %}
