<sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default_img.jpg'}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css" rel="stylesheet">
<!-- plugin -->
<link ng-href="{{theme_url}}/styles/animate.min.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/magnific-popup.css" rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/style.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/editor.css" rel="stylesheet">

<!-- custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<nav id="primary-nav"

     class="navbar navbar-default navbar-fixed-top"

     ng-class="{'affix': meta.template!='index'}">

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

           <img class="logo"

                ng-src="{{site_meta.logo}}"

                ng-if="site_meta.logo"/>

           {{site_meta.logo?'':site_meta.title}}

      </a>

    </div>



    <div class="collapse navbar-collapse" id="primary-navbar">

      <ul class="nav navbar-nav navbar-right">

        <li ng-repeat="menu in menu.primary">

          <a href="#"

             class="{{menu.class}}"

             target="{{menu.target}}">{{menu.title}}</a>

        </li>

      </ul>

    </div>

    <!-- /.navbar-collapse -->

  </div>

  <!-- /.container-fluid -->

</nav>

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
        <hr class="light">
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
        <figure class="text-center">
          <div sup-widget-media
               ng-model="meta.featured_img">
            <img class="img-responsive"
                 ng-src="{{meta.featured_img.src||g.default_img}}" />
          </div>
        </figure>
      </div>
    </div>

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

<section class="no-border">
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="row img-gallery attachments"
             sup-widget-collection
             ng-model="meta.attachments">

          <div class="col-md-3 item"
               ng-repeat="pic in meta.attachments">
            <figure>
              <a href="#"
                 class="img-popup">
                <img ng-src="{{theme_url}}/styles/trans.png"
                     class="thumbnail-img"
                     style="{{'background-image:url('+
                              (pic.src|thumbnail)+');'}}"/>
              </a>
            </figure>
          </div>

          <div class="col-md-3 item"
               ng-if="!meta.attachments||meta.attachments.length==0"
               ng-repeat="i in [1,2,3,4]">
            <figure>
              <a href="#"
                 class="img-popup">
                <img ng-src="{{theme_url}}/styles/trans.png"
                     class="thumbnail-img"
                     style="background-image:url('{{g.default_img}}')" />
              </a>
            </figure>
          </div>

        </div>
      </div>
    </div>
  </div>
</section>

<footer>

	<div class="container">

		<div class="row">

			<div class="text-center">

				<p>

					<span ng-bind-html="site_meta.copyright"></span>

					<span ng-bind-html="site_meta.license"></span>

				</p>

			</div>

		</div>

	</div>

</footer>


