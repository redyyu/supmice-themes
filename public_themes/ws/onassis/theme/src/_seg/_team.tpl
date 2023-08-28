<div class="team section-primary"
     ng-class="{'palette-gray': $odd}">
  <div class="container text-center">

    <div class="row">
      <div class="col-md-8 col-md-offset-2 section-header">
        <h2 ng-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             ng-bind-html="page.content"></div>
      </div>
    </div>

    <div class="row">

      <div class="col-sm-6 col-md-3 team-item"
           ng-repeat="item in page.series">
        <div>
          <div class="avatar">
            <img class="img-circle img-holder"
                 ng-src="{{g.img_holder}}"
                 style="{{item.src|thumbnail|bg_img}}">
          </div>
          <h4 class="text-nowrap">{{item.title}}</h4>
          <p class="text-clamp-4">{{item.caption}}</p>
        </div>
      </div>

    </div>

</div>