{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="wrapper">

  <div class="hero {{meta.hero.class}}"
       style="{{meta.hero.style}}">
    <div sup-widget-bg
         presets="[
          {'key': 'repeat', 'label': _('Repeat')}
         ]"
         ng-model="meta.hero"></div>
    <div class="container">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2">
          <h1>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h1>
          <h2>
            <span sup-widget-text
                  ng-model="meta.description"
                  default="{{_('Description text here')}}"></span>
          </h2>
        </div>
      </div>
    </div>
  </div>

  <!-- PRODUCTS SECTION -->
  <div sup-query="page"
       attrs="[{'template':'products'}]"
       ng-model="query.products"></div>

  <div class="section-primary"
       ng-repeat="prd in query.products.contents"
       ng-class="{'dark-bg':$even, 'light-bg':$odd}">

    <div class="container"
         sup-widget-open="prd">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2 section-header">
          <h4>{{prd.title}}</h4>
          <p>{{prd.description}}</p>
        </div>
      </div>
      <div class="row centered">

        <div class="col-sm-4
                    {{$first?(prd.series|col_offset:'col-sm-offset-':4):''}}"
             ng-repeat="item in prd.series|limitTo:3">
          <div class="tilt">
            <a href="#">
              <img class="featured-img img-holder"
                   ng-src="{{g.img_cover_holder}}"
                   style="{{item.src|bg_img}}" />
            </a>
          </div>
        </div>

      </div>
    </div>

  </div>

  <div class="section-primary dark-bg">
    <div class="container">
      <div sup-widget-create="major"
           template="products"></div>
    </div>
  </div>

  <!-- FEATURE SECTION -->
  <div class="section-primary">
    <div class="container">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2 section-body">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </div>
    </div>
    <div class="container {{meta.featured_img.class}}">
      <div class="row centered">
        <div class="col-sm-12">
          <div sup-widget-media
               ng-model="meta.featured_img">
            <img class="img-responsive center-block"
                 ng-src="{{meta.featured_img.src || g.default_featured}}"
                 alt="{{meta.featured_img.title}}" />
          </div>
        </div>
      </div><!-- row -->
    </div><!-- container -->
  </div>

  <!-- HIGHTLIGHT SECTION -->
  <div class="section-primary light-bg">
    <div class="container highlight">
      <div class="row centered"
           sup-widget-series
           default="{{[
             {
               'title': _('Title'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/f1.png'
             },
             {
               'title': _('Title'),
               'caption': _('Click here to edit the item.'),
               'src': theme_url+'/styles/f2.png'
             },
           ]}}"
           ng-model="meta.highlights">

        <div class="col-sm-4 highlight-item"
             ng-repeat="item in meta.highlights">
          <div ng-class="item.class"
               series-item>
            <img ng-src="{{g.img_holder}}"
                 style="{{item.src|thumbnail|bg_img}}" />
            <h4 class="text-nowrap">{{item.title}}</h4>
            <p class="text-clamp-3">{{item.caption}}</p>
          </div>
        </div>

        <div class="col-sm-4 highlight-item">
          <div series-item-create>
            <img ng-src="{{g.img_holder}}"
                 style="{{g.add_img|bg_img}}" />
            <h4 class="text-nowrap">
              {{_('Create New Item')}}
            </h4>
            <p class="text-clamp-3">
              {{_('Click here to add a new item.')}}
            </p>
          </div>
        </div>

      </div>
    </div>
  </div>

  <!-- CLIENTS SECTION -->
  <div class="section-primary dark-bg">
    <div class="container">
      <div class="row centered">
        <div class="col-md-8 col-md-offset-2 section-header">
          <h4>
            <span sup-widget-text
                  ng-model="meta.badges_title"
                  default="{{_('Our Partners')}}"></span>
          </h4>
        </div>
      </div>
      <div class="row centered"
           sup-widget-series
           default="{{[
             {'src': theme_url+'/styles/c1.png'},
             {'src': theme_url+'/styles/c2.png'},
             {'src': theme_url+'/styles/c3.png'}
           ]}}"
           ng-model="meta.badges">
        <div class="col-sm-2 col-xs-4
             {{$first?(meta.badges|col_offset:'col-sm-offset-':2:10):''}}"
             ng-repeat="item in meta.badges">
          <div ng-class="item.class"
               series-item>
            <a href="#"
               target="{{item.target}}">
              <img class="img-holder contain"
                   ng-src="{{g.img_holder}}"
                   alt="{{item.title}}"
                   style="{{item.src|thumbnail|bg_img}}" />
            </a>
          </div>
        </div>

        <div class="col-sm-2 col-xs-4"
             ng-class="{'col-sm-offset-5':(meta.badges|is_empty)}">
          <div series-item-create>
            <img class="img-holder contain"
                 ng-src="{{g.img_holder}}"
                 style="{{g.add_img|bg_img}}" />
          </div>
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
