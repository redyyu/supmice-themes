<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.larger_img"
         value="{{theme_url+'/styles/larger.jpg'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.add_item"
         value="{{theme_url+'/styles/add_item.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<sup-set ng-model="g.badge_holder"
         value="{{theme_url+'/styles/trans_badge.png'}}"></sup-set>

<sup-set ng-model="g.default_features"
         object="[
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_1.png'
           },
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_2.png'
           },
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_3.png'
           },
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_4.png'
           }
         ]"></sup-set>

<sup-set ng-model="g.default_clients"
         object="[
           {
             'title': _('Client Name'),
             'src': theme_url+'/styles/client_1.png'
           },
           {
             'title': _('Client Name'),
             'src': theme_url+'/styles/client_2.png'
           },
           {
             'title': _('Client Name'),
             'src': theme_url+'/styles/client_3.png'
           }
         ]"></sup-set>


<sup-set ng-model="g.default_badges"
         object="[
           {
             'title': _('Apple iOS'),
             'src': theme_url+'/styles/app_badge_apple.png',
             'link': '#'
           },
           {
             'title': _('Google Play'),
             'src': theme_url+'/styles/app_badge_android.png',
             'link': '#'
           },
           {
             'title': _('Windows Phone'),
             'src': theme_url+'/styles/app_badge_wp.png',
             'link': '#'
           }
         ]"></sup-set>

<!-- fonts -->
<link ng-href='{{theme_url}}/styles/fonts/lato.css'
      rel='stylesheet'>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/bootstrap.min.css"
      rel='stylesheet'>

<!-- common -->
<link ng-href="{{theme_url}}/styles/common.css"
      rel="stylesheet">

<!-- styles-->
<link ng-href="{{theme_url}}/styles/style.css"
      rel='stylesheet'>

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>



<div class="editor-gap-top"></div>
<!-- Content Block -->
<section id="{{meta.slug}}"
         class="content-block {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg
       ng-model="meta.bg"></div>
  <div>
    <div class="container">
  		<div class="row"
           sup-widget-series
           default="{{g.default_features}}"
           limit="4"
           ng-model="meta.series">

        <div class="item col-sm-3 text-center {{item.class}}"
             ng-repeat="item in meta.series">
          <div class="feature"
               series-item>
            <figure>
              <img ng-src="{{g.img_holder}}"
                   class="img-holder"
                   style="{{item.src|bg_img}}">
            </figure>
            <h3 class="text-nowrap">{{item.title}}</h3>
            <p class="text-clamp-3 caption">{{item.caption}}</p>
          </div>
        </div>

        <div class="item col-sm-3 text-center">
          <div class="feature"
               series-item-create>
            <figure>
              <img ng-src="{{g.img_holder}}"
                   class="img-holder"
                   style="{{g.add_img|bg_img}}">
            </figure>
            <h3 class="text-nowrap">{{_('Add New Item')}}</h3>
            <p class="text-clamp-3 caption"
               sup-bind-html="_('Click here to add a item.')">
            </p>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
<!-- #Content Block -->