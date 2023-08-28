{% import 'g.tpl' %}
{% include '_css_.tpl' %}

<div class="container">
  <div sup-widget-bg ng-model="meta.splash"></div>
  <div sup-widget-media ng-model="meta.logo"></div>
  <div>
    <img ng-src="{{meta.logo.src}}" />
    <img ng-src="{{meta.splash.src}}" />
  </div>
</div>

