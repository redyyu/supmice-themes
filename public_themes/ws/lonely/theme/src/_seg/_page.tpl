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
      <div class="col-md-8 col-md-offset-2">
        <div sup-bind-html="page.content"
             class="content"></div>
      </div>
    </div>
  </div>
</section>
