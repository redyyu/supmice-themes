<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>


<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css" rel="stylesheet">
<!-- plugin -->
<link ng-href="{{theme_url}}/styles/magnific-popup.css" rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/style.css" rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>

<nav id="primary-nav"
     class="navbar navbar-default navbar-fixed-top affix">
  <div class="container-fluid">
  <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target="#primary-navbar">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">
        {{site_meta.title}}
      </a>
    </div>

    <div class="collapse navbar-collapse" id="primary-navbar">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
             class="{{menu.class}}"
             target="{{menu.target}}">{{menu.name}}</a>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</nav>


<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
        <hr>
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
        <hr>
      </div>
    </div>
  </div>
</section>

<section class="no-padding no-border">
  <div class="container">
    <div class="row"
         sup-widget-series
         ng-model="meta.series">

      <div class="col-lg-3 col-md-4 col-sm-6 text-center"
           ng-repeat="item in meta.series">
        <a href="#"
           series-item>
          <img class="img-responsive img-client"
               ng-src="{{theme_url}}/styles/trans_16x10.png"
               style="{{item.src|thumbnail|bg_img}}">
        </a>
      </div>

      <div class="col-lg-3 col-md-4 col-sm-6 text-center">
        <a href="#"
           series-item-create>
          <img class="img-responsive img-client"
               ng-src="{{theme_url}}/styles/trans_16x10.png"
               style="{{g.add_img|bg_img}}">
        </a>
      </div>

    </div>
  </div>
</section>

<footer>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<p>
					<span sup-bind-html="site_meta.copyright"></span>
					<span sup-bind-html="site_meta.license"></span>
				</p>
			</div>
		</div>
	</div>
</footer>


