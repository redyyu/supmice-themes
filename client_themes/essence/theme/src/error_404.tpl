{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}

<div class="container text-center wrap-error">
  <h1>
    <span sup-widget-text
          ng-model="meta.title"
          default="{{_('Error 404')}}"></span>
  </h1>
  <h2>
    <span sup-widget-text
          ng-model="meta.description"
          default="{{_('Can not find the page.')}}"></span>
  </h2>
</div>

{% include '_footer_.tpl' %}
