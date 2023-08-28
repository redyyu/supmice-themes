{% import 'g.tpl' %}
{% include '_css.tpl' %}

<sup-body class="parallax-major" style="{{meta.hero.style}}"></sup-body>

{% include '_header.tpl' %}
<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}">
  <div sup-widget-bg
       ng-model="meta.hero"></div>
  <div>
    <div class="logo">
      <img src="{{meta.logo.src || site_meta.logo || g.logo}}"
           alt="{{meta.title || site_meta.title}}">
    </div>
    <button class="video-play btn icon-btn open-video"
            type="button"
            sup-widget-media="video"
            ng-model="meta.intro">
      <svg width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/><path d="M10 16.5l6-4.5-6-4.5v9zM12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/></svg>
    </button>
    <a class="entrance anim-fade-in-out"
       href="#">
      <svg width="100" heigth="100" viewBox="0 0 100 100"><polygon points="49.999 66.734 9.946 39.084 13.961 33.266 49.999 58.143 86.039 33.266 90.054 39.084 49.999 66.734" /></svg>
    </a>
  </div>
</section>

{% include '_segments.tpl' %}

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           class="segment {{page.bg.class}}"
           style="{{page.bg.style}}"
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

{% include '_footer.tpl' %}

