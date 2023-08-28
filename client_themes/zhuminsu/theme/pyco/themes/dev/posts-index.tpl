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


<section sup-query="post"
         ng-model="query.posts">
  <div class="container posts">

    <div class="row item"
         ng-repeat="post in query.posts">
      <div class="col-md-6">
        <figure>
          <img ng-src="{{post.featured_img.src|thumbnail}}"
               class="img-responsive thumbnail-img" />
        </figure>
      </div>
      <div class="col-md-6">
        <h3>{{post.title}}</h3>
        <p>{{post.description}}</p>
        <p><a href="#">{{_('Read More')}}</a></p>
      </div>
    </div>

    <hr>
  </div>
  <div class="container">

    <ul class="pager">
      <li>
        <a href="#">
         &larr; {{_('Newer Posts')}}
        </a>
      </li>
      <li>
        <a href="#">
          {{_('Older Posts')}} &rarr;
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

					<span ng-bind-html="site_meta.copyright"></span>

					<span ng-bind-html="site_meta.license"></span>

				</p>

			</div>

		</div>

	</div>

</footer>


