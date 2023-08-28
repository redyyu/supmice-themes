<div class="container" segment>
  <div class="row">
    <div class="col-md-12">
      <header class="text-center">
        <h2 sup-bind-html="page.title"></h2>
      </header>
    </div>
    <div class="col-md-12">
      <div class="content textbox text-center"
           sup-bind-html="page.content">
      </div>
      <div class="imgbox">
        <img ng-src="{{page.featured_img.src || g.larger_img}}"
             alt="{{page.title}}"
             class="{{page.featured_img.class}}" />
      </div>
    </div>
  </div>
</div>