{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_header_.tpl' %}

<!-- carousel begin -->
<div class="container product">
  <div class="col-md-4">
    <div sup-widget-media
         ng-model="meta.featured_img">
      <img class="thumbnail-img {{meta.featured_img.class}}"
           ng-src="{{meta.featured_img.src || g.default_folio}}" />
    </div>
  </div>
  <div class="col-md-7 col-md-offset-1 product-detail">
    <h1>
      <span sup-widget-text
            ng-model="meta.title"
            default="{{_('Title')}}"></span>
    </h1>
    <h4>
      <span sup-widget-text
            ng-model="meta.price"
            default="{{_('Price')}}"></span>
    </h4>
    <p>
      <span sup-widget-text
            ng-model="meta.description"
            default="{{_('Description text here')}}"></span>
    </p>
  </div>
</div>
<!-- carousel end -->

<div class="product-content">
  <div class="container">
    <div class="content"
         sup-angular-wysiwyg
         ng-model="content"
         default="{{_('$_CONTENT')}}">
    </div>
  </div>
</div>

{% include '_footer_.tpl' %}