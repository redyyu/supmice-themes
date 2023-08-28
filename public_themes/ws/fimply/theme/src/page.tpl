{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="common">
  <div class="container">
    <header>
      <h2>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h2>
      <p>
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
    </header>
    <article>
      <div sup-angular-wysiwyg
           ng-model="content"
           default="{{_('$_CONTENT')}}"
           class="content"></div>
    </article>
  </div>
</section>