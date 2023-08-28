{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
               default="{{_('Title')}}"
               ng-model="meta.title"></span>
        </h2>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2"
           sup-widget-form
           ng-model="meta.form">
        <div ng-if="meta.form.type == 'custom'"
             ng-bind-html="meta.form.custom|trust">
        </div>
        <div ng-if="meta.form.type != 'custom'">
          {% include '_skipper_form.tpl' %}
        </div>
        <div ng-if="!meta.form || !meta.form.type">
          <p class="text-center">
            {{_('Please Click here to add a form.')}}
          </p>
        </div>
      </div>
    </div>
  </div>
</section>
{% include '_footer.tpl' %}
