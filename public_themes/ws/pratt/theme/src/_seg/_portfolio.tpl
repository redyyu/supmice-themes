<div class="section-primary portfolio">
  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="carousel slide portfolio-gallery">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li ng-repeat="i in page.carousel"
                ng-class="{'active':$first}"></li>
          </ol>
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item"
                 ng-repeat="item in page.carousel"
                 ng-class="{'active': $first}">
              <img class="contain-img img-holder-cover"
                   ng-src="{{g.img_holder_cover}}"
                   style="{{item.src|bg_img}}">
            </div>
          </div>

        </div>
      </div>
    </div>

  </div>
</div>