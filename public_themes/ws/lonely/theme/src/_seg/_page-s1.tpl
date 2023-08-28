<section id="{{page.slug}}"
         class="primary-section"
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
      <div class="col-md-6">
        <div sup-bind-html="page.content"
             class="content"></div>
      </div>
      <div class="col-md-6 text-center">
        <div>
          <img ng-src="{{page.featured_img.src || g.default_img}}"
               alt="{{page.featured_img.title}}"/>
        </div>
      </div>
    </div>
  </div>
</section>
