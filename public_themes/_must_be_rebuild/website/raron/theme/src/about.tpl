{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div class="about" id="about">
  <div class="wrap">
    <h2>
      <div sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></div>
    </h2>
    <h4>
      <div sup-editor-meta ng-model="meta.subtitle" default="{{_('SubTitle')}}"></div>
    </h4>
    <p class="para_a">
      <div sup-editor-meta ng-model="meta.description" default="{{_('Description text here')}}"></div>
    </p>
    <!---strat-top-grids -->
    <div class="top-grids">
      <div class="top-grid" sup-editor-widget-gallery ng-model="meta.spotlights">
        <div ng-repeat="item in meta.spotlights">
          <img ng-src="{{item.src}}"/>
          <a href="#">
            <div>{{item.title}}</div>
          </a>
          <p>
            <div>{{item.caption}}</div>
          </p>
        </div>

        <div ng-if="!meta.spotlights || meta.spotlights.length == 0"
         ng-repeat="i in [1,2,3]">
          <img ng-src="{{theme_url}}/styles/default_pic_61x61.jpg"/>
          <a href="#">
            <div>{{_('Title')}}</div>
          </a>
          <p>
            <div>{{_('Description text here')}}</div>
          </p>
        </div>
      </div>
      <div class="clear"> </div>
    </div>
    <!---End-top-grids -->
  </div>
  <div class="clients">
    <div class="bg_mask1">
      <div class="wrap">
        <div sup-angular-wysiwyg ng-model="content" default="{{_('$_CONTENT')}}"></div>
      </div>
    </div>
  </div>
</div>