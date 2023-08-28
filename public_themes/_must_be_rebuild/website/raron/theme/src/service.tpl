{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div class="services">
  <h3 class="heading"><div sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></div></h3>
  <p class="desc"><spans sup-editor-meta ng-model="meta.subtitle" default="{{_('SubTitle')}}"></spans></p>
  <div class="wrap">
  <div class="service_grids" sup-editor-widget-gallery ng-model="meta.gallery">
    <div class="grid1" ng-repeat="item in meta.gallery">     
      <img ng-src="{{item.src}}" alt="" />
      <div class="grid_sub">
        <h3><span>{{item.title}}</span></h3>
        <p>{{item.caption}}</p>
      </div>
      <div class="clear"> </div>
    </div>
    <div class="grid1" ng-if="!meta.gallery || meta.gallery.length == 0">
      <img ng-src="{{theme_url}}/styles/default_pic_61x61.jpg"/>
      <div class="grid_sub">
        <h3><span>{{_('Title')}}</span></h3>
        <p>{{_('Description text here')}}</p>
      </div>
      <div class="clear"> </div>
    </div>
    <div class="clear"> </div>
  </div>
  </div>
<div class="slider2">
  <div class=" bg_mask1 bg_mask2">
    <div class="wrap">
      <p>
        <img ng-src="{{theme_url+'/styles/lg.png'}}">
        <span sup-editor-meta ng-model="meta.description" default="{{_('Description text here')}}"></span>
        <img ng-src="{{theme_url+'/styles/lg.png'}}">
      </p>
      <h4><div sup-editor-meta ng-model="meta.smtitle" default="{{_('Title')}}"></div></h4>
    </div>
  </div>
</div>
</div>
