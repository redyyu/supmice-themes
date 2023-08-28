{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="intro {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="slogan">
    <h1>
      <span sup-widget-text
            ng-model="meta.title"
            default="{{_('Title')}}"></span>
    </h1>
    <p>
      <span sup-widget-text
            ng-model="meta.description"
            default="{{_('Description text here')}}"></span>
    </p>
    <a href="#"
       class="btn btn-skin scroll {{meta.entrance.class}}"
       sup-widget-link
       allow-fields="name"
       ng-model="meta.entrance">
      <span>{{meta.entrance.name || _('Learn More')}}</span>
    </a>
  </div>
</section>

<div sup-widget-segments ng-model="segments">

  <section id="page.slug"
           class="primary-section"
           ng-repeat="page in segments"
           ng-class="{'palette-gray': $even}">

    <!-- segments -->
    <div ng-if="page.template == 'page'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page.tpl" %}
    </div>
    <div ng-if="page.template == 'services'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_services.tpl" %}
    </div>
    <div ng-if="page.template == 'portfolio'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_portfolio.tpl" %}
    </div>
    <div ng-if="page.template == 'team'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_team.tpl" %}
    </div>

  </section>

  <section class="segment">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>

</div>

{% include '_footer.tpl' %}