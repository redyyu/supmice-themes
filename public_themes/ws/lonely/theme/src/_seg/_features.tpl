<section id="{{page.slug}}"
         class="primary-section parallax features {{page.bg.class}}"
         style="{{page.bg.style}}">
  <div class="container" segment>
    <header class="section-header">
      <div class="wow bounceInDown">
        <h2 sup-bind-html="page.title"></h2>
      </div>
      <p class="wow bounceInUp"></p>
    </header>
    <div class="row">

      <div class="col-sm-6 col-md-3 text-center item"
           ng-repeat="item in page.series">
        <figure class="icon">
          <img class="icon img-responsive"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}">
          <figcaption class="info text-clamp-2">
            <p>{{item.title}}</p>
          </figcaption>
        </figure>
      </div>

    </div>
  </div>
</section>