{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div class="team">
  <h3 class="heading">
    <span sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></span>
  </h3>
  <p class="desc">
    <span sup-editor-meta ng-model="meta.description" default="{{_('Description text here')}}"></span>
  </p>
  <div class="team_members">
    <div class="wrap" sup-editor-widget-gallery ng-model="meta.gallery">
      <div class="owl-carousel" style="display:block">
        <div class="owl-item" ng-repeat="item in meta.gallery | limitTo: 2 ">
          <div class="item">
            <div class="carousel">
                <a class="popup-with-zoom-anim" href="#small-dialog1">
                  <img ng-src="{{item.src}}"/>
                </a>
                <div class="caption-info">
                   <div class="caption-info-head">
                    <div class="caption-info-head-left">
                      <h4><a href="#">{{item.title}}</a></h4>
                      <span>{{item.caption}}</span>
                    </div>
                    <div class="clear"> </div>
                   </div>
                </div>
             </div>
          </div>
        </div>

        <div class="owl-item" ng-if="!meta.gallery || meta.gallery.length == 0">
          <div class="item">
            <div class="carousel">
                <a class="popup-with-zoom-anim" href="#small-dialog1">
                  <img ng-src="{{theme_url}}/styles/3.jpg"/>
                </a>
                <div class="caption-info">
                   <div class="caption-info-head">
                    <div class="caption-info-head-left">
                      <h4><a href="#">{{_('Title')}}</a></h4>
                      <span>{{_('Description text here')}}</span>
                    </div>
                    <div class="clear"> </div>
                   </div>
                </div>
             </div>
          </div>
        </div>
      </div>
    </div>
  </div>