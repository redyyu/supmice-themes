<div class="container text-center">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-2">
      <div class="section-heading marginbot-50">
        <h2 sup-bind-html="page.title"></h2>
        <p sup-bind-html="page.description"></p>
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <div class="row">

    <div class="col-sm-6 col-sm-3 service-box"
         ng-repeat="item in page.series">
      <div>
        <div class="service-icon">
          <img ng-src="{{g.img_holder}}"
               class="img-responsive thumbnail-img"
               style="{{item.src|thumbnail|bg_img}}" />
        </div>
        <div class="service-desc">
          <h5 class="text-nowrap">{{item.title}}</h5>
          <p class="text-clamp-4">{{item.caption}}</p>
        </div>
      </div>
    </div>

  </div>
</div>
