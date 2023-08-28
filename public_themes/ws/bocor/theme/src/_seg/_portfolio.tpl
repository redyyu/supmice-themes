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

    <div class="col-sm-6 col-md-3 gallery-item"
         ng-repeat="item in page.series">
      <div class="item-hover">
        <img class="img-responsive thumbnail-img"
             ng-src="{{theme_url}}/styles/trans.png"
             style="{{item.src|bg_img}}">
      </div>
    </div>

  </div>
</div>