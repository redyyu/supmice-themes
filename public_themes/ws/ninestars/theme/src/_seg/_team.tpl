<div class="container text-center">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <div class="section-heading marginbot-50">
        <h2 sup-bind-html="page.title"></h2>
        <p sup-bind-html="page.description"></p>
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <div class="row">

    <div class="col-sm-6 col-md-3 team-box"
         ng-repeat="item in page.series">
      <div>
        <div class="team boxed-gray">
          <div class="inner">
            <h5 class="text-nowrap">
              {{item.title}}
            </h5>
            <p class="subtitle text-nowrap">
              {{item.caption}}
            </p>
            <div class="avatar">
              <img ng-src="{{g.img_holder}}"
                   class="img-responsive thumbnail-img"
                   style="{{item.src|thumbnail|bg_img}}" />
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
</div>
