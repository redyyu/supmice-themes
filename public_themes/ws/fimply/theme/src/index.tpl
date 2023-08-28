{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="carousel fade-carousel slide"
         sup-widget-carousel="major"
         default="{{[
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-01.jpg'
           },
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-02.jpg'
           },
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-03.jpg'
           },
         ]}}"
         ng-model="meta.carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li ng-repeat="item in meta.carousel"
        ng-class="{'active': $first}">
    </li>
  </ol>
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item slides active">
      <div class="slide"
           style="{{meta.carousel[0].src|bg_img}}">
      </div>
      <div class="hero">
        <header>
          <h1>{{meta.carousel[0].title}}</h1>
          <h3>{{meta.carousel[0].caption}}</h3>
        </header>
      </div>
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
    <div ng-if="page.template == 'portfolio'">
      {% include "_seg/_portfolio.tpl" %}
    </div>
    <div ng-if="page.template == 'services'">
      {% include "_seg/_services.tpl" %}
    </div>
    <div ng-if="page.template == 'clients'">
      {% include "_seg/_clients.tpl" %}
    </div>
  </div>

  <section class="common">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>
</div>

{% include '_footer.tpl' %}
