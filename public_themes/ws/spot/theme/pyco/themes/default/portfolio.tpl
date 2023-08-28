<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>
<sup-set ng-model="g.img_cover_holder"
         value="{{theme_url+'/styles/trans_cover.png'}}"></sup-set>
<sup-set ng-model="g.default_featured"
         value="{{theme_url+'/styles/default.png'}}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/css/bootstrap.css"
      rel="stylesheet">

<!-- fonts -->
<!-- fonts -->
<link ng-href="{{theme_url}}/fonts/lato/lato.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/sup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
<!-- Fixed navbar -->
<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle"
              data-toggle="collapse"
              data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         ng-href="#">
        {{site_meta.title}}
      </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary"
            class="{{menu|active:meta.path}}">
          <a href="#"
             class="navbar-item {{menu.class}}"
             target="{{menu.target}}">
            {{menu.name}}
          </a>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>
<div class="navbar-placeholder"></div>

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
          <img class="featured-img"
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
          <img class="featured-img"
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

<!-- FOOTER -->
<div class="copyright">
  <div class="container">
  	<div class="row centered">
  		<p>
  			<span sup-bind-html="site_meta.copyright"></span>
  			<span sup-bind-html="site_meta.license"></span>
  		</p>
  	</div><!-- row -->
  </div><!-- container -->
</div><!-- Footer -->
