<section id="{{page.slug}}"
         class="primary-section text-center album"
         ng-class="{'bg-white': $odd,
                    'bg-gray': $even}">
  <div class="container" segment>
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2 sup-bind-html="page.title"></h2>
      </div>
      <p class="wow bounceInUp"
         sup-bind-html="page.description"></p>
    </header>
    <div class="row">

      <div class="col-sm-6 col-md-3 text-center item"
           ng-repeat="item in page.series">
        <div>
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|thumbnail|bg_img}}" />
          </a>
        </div>
      </div>

    </div>

  </div>
</section>
