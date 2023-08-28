{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div class="header {{meta.background.class}}" style="{{meta.background.style || site_meta.bg.style}}" sup-editor-widget-bg ng-model="meta.background">
    <header id="home">
      <div class="bg_mask">
      <div class="wrap clearfix">
          <div class="logo1">
            <img src="{{site_meta.logo || g.default_logo}}" alt="logo" />
          </div>
        <h1>
          <span sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></span>
        </h1>
        <p>
          <span sup-editor-meta ng-model="meta.description" default="{{_('Description text here')}}"></span>
        </p>
        <div class="clear"></div>
      </div>
      </div>
    </header>
</div>
