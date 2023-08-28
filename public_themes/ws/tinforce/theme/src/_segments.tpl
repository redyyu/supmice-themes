<!-- page -->
<sup-template id="page">
  <div class="container">
    <div class="row justify-content-center">
      <article class="col-md-8 text-center">
        <header>
          <h2>{{page.title}}</h2>
        </header>
        <div sup-bind-html="page.content"></div>
      </article>
    </div>
  </div>
</sup-template>


<!-- page-column -->
<sup-template id="page-column">
  <div class="container">
    <div class="row">
      <article class="col-md">
        <header>
          <h2>{{page.title}}</h2>
        </header>
        <div sup-bind-html="page.content"></div>
      </article>
      <div class="col-md text-center">
        <figure>
          <img ng-src="{{page.featured_img.src || g.default_img}}" />
        </figure>
      </div>
    </div>
  </div>
</sup-template>


<!-- features -->
<sup-template id="features">
  <div class="container">
    <div class="row">
      <div class="col-md-4 text-center"
           ng-repeat="item in page.series">
        <div class="feature {{item.class}}">
          <div>
            <figure class="mx-auto mb-4">
              <img class="icon"
                   ng-src="{{g.trans}}"
                   style="{{item.src|bg_img}}"
                   alt="{{item.title}}" />
            </figure>
            <h2 class="title text-truncate">
              {{item.title || '&nbsp;'}}
            </h2>
            <p class="text-clamp-6">
              {{item.caption || '&nbsp;'}}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</sup-template>


<!-- portfolio -->
<sup-template id="portfolio">
  <div class="container"
       sup-query='works'
       perpage='8'
       ng-model="query.works">
    <div class="carousel slide portfolio">
      <ol class="carousel-indicators">
        <li class="{{$first ? 'active' : ''}}"
            ng-repeat="x in [1,2,3]"></li>
        <li class="more">
          <a href="#"></a>
        </li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="container">
            <div class="row media-gallery">
              <figure class="col-6 col-lg-3"
                      ng-repeat="item in query.works.contents">
                <a href="#">
                  <div class="flip">
                    <div class="text-truncate">
                      {{item.title || item.slug}}
                    </div>
                  </div>
                  <img ng-src="{{g.trans}}"
                       style="{{item.featured_img.src|thumbnail|bg_img}}" />
                </a>
              </figure>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</sup-template>