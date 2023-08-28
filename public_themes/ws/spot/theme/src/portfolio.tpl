{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="section-header blue-bg">
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
           'title': _('Works Title'),
           'caption': _('$_CAPTION'),
           'src': theme_url+'/styles/w1.jpg'
         },
         {
           'title': _('Works Title'),
           'caption': _('$_CAPTION'),
           'src': theme_url+'/styles/w2.jpg'
         }
       ]}}"
       ng-model="meta.series">

    <div ng-repeat="item in meta.series"
         series-item>
      <div class="row"
           ng-class="item.class">
        <div class="col-md-5 centered">
          <img class="featured-img rounded"
               ng-src="{{item.src}}"
               alt="{{item.title}}" />
        </div>
        <div class="col-md-7">
          <h3>{{item.title}}</h3>
          <p>{{item.caption}}</p>
          <div class="spacing"
               ng-if="item.link">
            <a class="btn btn-primary"
               href="#">
              {{_('View')}}
            </a>
          </div>
          <div ng-if="item.misc"
               sup-bind-html="item.misc">
          </div>
        </div>
      </div>
      <hr>
    </div>

    <div series-item-create>
      <div class="row">
        <div class="col-md-5 centered">
          <img class="featured-img rounded"
               ng-src="{{g.default_img}}"/>
        </div>
        <div class="col-md-7">
          <h3>{{_('Create New Works')}}</h3>
          <p>{{_('Click here to add a new works.')}}</p>
        </div>
      </div>
    </div>

  </div>
</div>

<div class="section-primary red-bg">
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
