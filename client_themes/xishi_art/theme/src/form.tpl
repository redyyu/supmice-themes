{% import 'g.tpl' %}
{% include '_css_.tpl' %}

{% include '_header_.tpl' %}

<div class="container">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <h1 class="text-center">
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <article sup-wx-broadcast class="content">
        <div style="text-align: justify;">
          <div sup-angular-wysiwyg
               ng-model="content"
               presets="g.content_presets"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </article>
      <hr>
      <aside sup-widget-form
             ng-model="meta.form">

        <div ng-if="meta.form.type == 'custom'"
             ng-bind-html="meta.form.custom|trust">
        </div>
        <div ng-if="meta.form.type != 'custom'">
          {% include '_skipper_form_.tpl' %}
        </div>
        <div ng-if="!meta.form || !meta.form.type">
          <p class="text-center">
            {{_('Please Click here to add a form.')}}
          </p>
        </div>

      </aside>
    </div>
  </div>
</div>

{% include '_footer_.tpl' %}
