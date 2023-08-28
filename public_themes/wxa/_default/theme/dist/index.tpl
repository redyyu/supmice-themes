<sup-set ng-model="g.ver"
         value="{{theme_meta.version}}"></sup-set>
<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.default_avatar"
         value="{{theme_url+'/styles/avatar.png'}}"></sup-set>
<sup-set ng-model="g.img_trans"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<link ng-href="{{theme_url}}/styles/mini-ui.css?{{g.ver}}"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet">

<mini-top-navbar>
  <div class="title">
    {{site_meta.title}}
  </div>
  <div class="menu">
    <icon>
      <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3.124"/><circle cx="20.0636" cy="12" r="2.1739" /><circle cx="3.9364" cy="12" r="2.1739" /></svg>
    </icon>
    <span class="menu-divider"></span>
    <icon>
      <svg viewBox="0 0 24 24"><circle cx="12" cy="12.0001" r="2.9301"/><path d="M12,20.1108A8.1108,8.1108,0,1,1,20.111,12,8.12,8.12,0,0,1,12,20.1108Zm0-14.583A6.4722,6.4722,0,1,0,18.4724,12,6.48,6.48,0,0,0,12,5.5278Z"/></svg>
    </icon>
  </div>
</mini-top-navbar>

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

<mini-bottom-tabs>
  <div class="tab-item">
    <icon>
      <svg viewBox="0 0 30 30"><path d="M27.9374,4H8.8125a.5625.5625,0,0,0,0,1.125h19.125a.5625.5625,0,0,0,0-1.125Z"/><path d="M20.0625,7.375H8.8125a.5625.5625,0,0,0,0,1.125h11.25a.5625.5625,0,0,0,0-1.125Z"/><path d="M27.9374,13H8.8125a.5626.5626,0,0,0,0,1.1251h19.125a.5626.5626,0,0,0,0-1.1251Z"/><path d="M20.0625,16.3749H8.8125a.5626.5626,0,0,0,0,1.1251h11.25a.5626.5626,0,0,0,0-1.1251Z"/><path d="M27.9374,22H8.8125a.5626.5626,0,0,0,0,1.1251h19.125a.5626.5626,0,0,0,0-1.1251Z"/><path d="M20.0625,25.3749H8.8125a.5626.5626,0,0,0,0,1.1251h11.25a.5626.5626,0,0,0,0-1.1251Z"/><path d="M3.75,4A2.25,2.25,0,1,0,6,6.25,2.2522,2.2522,0,0,0,3.75,4Zm0,3.375A1.125,1.125,0,1,1,4.875,6.25,1.1261,1.1261,0,0,1,3.75,7.375Z"/><path d="M3.75,13A2.25,2.25,0,1,0,6,15.25,2.2523,2.2523,0,0,0,3.75,13Zm0,3.375A1.125,1.125,0,1,1,4.875,15.25,1.1261,1.1261,0,0,1,3.75,16.3749Z"/><path d="M3.75,22A2.25,2.25,0,1,0,6,24.25,2.2523,2.2523,0,0,0,3.75,22Zm0,3.375A1.125,1.125,0,1,1,4.875,24.25,1.1261,1.1261,0,0,1,3.75,25.3749Z"/></svg>
    </icon>
    <div>{{_('Product')}}</div>
  </div>
  <div class="tab-item">
    <icon>
      <svg viewBox="0 0 30 30"><path d="M20.7754,24.0205a2.29,2.29,0,0,0-2.2719,2.3276,2.2725,2.2725,0,1,0,2.2719-2.3276Zm0,3.4887A1.1187,1.1187,0,0,1,19.67,26.3426a1.1069,1.1069,0,1,1,1.1053,1.1666Z"/><path d="M8.3778,24.0205A2.29,2.29,0,0,0,6.106,26.3481a2.3261,2.3261,0,0,0,2.2718,2.3277A2.29,2.29,0,0,0,10.65,26.3481,2.3261,2.3261,0,0,0,8.3778,24.0205Zm0,3.4887a1.1187,1.1187,0,0,1-1.1052-1.1666,1.1587,1.1587,0,0,1,1.1052-1.1667A1.1187,1.1187,0,0,1,9.483,26.3426,1.1511,1.1511,0,0,1,8.3778,27.5092Z"/><path d="M26.2457,1.3242l-.9043,3.55H2.5L6.7144,17.3612a2.8945,2.8945,0,0,0-2.4672,2.9361,2.944,2.944,0,0,0,2.9082,3.0254h15.83V22.2175H7.1554a1.7818,1.7818,0,0,1-1.7472-1.8644,1.8174,1.8174,0,0,1,1.7472-1.8644H23.0417L27.1723,2.4852H29.5V1.3242ZM22.1709,17.3277H7.9145L4.13,6.0354H25.0233L22.1709,17.3277Z"/><rect x="9.8905" y="8.7705" width="1.1666" height="6.5756"/><rect x="14.0268" y="8.7705" width="1.1666" height="6.5756"/><rect x="18.1574" y="8.7705" width="1.1666" height="6.5756"/></svg>
    </icon>
    <div>{{_('Shopping Cart')}}</div>
  </div>
  <div class="tab-item">
    <icon>
      <svg viewBox="0 0 30 30"><path d="M15,1.5476A13.4524,13.4524,0,1,0,28.4524,15,13.4524,13.4524,0,0,0,15,1.5476Zm0,25.8a12.2832,12.2832,0,0,1-8.0513-3.0065,8.0624,8.0624,0,0,1,16.1021,0A12.2826,12.2826,0,0,1,15,27.3473Zm0-12.2861a3.3767,3.3767,0,1,1,3.3767-3.3766A3.38,3.38,0,0,1,15,15.0612Zm9.0574,8.3019a9.1932,9.1932,0,0,0-7.2514-7.5823,4.4818,4.4818,0,1,0-3.612,0,9.1931,9.1931,0,0,0-7.2518,7.5817,12.3473,12.3473,0,1,1,18.1152.0006Z"/></svg>
    </icon>
    <div>{{_('My')}}</div>
  </div>
</mini-bottom-tabs>

