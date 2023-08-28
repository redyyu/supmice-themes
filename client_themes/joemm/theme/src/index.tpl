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

<div class="container">
  <div id="columns">
    <div sup-query="works"
         ng-model="query.works">
      <figure ng-repeat="w in query.works.contents"
              sup-widget-open="w"
              ng-if="w.photo.src">
        <a href="#">
          <img ng-src="{{w.photo.src | thumbnail}}">
        </a>
        <figcaption>{{w.title}}</figcaption>
      </figure>
    </div>
  </div>
</div>

{% include '_footer_.tpl' %}
