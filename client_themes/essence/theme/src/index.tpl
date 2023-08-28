{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_header_.tpl' %}

<!-- carousel begin -->
<div class="container-full">
  <div id="carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carousel" data-slide-to="1" class="active"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
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

<!-- culture begin -->
<div class="wrap-white">
  <div class="container text-culture">
    <div class="col-md-4 content">
      <div sup-angular-wysiwyg
           ng-model="content"
           default="{{_('$_CONTENT')}}"></div>
    </div>
    <div class="col-md-8">
      <div sup-widget-media
           ng-model="meta.culture_img">
        <img class="thumbnail-img"
             ng-src="{{meta.culture_img.src||g.default_img}}" />
      </div>
    </div>
  </div>
</div>
<!-- culture end -->

<!-- event begin -->
<div class="wrap-bluegrey">
  <div class="container text-center event-box">
    <h2>
      <span sup-widget-text
            ng-model="meta.event_title"
            default="{{_('Title')}}"></span>
    </h2>
    <h3>
      <span sup-widget-text
            ng-model="meta.event_description"
            default="{{_('Description text here')}}"></span>
    </h3>
    <ul class="event-portfolio"
        sup-query="event"
        perpage="3"
        ng-model="query.event">
      <li class="col-sm-6 col-md-3">
        <div class="e-box"
             sup-widget-create
             type="event">
          <img class="thumbnail-img"
               ng-src="{{g.default_folio}}">
          <div class="e-box-caption">
            <div class="e-box-caption-content">
              <h4>{{_('Create New Event')}}</h4>
              <p class="text-nowrap">
                {{_('Click here to create a event.')}}
              </p>
              <a href="#" class="btn-bluegrey">{{_('More')}}</a>
            </div>
          </div>
        </div>
      </li>
      <li class="col-sm-6 col-md-3"
          ng-repeat="e in query.event.contents">
        <div class="e-box"
             sup-widget-open="e">
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/img/foliobg.png"
               style="{{e.featured_img.src|bg_img}}">
          <div class="e-box-caption">
            <div class="e-box-caption-content">
              <h4>{{e.title}}</h4>
              <h5 class="text-nowrap">{{e.description}}</h5>
              <a href="#" class="btn-bluegrey">{{_('More')}}</a>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
</div>
<!-- event end -->

<!-- products begin -->
<div class="wrap-white">
  <div class="container text-center">
    <h2>
      <span sup-widget-text
            ng-model="meta.folio_title"
            default="{{_('Title')}}"></span>
    </h2>
    <h3>
      <span sup-widget-text
            ng-model="meta.folio_description"
            default="{{_('Description text here')}}"></span>
    </h3>

    <ul class="product-box"
        sup-query="product"
        perpage="11"
        ng-model="query.product">

      <li class="portfolio col-sm-6 col-md-3 text-left"
          sup-widget-create
          type="product">
        <a href="#">
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/img/default_folio.png">
          <div class="product-text">
            <p>{{_('Create New Product')}}</p>
            <p>
              <span>{{_('Tip')}}</span>
              <span class="product-price">
                {{_('Price')}}
              </span>
            </p>
          </div>
        </a>
      </li>

      <li class="portfolio col-sm-6 col-md-3 text-left"
          ng-repeat="p in query.product.contents"
          sup-widget-open="p">
        <a href="#">
          <img class="thumbnail-img"
               ng-src="{{theme_url}}/img/foliobg.png"
               style="p.featured_img.src">
          <div class="product-text">
            <p>{{p.title}}</p>
            <p>
              <span>{{p.tip}}</span>
              <span class="product-price">{{p.price}}</span>
            </p>
          </div>
        </a>
      </li>
    </ul>
  </div>
</div>
<!-- products end -->

{% include '_footer_.tpl' %}