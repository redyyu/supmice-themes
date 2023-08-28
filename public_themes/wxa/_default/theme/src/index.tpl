{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_mini_top_navbar.tpl' %}

<page with-tabs>
  <page-inner class="page-inner"
              sup-query="product"
              ng-model="query.products">
    <!-- list -->
    <div class="grid-list"
         ng-if="query.products.length">
      <div class="grid"
           ng-repeat="product in query.products">
        <div class="card">
          <div>
            <img class="img-bg-cover"
                 ng-src="{{g.img_trans}}"
                 style="{{(product.featured_img.src||g.default_img)|bg_img}}">
          </div>
          <div class="card-content">
            <p class="title">{{product.title}}</p>
            <p class="text accent">¥ {{product.price|price}}</p>
          </div>
        </div>
      </div>
    </div>
    <!-- empty list -->
    <div class="fullscreen flex-column justify-center"
         ng-if="!query.products.length">
      <div class="text-center">
        <h2 class="headline text-uppper primary">
          {{_('There is no product')}}
        </h2>
        <p class="text">{{_('Please add some product first.')}}</p>
      </div>
    </div>
  </page-inner>
</page>

{% include '_mini_bottom_tabs.tpl' %}
