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
          {'key': 'perpage', 'label': _('Number of Perpage')},
          {'key': 'category', 'label': _('Category Key')},
          {'key': 'attach_category', 'label': _('Attach Category Headline'),
           'type': 'switch', value: false}
         ]"></div>
  </div>

  <div class="block content-1170 center-relative"
       ng-if="meta.attrs.attach_category">
    <h1 class="entry-title">
      {{_('Title of Category %s', meta.attrs.category)}}
    </h1>
    <p class="page-desc">
      {{_('Description of the Category')}}
    </p>
  </div>
  <div class="block content-1170 center-relative"
       ng-if="!meta.attrs.attach_category">
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

  <div class="center-relative">
    <p class="page-desc">
      {{_('Category page will automatically query posts.')}}
    </p>
  </div>

  <div class="grid" id="portfolio"
       sup-query="post"
       perpage="(meta.attrs.perpage||g.opts.perpage)"
       term="meta.attrs.category"
       ng-model="query.result"
       ng-if="meta.attrs.category">
    <div class="grid-sizer"></div>

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
            <span ng-repeat="term_key in post.terms"
                  ng-if="query.category.terms_dict[meta.attrs.category]">
              {{query.category.terms_dict[meta.attrs.category].meta.name}}
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
