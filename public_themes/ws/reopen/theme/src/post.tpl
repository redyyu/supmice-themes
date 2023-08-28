{% import 'g.tpl' %}
{% include '_css.tpl' %}
<sup-body class="post single-post"></sup-body>

<div class="body-wrapper">
  {% include '_header.tpl' %}

  <div id="content" class="site-content center-relative">
    <article>
      <h1 class="entry-title">
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <div class="center-relative clear">
        <div class="cat-links"
             sup-categorize
             ng-model="query.category">
          <a href="#"
             ng-repeat="term_key in meta.terms">
            {{query.category.terms_dict[term_key].meta.name}}
            {{ $last ?'':', '}}
          </a>
        </div>
        <div class="post-info">
          <div class="post-date">
            {{meta.date|date_formatted}}
          </div>
          <div class="post-author">
            {{meta.author}}
          </div>
        </div>

        <div class="entry-content">
          <div class="content-wrap center-text"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               ng-model="content">
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </article>
    <div class="nav-links">
      <div class="nav-previous"
           sup-widget-link
           ng-model="meta.prevpage">
        <a href="#" rel="prev">
          {{meta.prevpage.name || _('Previous')}}
        </a>
        <p class="nav-previous-text">
            <img ng-src="{{g.assets_url}}/left.png"
                 alt="{{_('Previous')}}" />
        </p>
        <div class="clear"></div>
      </div>
      <div class="nav-next"
           sup-widget-link
           ng-model="meta.nextpage">
        <a href="#" rel="next">
          {{meta.nextpage.name || _('Next')}}
        </a>
        <p class="nav-next-text">
            <img ng-src="{{g.assets_url}}/right.png"
                 alt="{{_('Next')}}" />
        </p>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
  </div>

  {% include '_footer.tpl' %}
</div>