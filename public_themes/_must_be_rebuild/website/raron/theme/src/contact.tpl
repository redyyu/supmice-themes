{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div class="contact" id="contact">
  <h3 class="heading">
    <div sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></div>
  </h3>
  <p class="desc">
    <span sup-editor-meta ng-model="meta.caption" default="{{_('Description text here')}}"></span>
  </p>
  <div class="contact-bg">
      <div class="tool_tip">
        <a href="#">
          <div sup-editor-media ng-model="meta.logo">
            <img ng-src="{{meta.logo.src}}"/>
          </div>
        </a>
      </div>

      <div class="container">
        <div class="wrap">
          <div class="wrapd">
            <div sup-angular-wysiwyg ng-model="content" default="{{_('$_CONTENT')}}"></div>
          </div>
          <div class="clear"> </div>
        </div>
      </div>

  </div>
</div>