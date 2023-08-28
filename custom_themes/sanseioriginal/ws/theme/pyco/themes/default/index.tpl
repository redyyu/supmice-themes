{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg
       ng-model="meta.hero"></div>
  <div class="container hero-inner">
    <div>
      <div class="logo"
           style="{{site_meta.logo|bg_img}}"
           ng-if="site_meta.logo"></div>
      <h1>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <h2>
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </h2>
    </div>
    <a href="#"
       class="arrow-more page-scroll {{meta.entrance.class}}"
       sup-widget-link
       ng-model="meta.entrance">
      <svg viewBox="0 0 512 512"><path d="M271.042,425.167a74.64,74.64,0,0,0,37.969-20.583L490.135,212.792A74.6665,74.6665,0,1,0,384.323,107.416L256,243.292,127.469,107.208A74.6667,74.6667,0,0,0,21.76,212.688L203.198,404.792a74.3415,74.3415,0,0,0,37.76,20.375,75.1738,75.1738,0,0,0,15.042,1.5A77.2128,77.2128,0,0,0,271.042,425.167Z"/></svg>
    </a>
  </div>
</section>

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           class="segment {{page.bg.class}}"
           style="{{page.bg.style}}"
           ng-repeat="page in segments">
    <!-- segments -->
    <div class="container"
         ng-if="page.template == 'page'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page.tpl" %}
    </div>
    <div class="container"
         ng-if="page.template == 'page-s1'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page-s1.tpl" %}
    </div>
    <div class="container"
         ng-if="page.template == 'page-s2'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page-s2.tpl" %}
    </div>
    <div class="container"
         ng-if="page.template == 'product'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_product.tpl" %}
    </div>
    <div class="container"
         ng-if="page.template == 'product-s1'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_product-s1.tpl" %}
    </div>
    <!-- #segments -->
  </section>

  <section class="segment">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>

</div>

{% include '_footer.tpl' %}
