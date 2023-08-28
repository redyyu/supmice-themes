<div class="portfolio section-primary {{page.bg.class}}"
     style="{{page.bg.style}}">

  <div class="container text-center">
    <div class="row">
      <div class="col-md-8 col-md-offset-2 section-header">
        <h2 ng-bind-html="page.title"></h2>
      </div>
    </div>
    <div class="row">

      <div class="col-sm-6 col-md-3 folio-item"
           ng-repeat="item in page.series">
        <div>
          <a href="#"
             class="img-popup">
            <img class="img-holder"
                 ng-src="{{g.img_holder}}"
                 style="{{item.src|thumbnail|bg_img}}" />
          </a>
        </div>
      </div>

    </div>

  </div>
</div>

<div class="section-content bg-white">
  <div class="container text-center">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             ng-bind-html="page.content"></div>
      </div>
    </div>
  </div>
</div>
