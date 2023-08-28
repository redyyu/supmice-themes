{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="segment-wrapper {{meta.bg.class}} no-border"
         style="{{meta.bg.style}}">
  <div class="container">
    <div sup-widget-bg
         presets="[
           {'key': 'palette-orange', 'label': _('Orange')},
           {'key': 'palette-dark', 'label': _('Darkness')}
         ]"
         ng-model="meta.bg"></div>
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
        <hr class="divider">
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
      </div>
    </div>
  </div>
</section>
