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
      <div class="row">
        <div class="col-md-12">
          <header class="text-center">
            <h2 sup-widget-text
                ng-model="meta.title"
                default="{{_('Title')}}"></h2>
          </header>
        </div>
      </div>
      <div class="row"
           sup-widget-series
           default="{{g.default_clients}}"
           limit="4"
           ng-model="meta.series">

        <div class="item {{item.class}}
             {{$first?(meta.series|col_offset:'col-sm-offset-':4:8):''}}"
             ng-class="{'col-sm-3': meta.series.length >= 3,
                        'col-sm-4': meta.series.length < 3}"
             ng-repeat="item in meta.series">
          <div series-item>
            <a class="client"
               href="#">
              <img ng-src="{{g.img_holder}}"
                   class="img-holder"
                   style="{{item.src|bg_img}}"/>
            </a>
          </div>
        </div>
        <div class="item"
             ng-class="{'col-sm-offset-4': (meta.series|is_empty),
                        'col-sm-3': meta.series.length >= 3,
                        'col-sm-4': meta.series.length < 3}">
          <div series-item-create>
            <a href="#">
              <img ng-src="{{g.img_holder}}"
                   class="img-holder"
                   style="{{g.add_img|bg_img}}">
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- #Content Block -->