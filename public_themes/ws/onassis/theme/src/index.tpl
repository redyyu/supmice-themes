{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section id="id-{{meta.slug}}">

  <div class="hero section-primary {{meta.hero.class}}"
       style="{{meta.hero.style}}">
    <div sup-widget-bg ng-model="meta.hero"></div>
    <div class="container text-center">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <h1>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}">
            </span>
          </h1>
          <h2>
            <span sup-widget-text
                  ng-model="meta.description"
                  default="{{_('Description text here')}}">
            </span>
          </h2>
        </div>
      </div>
    </div>

  </div>

  <div class="section-content bg-white">
    <div class="container text-center">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </div>
    </div>
  </div>

</section>

<div sup-widget-segments ng-model="segments">

  <section id="page.slug"
           ng-repeat="page in segments">

    <!-- blocks -->
    <div ng-if="page.template == 'page'" segment>
      {% include "_seg/_page.tpl" %}
    </div>
    <div ng-if="page.template == 'services'" segment>
      {% include "_seg/_services.tpl" %}
    </div>
    <div ng-if="page.template == 'portfolio'" segment>
      {% include "_seg/_portfolio.tpl" %}
    </div>
    <div ng-if="page.template == 'team'" segment>
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