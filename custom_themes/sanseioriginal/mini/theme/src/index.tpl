{% import 'g.tpl' %}
{% include '_css_.tpl' %}

<div class="container">
  <h1>Title</h1>
  <div sup-widget-carousel
       link-to-type="product"
       ng-model="meta.carousel">
    <div ng-repeat="slide in meta.carousel">
      <img ng-src="{{slide.src}}" />
    </div>
  </div>
</div>

