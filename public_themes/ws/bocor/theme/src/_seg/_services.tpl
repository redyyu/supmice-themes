<div class="container marginbot-50">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-2">
      <div class="section-heading text-center">
        <h2 class="h-bold">
          <div sup-bind-html="page.title"></div>
        </h2>
        <div class="divider-header"></div>
      </div>
    </div>
  </div>
</div>

<div class="container text-center">
  <div class="row">
    <!-- items -->
    <div class="col-sm-4"
         ng-repeat="item in page.series">
      <div class="service-box">
        <div class="service-icon">
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/styles/trans.png"
               style="{{item.src|bg_img}}">
        </div>
        <div class="service-desc">
          <h5 class="text-nowrap">
            {{item.title}}
          </h5>
          <div class="divider-header"></div>
          <p class="text-clamp-3">
            {{item.caption}}
          </p>
        </div>
      </div>
    </div>
    <!-- #items -->
  </div>
</div>