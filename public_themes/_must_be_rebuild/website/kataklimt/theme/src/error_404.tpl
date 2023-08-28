{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
<!--============================== content =================================-->
  <div id="content">
    <div class="container">
      <div class="row ">
        <div class="span12">
          <div class="block-404">
            <div sup-editor-media ng-model="meta.img404">
              <img class="img-404 thumbnail-img" ng-src="{{theme_url}}/img/bg770.png" style="background-image: url('{{meta.img404.src}}')">
            </div>
            <div class="box-404" sup-angular-wysiwyg ng-model="content">
              <h2>Sorry!</h2>
              <h3>404 page not found</h3>
              <p>Nam liber tempor cum soluta nobis eleifend option congue nihil doming id quod mazim placerat facer possim assum orem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy euismod.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
{% include '_footer.tpl' %}