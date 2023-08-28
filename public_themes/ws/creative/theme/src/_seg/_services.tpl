<section id="{{page.slug}}" class="segment-wrapper">

  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading"
            sup-bind-html="page.title">
        </h2>
        <hr class="divider">
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="item in page.series">
        <div class="service-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{item.src|bg_img}}">
          <h3 class="text-nowrap">
            {{item.title}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{item.caption}}
          </p>
        </div>
      </div>

    </div>
  </div>

</section>
