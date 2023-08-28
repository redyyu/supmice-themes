{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}

<div class="jumbotron {{meta.bg.class}}"
     style="{{meta.bg.style || site_meta.bg.style}}">
  <div sup-widget-bg ng-model="meta.bg"></div>
</div>

<div class="container wrap-box">
  <div class="activity-box"
       sup-query="event"
       ng-model="query.event">

    <div class="activity text-center"
         ng-repeat="e in query.event.contents"
         sup-widget-open="e">
      <h2>{{e.title}}</h2>
      <p>{{e.descrption}}</p>
      <img class="thumbnail-img"
           ng-src="{{e.featured_img.src}}">
    </div>

    <div class="activity text-center"
         sup-widget-create
         type="event">
      <h2>{{_('Create New Event')}}</h2>
      <p>{{_('Click here to create a new event.')}}</p>
      <img class="thumbnail-img"
           ng-src="{{theme_url}}/img/default_img.png">
    </div>
  </div>
</div>

{% include '_footer_.tpl' %}