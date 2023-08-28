<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>
<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>
<sup-set ng-model="g.img_cover_holder"
         value="{{theme_url+'/styles/trans_cover.png'}}"></sup-set>
<sup-set ng-model="g.default_featured"
         value="{{theme_url+'/styles/featured.jpg'}}"></sup-set>
<!-- bootstrap css -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css"
      rel="stylesheet">
<!-- plugin css -->
<link ng-href="{{theme_url}}/styles/magnific-popup.css"
      rel="stylesheet">
<!-- theme css -->
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
<!-- Fixed navbar -->
<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">
        <img ng-src="{{site_meta.logo || g.logo}}" />
        <span>{{site_meta.title || _('Title')}}</span>
      </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary"
            class="{{menu|active:meta.path:match_nodes}}"
            ng-class="{'dropdown': menu.nodes.length}">
          <a href="#"
             class="navbar-item {{menu.class}}"
             ng-class="{'dropdown-toggle': menu.nodes.length}"
             target="{{menu.target}}">
            {{menu.name}}
            <span class="caret"
                  ng-if="menu.nodes.length"></span>
          </a>
        </li>
        <li class="language"
            ng-if="languages.length">
          <a class="popup-modal btn-lg"
             href="#">
            <span class="glyphicon glyphicon-globe"></span>
          </a>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>


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

  <!-- FOOTER -->
<div class="footer copyright">
  <div class="container">
  	<div class="row centered">
  		<p>
  			<span sup-bind-html="site_meta.copyright"></span>
  			<span sup-bind-html="site_meta.license"></span>
  		</p>
  	</div><!-- row -->
  </div><!-- container -->
</div><!-- Footer -->
</div>