{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="wrapper">
  <div class="section-header ribbon-bg {{meta.hero.class}}"
       ng-class="{'ribbon-cover': meta.hero.src}"
       style="{{meta.hero.style}}">
    <div sup-widget-bg
         presets="[
           {'key': 'palette-light', 'label': _('Light')}
         ]"
         ng-model="meta.hero"></div>
    <div class="container">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
          <p>
            <span sup-widget-text
                  ng-model="meta.description"
                  default="{{_('Description text here')}}"></span>
          </p>
        </div>
      </div>
    </div>
  </div>

  <div class="section-primary">
    <div class="container"
         sup-widget-series
         default="{{[
           {
             'title': _('Title'),
             'caption': _('$_CAPTION'),
             'src': theme_url+'/styles/w1.jpg'
           },
           {
             'title': _('Title'),
             'caption': _('$_CAPTION'),
             'src': theme_url+'/styles/w2.jpg'
           }
         ]}}"
         ng-model="meta.series">

      <div ng-repeat="item in meta.series"
           series-item>
        <div class="row prd-item"
             ng-class="item.class">
          <div class="col-md-5 centered">
            <img class="featured-img"
                 ng-src="{{item.src}}"
                 alt="{{item.title}}" />
          </div>
          <div class="col-md-7">
            <h3>{{item.title}}</h3>
            <p>{{item.caption}}</p>
            <div ng-if="item.misc"
                 sup-bind-html="item.misc">
            </div>
            <div class="spacing">
              <a class="btn btn-primary btn-lg popup-modal"
                 href="#"
                 target="{{item.target}}">
                {{item.target ? _('Learn More') : _('Booking')}}
              </a>
            </div>
          </div>
        </div>
        <hr>
      </div>

      <div series-item-create>
        <div class="row">
          <div class="col-md-5 centered">
            <img class="featured-img"
                 ng-src="{{g.default_img}}"/>
          </div>
          <div class="col-md-7">
            <h3>{{_('Create New Item')}}</h3>
            <p>{{_('Click here to add a new item.')}}</p>
          </div>
        </div>
      </div>

    </div>

  </div>

  <div class="section-primary">
    <div class="container">
      <div class="manage-formsheet"
           sup-widget-form
           ng-model="meta.form">
        {{_('Manage Popup Formsheet')}}
      </div>
    </div>
  </div>

  <div class="section-primary page">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </div>
    </div>
  </div>

  <div class="section-primary hl-bg">
    <div class="container">
      <div class="row centered">
        <div class="col-lg-8 col-lg-offset-2">
          <h4>
            <span sup-widget-text
                  ng-model="meta.statement"
                  default="{{_('We are the only option you have')}}"></span>
          </h4>
        </div>
      </div>
    </div>
  </div>

  {% include '_footer.tpl' %}
</div>