{% import 'g.tpl' %}
{% include '_css_.tpl' %}

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