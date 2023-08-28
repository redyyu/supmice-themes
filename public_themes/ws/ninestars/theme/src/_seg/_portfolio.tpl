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

    <div class="col-sm-6 col-md-3 gallery-box"
         ng-repeat="work in page.series">
      <div>
        <a href="#">
          <img ng-src="{{g.img_holder}}"
               class="img-responsive thumbnail-img"
               style="{{work.src|thumbnail|bg_img}}">
        </a>
      </div>
    </div>

  </div>
</div>