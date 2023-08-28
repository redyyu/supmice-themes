<div class="page section-primary {{page.bg.class}}"
     ng-class="{'palette-gray': $odd}"
     style="{{page.bg.style}}">
  <div class="container text-center">

    <div class="row">
      <div class="col-md-8 col-md-offset-2 section-header">
        <h2 ng-bind-html="page.title"></h2>
      </div>
    </div>

    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             ng-bind-html="page.content"></div>
      </div>
    </div>

  </div>
</div>
