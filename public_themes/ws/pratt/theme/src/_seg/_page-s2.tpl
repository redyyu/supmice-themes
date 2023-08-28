<div class="section-primary {{page.bg.class}}"
     style="{{page.bg.style}}">

  <div class="container" segment>

    <div class="row centered section-header">
      <div class="col-md-8 col-md-offset-2">
        <h2 sup-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row centered">

      <div class="col-md-6 text-right">
        <div class="content"
             sup-bind-html="page.content"></div>
      </div>

      <div class="col-md-6 centered">
        <img class="thumbnail-img"
             ng-src="{{page.featured_img.src||g.default_img}}"
             alt="{{page.featured_img.title}}" />
      </div>

    </div>

  </div>

</div>