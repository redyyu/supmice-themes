{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="intro {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="slogan">
    <div sup-widget-media
         ng-model="meta.logo">
      <img ng-src="{{meta.logo.src || site_meta.logo.src || g.logo}}"
           alt="{{meta.title}}" />
    </div>
    <div class="page-scroll">
      <a href="#">
        <i class="fa fa-angle-down fa-5x animated"></i>
      </a>
    </div>
  </div>

</section>

<div sup-widget-segments ng-model="segments">
  <div ng-repeat="page in segments">
    <div ng-if="page.template == 'page'">
      {% include "_seg/_page.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s1'">
      {% include "_seg/_page-s1.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s2'">
      {% include "_seg/_page-s2.tpl" %}
    </div>
    <div ng-if="page.template == 'album'">
      {% include "_seg/_album.tpl" %}
    </div>
    <div ng-if="page.template == 'features'">
      {% include "_seg/_features.tpl" %}
    </div>
  </div>

  <section class="primary-section text-center">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>
</div>

{% include '_footer.tpl' %}
