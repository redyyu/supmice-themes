{% import 'g.tpl' %}
{% include '_css.tpl' %}
<sup-body class="page"></sup-body>

<div class="body-wrapper">
  {% include '_header.tpl' %}

  <div class="site-content">
    <div class="block content-1170 center-relative">
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

    <article>
      <div class="content-970 center-relative"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content">
      </div>
      <div class="clear"></div>
    </article>
  </div>
  {% include '_footer.tpl' %}
</div>