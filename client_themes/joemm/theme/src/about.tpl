{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}
<div id="orange">
  <div class="container">
    <div class="row centered">
      <div class="col-lg-8 col-lg-offset-2">
        <h4>
          <span sup-widget-text
                ng-model="meta.title"
                default="{{_('Title')}}"></span>
        </h4>
        <p>
          <span sup-widget-text
                ng-model="meta.description"
                default="{{_('Description text here')}}"></span>
        </p>
      </div>
    </div>
  </div>
</div>

<div class="container w">
  <div class="content"
       sup-angular-wysiwyg
       ng-model="content"
       default="{{_('$_CONTENT')}}"></div>
</div>

{% include '_footer_.tpl' %}