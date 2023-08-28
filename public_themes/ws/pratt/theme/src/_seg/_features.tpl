<div class="section-primary features">
  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row centered">
      <div class="col-md-4 feature-item"
           ng-repeat="item in page.series">
        <div>
          <img class="img-holder {{item.class}}"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}">
          <h3 class="text-nowrap">{{item.title}}</h3>
          <p class="text-clamp-3">{{item.caption}}</p>
        </div>
      </div>
    </div>

  </div>
</div>