{% import "g.tpl" %}
{% include '_css_.tpl' %}

<div class="cover {{meta.bg.class}}"
     palette="{{g.opts.palette}}"
     style="{{meta.bg.style}}">

  <div sup-widget-bg ng-model="meta.bg"></div>

  <div class="wrapper">
    <a href="#"
       class="entrance {{meta.entrance.class}}"
       sup-widget-link
       allow-fields="figure, name"
       ng-model="meta.entrance">
      <img ng-if="meta.entrance.figure"
           ng-src="{{meta.entrance.figure}}" />
      <span ng-if="!meta.entrance.figure">
        {{ meta.entrance.name || _('Title') }}
      </span>
    </a>
  </div>
  {% include "_cr_.tpl" %}
</div>
