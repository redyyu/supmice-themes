<section id="{{page.slug}}"
         class="complex">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>

    <div class="row">

      <div class="service col-md-3 col-sm-6"
           ng-repeat="item in page.series">
        <div class="text-center">
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/styles/trans_cover.png"
               style="{{item.src|bg_img}}">
          <h2 class="text-nowrap">{{item.title}}</h2>
          <p class="caption text-clamp-3">{{item.caption}}</p>
        </div>
      </div>

    </div>
  </div>
  <div class="tagline">
    <div class="container">
      <h2 sup-bind-html="page.tagline"></h2>
    </div>
  </div>
</section>