{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         palette="{{g.opts.palette}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-right navicon">
        <a id="nav-toggle" class="nav_slide_button" href="#"><span></span></a>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-md-offset-2 text-center inner">
        <h1>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h1>
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
  </div>
</section>
{% include '_header.tpl' %}

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           class="segment"
           ng-repeat="page in segments"
           ng-if="page.template != meta.template"
           ng-class="{'bg-white': $odd,
                      'bg-gray': $even}">

  	<!-- Segments -->
    <div ng-if="page.template == 'page'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s1'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page-s1.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s2'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page-s2.tpl" %}
    </div>
    <div ng-if="page.template == 'portfolio'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_portfolio.tpl" %}
    </div>
    <div ng-if="page.template == 'services'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_services.tpl" %}
    </div>
  	<!-- #Segments -->

  </section>
  <section ng-class="{'bg-white': $odd,
                      'bg-gray': $even}">
    <div>
      <div class="container">
        <div segment-create="major"></div>
      </div>
    </div>
  </section>
</div>

{% include '_footer.tpl' %}