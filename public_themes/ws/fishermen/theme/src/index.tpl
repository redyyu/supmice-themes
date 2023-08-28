{% import 'g.tpl' %}
{% include '_css.tpl' %}


<!-- Header -->
{% include '_header.tpl' %}
<!-- #Header -->
<!-- Main -->
<section id="{{meta.slug}}" class="main-section">
  <div sup-widget-bg
       ng-model="meta.hero"></div>
  <div class="container">
    <div class="brand">
      <div class="logo">
        <div sup-widget-media
             ng-model="meta.logo">
          <img ng-src="{{meta.logo.src || site_meta.logo || g.logo}}"
               alt="{{site_meta.title}}" />
        </div>
      </div>
      <h1>
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <h2>
        <span sup-widget-text
              ng-model="meta.subtitle"
              default="{{_('Subtitle text here')}}"></span>
      </h2>
    </div>
    <div class="get-link"
         sup-widget-attrs
         ng-model="meta.mailto"
         structure="[
           {'key': 'address', 'label': _('Email Address'),
            'value': 'your@email.here'},

           {'key': 'subject', 'label': _('Email Subject'),
            'value': _('Email subject here')},

           {'key': 'btntext', 'label':_('Button Text'),
            'value': _('Get Link')},

           {'key': 'hidden', 'label':_('Hidden'),
            'value': false, 'type': 'switch'},
         ]">

      <form action="#"
            ng-show="!meta.mailto.hidden">
        <input type="hidden"
               name="subject"
               value="{{meta.mailto.subject}}">
        <div class="form-group row">
          <div class="col-sm-8">
            <!-- email -->
            <input type="email"
                   name="email"
                   placeholder="{{_('Email Address here')}}"
                   class="form-control email">
            <!-- #email -->
          </div>
          <div class="col-sm-4">
            <button class="btn btn-primary btn-block">
              {{meta.mailto.btntext}}
            </button>
          </div>
        </div>
      </form>
    </div>

    <div>
      <div class="excerpt">
        <p>
          <span sup-widget-text
                ng-model="meta.description"
                default="{{_('Description text here')}}"></span>
        </p>
      </div>
      <div class="store">
        <div class="row"
             sup-widget-series
             default="{{g.default_badges}}"
             limit="3"
             ng-model="meta.badges">
          <div class="col-sm-4
                      {{meta.badges.length < 2 ? 'col-sm-offset-2' : ''}}"
               ng-repeat="prd in (meta.badges|limitTo:3)">
            <div series-item>
              <a class="flag {{prd.class}}"
                 href="#">
                <img ng-src="{{g.badge_holder}}"
                     style="{{prd.src|bg_img}}" />
              </a>
            </div>
          </div>
          <div class="col-sm-4
                      {{meta.badges.length < 1?'col-sm-offset-4':''}}">
            <div series-item-create>
              <a class="flag"
                 href="#">
                <img ng-src="{{g.add_item}}"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="learn-more">
        <a href="#"
           class="btn-more">
          {{_('Learn More')}}
        </a>
      </div>
		</div>
  </div>
</section>
<!-- #Main -->
<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           class="content-block {{page.bg.class}}"
           style="{{page.bg.style}}"
           ng-repeat="page in segments"
           ng-if="page.template != meta.template">

  	<!-- segments -->
    <div ng-if="page.template == 'page'">
      {% include "_seg/_page.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s1'">
      {% include "_seg/_page-s1.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s2'">
      {% include "_seg/_page-s2.tpl" %}
    </div>
    <div ng-if="page.template == 'page-s3'">
      {% include "_seg/_page-s3.tpl" %}
    </div>
    <div ng-if="page.template == 'features'">
      {% include "_seg/_features.tpl" %}
    </div>
    <div ng-if="page.template == 'clients'">
      {% include "_seg/_clients.tpl" %}
    </div>
  	<!-- #Section Blocks -->

  </section>
  <section class="content-block last">
    <div>
      <div class="container">
        <div segment-create="major"></div>
      </div>
    </div>
  </section>
</div>

{% include "_footer.tpl" %}

<div class="cover {{meta.hero.class}}"
     style="{{meta.hero.style}}"></div>
