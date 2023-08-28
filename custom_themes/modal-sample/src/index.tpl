{% import 'g.tpl' %}
{% include '_css.tpl' %}


<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="header-content">
    <div class="header-content-inner">
      <div class="logo"
           style="{{site_meta.logo|bg_img}}"
           ng-if="site_meta.logo"></div>
      <h1>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <br><br>
      <a href="#"
         class="btn btn-primary btn-xl"
         sup-widget-link
         ng-model="meta.entrance">
         {{meta.entrance.name || _('Learn More')}}</a>
    </div>
  </div>
</section>

<!-- attrs -->
<div class="container gap">
  <div sup-widget-attrs
       structure="[
       {key:'text', label:'A Text'},
       {key:'select', label:'A Select', type:'select',
        options: ['Op #1', 'Op #2', 'Op #3']},
       {key:'switch', label:'A Switch', type:'switch'}
       ]"
       ng-model="meta.attrs"></div>
</div>

<!-- bulletin -->
<div class="container gap">
  <div sup-widget-bulletin
       ng-model="meta.bulletin"></div>
</div>

<!-- carousel -->
<div class="container gap">
  <div sup-widget-carousel
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
       ng-model="meta.carousel"></div>
</div>

<!-- catalog -->
<div class="container gap">
  <div sup-widget-catalog
       ng-model="meta.catalog"></div>
</div>

<!-- form -->
<div class="container gap">
  <div sup-widget-form
       ng-model="meta.form"></div>
</div>

<!-- lines -->
<div class="container gap">
  <div sup-widget-lines
       default="['text #1', 'text #2']"
       ng-model="meta.lines"></div>
</div>

<!-- media -->
<div class="container gap">
  <div sup-widget-media
       ng-model="meta.media"></div>
</div>

<!-- script -->
<div class="container gap">
  <div sup-widget-script
       ng-model="meta.script"></div>
</div>

<!-- shelf -->
<div class="container gap">
  <div sup-widget-shelf
       ng-model="meta.shelf"></div>
</div>

<!-- slot -->
<div class="container gap">
  <div sup-widget-slot
       key="banner"
       ng-model="meta.slot"></div>
</div>


<!-- series -->
<div class="container gap">
  <div class="row"
       sup-widget-series
       default="{{[
          {
            'title': _('Feature Title'),
            'caption': _('Click here to edit the feature.'),
            'src': theme_url+'/styles/f1.png'
          },
          {
            'title': _('Feature Title'),
            'caption': _('Click here to edit the feature.'),
            'src': theme_url+'/styles/f2.png'
          },
          {
            'title': _('Feature Title'),
            'caption': _('Click here to edit the feature.'),
            'src': theme_url+'/styles/f3.png'
          }
       ]}}"
       ng-model="meta.series">

    <div class="col-md-3 col-sm-6 text-center"
         ng-repeat="item in meta.series">
      <div class="feature-box"
           series-item>
        <figure>
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{item.src|bg_img}}" />
        </figure>
        <h3 class="text-nowrap">
          {{item.title || _('Item Title')}}
        </h3>
        <p class="text-muted text-clamp-3">
          {{item.caption || _('Item Caption')}}
        </p>
      </div>
    </div>

    <div class="col-md-3 col-sm-6 text-center">
      <div class="feature-box"
           series-item-create>
        <figure>
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{g.add_img|bg_img}}" />
        </figure>
        <h3 class="text-nowrap">
          {{_('Create New Service')}}
        </h3>
        <p class="text-muted text-clamp-3">
          {{_('Click here add a new feature.')}}
        </p>
      </div>
    </div>

  </div>
</div>

<!-- create -->
<div class="container gap">
  <div sup-widget-create
       type="page">
    <a href="#">
      <figcaption>Create New Content</figcaption>
      <img ng-src="{{g.trans}}"
           style="{{g.add_img|bg_img}}"/>
    </a>
  </div>
</div>

<!-- open -->
<div class="container gap">
  <div sup-widget-open="works">
    <a href="#">
      <figcaption>Open The Content</figcaption>
      <img ng-src="{{g.default}}"/>
    </a>
  </div>
</div>


<!-- segments -->
<div class="gap"></div>
<h2>Segments</h2>
<div sup-widget-segments ng-model="segments">
  <div ng-repeat="page in segments">
  	<!-- segments -->
    <div ng-if="page.template == 'page'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page.tpl" %}
    </div>
  	<!-- #segments -->
  </div>

  <section class="segment-wrapper">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>

</div>

{% include '_footer.tpl' %}
