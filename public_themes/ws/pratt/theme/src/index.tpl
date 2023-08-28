{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<section id="{{meta.slug}}">
  <div class="hero">
    <div class="container">

      <div class="row centered section-header">
        <div class="col-md-8 col-md-offset-2">
          <h1>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h1>
          <h2>
            <span sup-widget-text
                  ng-model="meta.subtitle"
                  default="{{_('Subtitle')}}"></span>
          </h2>
        </div>
      </div>

      <div class="row">

    		<div class="col-lg-2">
    			<h5>
            <span sup-widget-text
                  ng-model="meta.left_hint_title"
                  default="{{_('Hint goes here')}}"></span>
          </h5>
    			<p>
            <span sup-widget-text
                  ng-model="meta.left_hint"
                  default="{{_('$_HINT')}}"></span>
          </p>
    			<img class="hidden-xs hidden-sm hidden-md"
               ng-src="{{theme_url}}/styles/arrow1.png">
    		</div>

        <div class="col-lg-8 hero-imgbox">
          <div sup-widget-media
               ng-model="meta.hero">
            <img ng-src="{{g.img_holder_cover}}"
                 style="{{(meta.hero.src || g.default_hero)|bg_img}}"/>
          </div>
        </div>

    		<div class="col-lg-2">
    			<img class="hidden-xs hidden-sm hidden-md"
               ng-src="{{theme_url}}/styles/arrow2.png">
    			<h5>
            <span sup-widget-text
                  ng-model="meta.right_hint_title"
                  default="{{_('Hint goes here')}}"></span>
          </h5>
    			<p>
            <span sup-widget-text
                  ng-model="meta.right_hint"
                  default="{{_('$_HINT')}}"></span>
          </p>
    		</div>

      </div>

    </div>
  </div>
</section>

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           ng-repeat="page in segments"
           ng-if="page.template != meta.template">

  	<!-- Segments -->
    <div ng-if="page.template == 'page'">
      {% include "_seg/_page.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s1'">
      {% include "_seg/_page-s1.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s2'">
      {% include "_seg/_page-s2.tpl" %}
    </div>
    <div ng-if="page.template == 'features'">
      {% include "_seg/_features.tpl" %}
    </div>
    <div ng-if="page.template == 'portfolio'">
      {% include "_seg/_portfolio.tpl" %}
    </div>
  	<!-- #Segments -->

  </section>
  <section>
    <div>
      <div class="container">
        <div segment-create="major"></div>
      </div>
    </div>
  </section>
</div>

{% include '_footer.tpl' %}