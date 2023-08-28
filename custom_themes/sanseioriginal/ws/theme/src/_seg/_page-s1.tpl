<div class="row">
  <div class="col-md-6 align-right">
    <div class="padding">
      <img ng-src="{{page.featured_img.src}}"
           ng-class="{{page.featured_img.class}}">
    </div>
  </div>
  <div class="col-md-6 align-left">
    <h3 class="sec-title"
        sup-bind-html="page.title"></h3>
    <div class="content"
         sup-bind-html="page.content"></div>
  </div>
</div>
