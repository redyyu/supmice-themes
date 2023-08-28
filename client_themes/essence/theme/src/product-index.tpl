{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_header_.tpl' %}

<!-- carousel begin -->
<div class="container-full">
  <div id="carousel"
       class="carousel slide"
       data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carousel"
          data-slide-to="1"
          class="active"></li>
    </ol>
    <div class="carousel-inner"
         role="listbox">
      <div class="item active"
           sup-widget-carousel
           ng-model="meta.carousel">
        <img class="thumbnail-img"
             ng-src="{{theme_url}}/img/carouselbg.png"
             style="{{meta.carousel[0].src|bg_img:g.default_img}}">
      </div>
    </div>
  </div>
</div>
<!-- carousel end -->

<div class="container">
  <div class="wrap-products">

    <div class="row"
         sup-query="product"
         ng-model="query.product">

      <div class="col-sm-6 col-md-3 products"
           ng-repeat="p in query.product.contents"
           sup-widget-open="p">
        <a href="#">
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/img/foliobg.png"
               style="{{p.featured_img.src|bg_img}}">
          <div class="product-text">
            <p>{{p.title}}</p>
            <p>
              <span>{{p.tip}}</span>
              <span class="product-price">{{p.price}}</span>
            </p>
          </div>
        </a>
      </div>

    </div>

    <ul class="pager">
      <li class="previous">
        <a href="#">
          &larr; {{_('Previous')}}
        </a>
      </li>
      <li class="next">
        <a href="#">
          {{_('Next')}} &rarr;
        </a>
      </li>
    </ul>

  </div>
</div>

{% include '_footer_.tpl' %}
