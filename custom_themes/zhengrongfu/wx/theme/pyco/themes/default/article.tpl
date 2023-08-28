<sup-set ng-model="g.ver"
         value="{{theme_meta.version}}"></sup-set>
<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.space_marker"
         value="{{theme_url+'/styles/marker.png'}}"></sup-set>

<sup-set ng-model="g.brand_img"
         value="{{theme_url+'/styles/brand_card.png'}}"></sup-set>

<sup-set ng-model="g.img_topbar"
         value="{{theme_url+'/styles/divider_top.png'}}"></sup-set>

<sup-set ng-model="g.img_bottombar"
         value="{{theme_url+'/styles/divider_bottom.png'}}"></sup-set>

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}" rel="stylesheet">
<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>

<div class="wrapper">
  <div class="page">
    <h2 class="title">
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h2>
    <div class="metadata">
      <em class="meta-item meta-text">{{meta.date|date_formatted}}</em>
      <em class="meta-item meta-text">{{meta.author}}</em>
      <a class="meta-item meta-link" href="#">{{site_meta.title}}</a>
    </div>
    <figure class="featured_img"
            sup-widget-media
            ng-model="meta.featured_img">
      <img ng-src="{{meta.featured_img.src || g.default_img}}">
    </figure>
    <article class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"
             presets="[
             {'name':_('Space Marker'),
              'type':'image',
              'figure': theme_url+'/styles/preset_space_marker.jpg',
              'code':'<div class=&quot;centered&quot;>
                <img src=&quot;'+g.space_marker+'&quot;>
                </div><div><br></div>'},
             {'name':_('Picture Frame'),
              'type':'image',
              'figure': theme_url+'/styles/preset_frame_img.jpg',
              'code':'<div class=&quot;centered&quot;>
                <img src=&quot;'+g.img_topbar+'&quot;>
                <img src=&quot;'+g.default_img+'&quot;>
                <img src=&quot;'+g.img_bottombar+'&quot;>
                </div><div><br></div>'},
              {'name':_('Brand Card'),
              'type':'image',
              'figure': theme_url+'/styles/preset_brand_card.jpg',
              'code':'<div class=&quot;centered&quot;>
                <img src=&quot;'+g.brand_img+'&quot;>
                </div><div><br></div>'},
             ]">
    </article>
  </div>

  <footer>
    <div>
      <div class="info">
        <div class="read">{{_('Read')}}</div>
        <div class="count">{{visit.page}}</div>
      </div>
    </div>
    <div class="copyright">
      <span sup-bind-html="site_meta.copyright"></span>
      <span sup-bind-html="site_meta.license"></span>
    </div>
  </footer>
</div>