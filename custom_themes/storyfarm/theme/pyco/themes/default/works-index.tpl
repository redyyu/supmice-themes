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


<section class="no-padding no-border"
         sup-query="works"
         perpage="6"
         ng-model="query.works">
  <div class="container-fluid">
    <div class="row no-gutter">

      <div class="col-md-4 col-sm-6"
           ng-repeat="item in query.works.contents">
        <a href="{{item.url}}"
           class="portfolio-box">
          <img ng-src="{{theme_url}}/styles/trans_16x10.png"
               class="img-responsive"
               style="{{(item.featured_img.src || g.default_img)
                         |thumbnail|bg_img}}"
               alt="{{item.title}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{item.title}}
              </div>
              <div class="project-caption faded">
                {{item.description}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>
</section>

<section class="no-border">
  <div class="container">

    <ul class="pager">

      <li class="previous">
        <a href="#">
         &larr; {{_('Previous')}}
        </a>
      </li>

      <li class="next">
        <a href="#">
          {{_('Next')}} &rarr;
        </a>
      </li>

    </ul>

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


