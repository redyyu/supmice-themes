<section id="{{page.slug}}"
         class="complex">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>

    <div class="row">

      <div class="folio col-md-3 col-sm-6"
           ng-repeat="item in page.series">
        <div>
          <div class="folio-wrapper">
            <a href="#"
               class="img-popup">
              <img class="thumbnail-img"
                   ng-src="{{theme_url}}/styles/trans_cover.png"
                   alt="{{item.title}}"
                   style="{{item.src|bg_img}}" />
            </a>
            <div class="label">
              <div class="label-text text-nowrap">
                {{item.title}}
              </div>
              <div class="label-bg"></div>
            </div>
          </div>
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
