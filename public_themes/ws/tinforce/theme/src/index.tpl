{% include 'g.tpl' %}
{% include '_css.tpl' %}

{% include "_header.tpl" %}
<div class="scroller position-absolute d-none d-md-block"
     toggle-affix>
  <a class="indicator active" href="#"></a>
  <a class="indicator" href="#"
     ng-repeat="x in [1,2,3]"></a>
</div>

<!-- Hero -->
<section class="parallax-bg hero {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div class="pb-4 parallax-fade">
    <h1>
      <a class="entrance" href="#"
         sup-widget-media
         ng-model="meta.logo"
         sup-ico-inset="top"
         style="{{meta.logo.src|bg_img}}">
        {{meta.logo.title || site_meta.title}}
      </a>
    </h1>
  </div>
</section>

{% include '_segments.tpl' %}

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}" class="segment"
           ng-repeat="page in segments"
           sup-load-template="page.template"
           import-with-context="{'g':g, 'page':page}"
           segment>
  </section>
  <section class="segment">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>
</div>

<!-- Footer -->
<footer class="footer container text-center">
  <span sup-bind-html="site_meta.copyright"></span>
  <span sup-bind-html="site_meta.license"></span>
</footer>
