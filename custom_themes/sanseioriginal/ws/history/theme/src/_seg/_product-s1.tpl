<div class="container">
  <div class="row prd-group">
    <div class="col-md-4 col-md-push-4">
      <figure ng-if="page.featured_img.src">
        <img ng-src="{{page.featured_img.src}}"
             ng-class="{{page.featured_img.class}}">
      </figure>
    </div>

    <div class="col-md-4 col-md-pull-4">
      <h3 class="sec-title"
          sup-bind-html="page.left_title"></h3>
      <h4 class="sec-subtitle"
          sup-bind-html="page.left_subtitle"></h4>
      <figure class="padding"
              ng-if="page.item_left.src">
        <img ng-src="{{page.item_left.src}}"
             ng-class="{{page.item_left.class}}">
      </figure>
    </div>

    <div class="col-md-4">
      <h3 class="sec-title"
          sup-bind-html="page.right_title"></h3>
      <h4 class="sec-subtitle"
          sup-bind-html="page.right_subtitle"></h4>
      <figure class="padding"
              ng-if="page.item_right.src">
        <img ng-src="{{page.item_right.src}}"
             ng-class="{{page.item_right.class}}">
      </figure>
    </div>

  </div>
</div>