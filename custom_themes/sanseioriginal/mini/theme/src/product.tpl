{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_mini_top_navbar.tpl' %}

<page>
  <page-inner>
    <!-- carousel -->
    <div class="carousel {{meta.featured_img.class}} img-bg-cover"
         sup-widget-carousel
         ng-model="meta.carousel"
         style="{{(meta.featured_img.src || g.default_img)|bg_img}}"
         sup-ico-inset="bottom right">
    </div>

    <!-- shelf -->
    <div class="container padding">
      <header>
        <h4 class="title"
            sup-widget-text
            ng-model="meta.subtitle">
          {{meta.subtitle}}
        </h4>
        <h2 class="headline">
          <span sup-widget-text
                ng-model="meta.title"
                default="{{_('Title')}}"></span>
        </h2>
      </header>
      <div sup-widget-catalog
           ng-model="meta.catalog">
        Catalog
      </div>
      <div class="product"
           sup-widget-shelf
           ng-model="meta.shelf">
        <!-- price -->
        <div class="flex-row align-items-center"
             ng-if="meta.shelf.price && meta.shelf.dis_price">
          <div class="flex text accent price"
               ng-if="meta.shelf.price">
            ¥ {{meta.shelf.dis_price|price}}
          </div>
          <div class="flex text-strike">
            ¥ {{meta.shelf.price|price}}
          </div>
        </div>
        <div ng-if="meta.shelf.price && !meta.shelf.dis_price">
          <div class="text accent price">
            ¥ {{meta.shelf.dis_price|price}}
          </div>
        </div>
        <div ng-if="!meta.shelf.price">
          <div class="text accent price">
            {{_('Free')}}
          </div>
        </div>

        <div class="divider"></div>

        <!-- discount -->
        <div ng-if="meta.shelf.discounts.length">
          <div>
            <div class="tag accent"
                 ng-repeat="discount in meta.shelf.discounts">
              {{discount.tagname}}
            </div>
          </div>
          <div class="divider"></div>
        </div>
      </div>

      <!-- content -->
      <article>
        <div class="content"
             sup-widget-series
             ng-model="meta.details"
             lite>
          <div ng-repeat="item in meta.details"
               ng-if="item.src">
            <img ng-src="{{item.src}}" />
          </div>
        </div>
      </article>
    </div>

    <!-- bottombar -->
    <div class="bottombar-holder"></div>
    <div class="bottombar">
      <button class="icon-btn accent raised">
        <icon>
          <svg viewBox="0 0 48 48"><path d="M38.5,7h-28a3.4953,3.4953,0,0,0-3.4825,3.5L7,42l7-7H38.5A3.51,3.51,0,0,0,42,31.5v-21A3.51,3.51,0,0,0,38.5,7ZM14,19.25H35v3.5H14ZM28,28H14V24.5H28Zm7-10.5H14V14H35Z" /></svg>
        </icon>
      </button>
      <button class="primary flex">
        <icon>
          <svg viewBox="0 0 48 48"><path d="M23.8667,19.8333H27.2v-5h5V11.5h-5v-5H23.8667v5h-5v3.3333h5Zm-6.6667,15a3.3334,3.3334,0,1,0,3.3333,3.3334A3.329,3.329,0,0,0,17.2,34.8333Zm16.6667,0A3.3334,3.3334,0,1,0,37.2,38.1667,3.3289,3.3289,0,0,0,33.8667,34.8333ZM17.4833,29.4167l.05-.2,1.5-2.7167H31.45a3.3175,3.3175,0,0,0,2.9167-1.7167L40.8,13.1l-2.9-1.6h-.0167L36.05,14.8333l-4.6,8.3334H19.75l-.2167-.45L15.8,14.8333,14.2167,11.5,12.65,8.1667H7.2V11.5h3.3333l6,12.65-2.25,4.0833a3.2233,3.2233,0,0,0-.4166,1.6A3.3431,3.3431,0,0,0,17.2,33.1667h20V29.8333H17.9A.4233.4233,0,0,1,17.4833,29.4167Z" /></svg>
        </icon>
      </button>
      <button class="raised primary flex">
        {{_('Buy Now')}}
      </button>
    </div>

  </page-inner>
</page>