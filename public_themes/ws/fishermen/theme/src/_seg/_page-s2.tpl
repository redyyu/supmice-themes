<div class="container" segment>
  <div class="row">
    <div class="col-md-6 pull-left textbox aside">
      <header>
        <h2 sup-bind-html="page.title"></h2>
      </header>
      <div class="content"
           sup-bind-html="page.content">
      </div>
    </div>
    <div class="col-md-6 pull-right imgbox">
      <img ng-src="{{page.featured_img.src || g.default_img}}"
           alt="{{page.featured_img.title}}"
           class="{{page.featured_img.class}}"/>
    </div>
  </div>
</div>