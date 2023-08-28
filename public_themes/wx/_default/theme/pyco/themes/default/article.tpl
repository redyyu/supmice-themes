<sup-set ng-model="g.ver"
         value="{{theme_meta.version}}"></sup-set>
<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}" rel="stylesheet">
<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>

<div class="wrapper">
  <div class="container clearfix">
    <h1>
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h1>
    <div class="date">
      {{meta.date|date_formatted}} | {{meta.author}}
    </div>
    <div class="kv">
      <div sup-widget-media
           ng-model="meta.featured_img">
        <img ng-src="{{meta.featured_img.src || g.default_img}}"/>
      </div>
    </div>
    <article class="content clearfix"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content">
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