{% import 'g.tpl' %}
{% include '_css.tpl' %}

<div class="wrapper">
  {% include '_header.tpl' %}

  <!-- banner -->
  <div class="container">
    <div id="carousel"
         class="carousel slide"
         sup-widget-carousel
         default="{{[
           {'src': g.default_banner}
         ]}}"
         ng-model="meta.carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
          <li ng-repeat="item in meta.carousel"
              ng-class="{'active': $first}"></li>
      </ol>
      <!-- /Indicators -->
       <!-- carousel -->
       <div class="carousel-inner">
          <div class="active">
            <img ng-src="{{g.img_holder_cover}}"
                 class="img-holder carousel-holder"
                 style="{{meta.carousel[0].src|bg_img}}"/>
          </div>
       </div>
       <!-- /carousel -->
       <a class="carousel-control left"
          href="#"
          data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left"
               aria-hidden="true"></span>
       </a>
       <a class="carousel-control right"
          href="#"
          data-slide="next">
         <span class="glyphicon glyphicon-chevron-right"
               aria-hidden="true"></span>
       </a>
    </div>
  </div>
  <!-- /banner -->

  <div class="container">
    <div class="row"
         sup-query='product'
         perpage='6'
         ng-model="query.products">

      <div class="col-md-4 col-sm-6 col-xs-12 prd">
        <div sup-widget-create type="product">
          <a href="#">
            <img ng-src="{{g.img_holder}}"
                 class="{{item.class}} img-holder"
                 style="{{g.add_img|bg_img}}"/>
          </a>
        </div>
      </div>

      <div class="col-md-4 col-sm-6 col-xs-12 prd"
           ng-repeat="prd in query.products.contents">
        <div sup-widget-open
             file="prd">
          <a href="#">
    		    <img ng-src="{{g.img_holder}}"
                 class="img-holder"
                 style="{{(prd.featured_img.src || g.default_img)|bg_img}}"/>
    	    </a>
        </div>
      </div>

    </div>
  </div>

</div>
{% include '_footer.tpl' %}