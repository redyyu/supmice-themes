<section id="{{page.slug}}"
         class="common">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>
    <div class="row">
      <div class="col-md-5">
        <aside>
          <figure>
            <img ng-src="{{page.featured_img.src||g.default_img}}"
                 alt="{{page.featured_img.title}}"/>
          </figure>
        </aside>
      </div>
      <div class="col-md-7">
        <article>
          <div class="content"
               sup-bind-html="page.content"></div>
        </article>
      </div>
    </div>

  </div>
</section>