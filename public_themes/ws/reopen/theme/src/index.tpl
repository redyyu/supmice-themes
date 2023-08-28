{% import 'g.tpl' %}
{% include '_css.tpl' %}
<sup-body class="page"></sup-body>


<div class="body-wrapper">
  {% include '_header.tpl' %}
  <div class="page-attrs">
    <div sup-widget-attrs
         ng-model="meta.attrs"
         outline-none
         structure="[
           {'key': 'perpage',
            'label': _('Number of Perpage'),
            'value': g.opts.perpage,
            'type': 'text'},
           {'key': 'hide_headline',
            'label': _('Hide Headline'),
            'value': false,
            'type': 'switch'},
         ]"></div>
  </div>
  <div class="block content-1170 center-relative"
       ng-if="!meta.attrs.hide_headline">
    <h1 class="entry-title">
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h1>
    <p class="page-desc">
      <span sup-widget-text
            default="{{_('Description text here')}}"
            ng-model="meta.description"></span>
    </p>
  </div>

  <div class="grid" id="portfolio"
       sup-query="post"
       perpage="(meta.attrs.perpage||g.opts.perpage)"
       ng-model="query.result">
    <div class="grid-sizer"
         sup-categorize
         ng-model="query.category"></div>

    <div class="grid-item element-item">
      <div sup-widget-create
           type="post">
        <img ng-src="{{g.add_img}}" />
      </div>
    </div>

    <div class="grid-item element-item"
         ng-repeat="post in query.result.contents">
      <a href="#">
        <img ng-src="{{(post.featured_img.src || g.default_img)|thumbnail}}"
             alt="{{post.title}}" />
        <div class="portfolio-text-holder">
          <p class="portfolio-text">
            {{post.title}}
          </p>
          <p class="portfolio-type">
             <span>
              {{query.category.terms_dict[post.terms[0]].meta.name}}
            </span>
          </p>
        </div>
      </a>
    </div>

  </div>

  <div class="clear"></div>

  <div class="content-1170 center-relative center-text top-50 bottom-50">
    <a class="more-posts-portfolio"
       href="#">
      <img ng-src="{{g.assets_url}}/load_more.png"
           alt="{{_('Load more')}}" />
    </a>
  </div>

  <div class="clear"></div>
  {% include '_footer.tpl' %}
</div>
