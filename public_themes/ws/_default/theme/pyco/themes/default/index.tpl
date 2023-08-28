<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>
<!-- bootstrap css -->
<link ng-href="{{theme_url}}/libs/bootstrap/css/bootstrap.min.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
<!-- Navigation -->
<!-- Navigation -->
<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header page-scroll">
      <button type="button" class="navbar-toggle" data-toggle="collapse">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">{{site_meta.title}}</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li class="{{item.class}}"
            ng-repeat="item in menu['primary']">
          <a href="#">{{item.name}}</a>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container -->
</nav>


<!-- Page Header -->
<header class="intro-header home-kv {{meta.hero.class}}"
        style="{{meta.hero.style}}">
  <div sup-widget-bg
       presets="[
         {'key': 'repeat-bg', 'label': _('Repeat')}
       ]"
       ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="site-heading">
          <h1>
            <span sup-widget-text
                  default="{{_('Title')}}"
                  ng-model="meta.title"></span>
          </h1>
          <hr class="small">
          <span class="subheading"
                sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- Main Content -->
<div class="container">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"
         sup-query='post'
         ng-model="query.posts">
      <!-- Create -->
      <div sup-widget-create type="post">
        <div class="post-preview">
          <a href="#">
            <h2 class="post-title">
              {{_('Create New Post')}}
            </h2>
            <h3 class="post-subtitle">
                {{_('Click here to create a new post')}}
            </h3>
          </a>
          <p class="post-meta">
            {{_("Only published articles will appear here.")}}
          </p>
        </div>
        <hr>
      </div>
      <div ng-repeat="post in query.posts.contents">
        <div class="post-preview"
             sup-widget-open
             file="post">
          <a href="#">
            <h2 class="post-title" sup-bind-html="post.title"></h2>
            <h3 class="post-subtitle">
                {{post.description}}
            </h3>
          </a>
          <p class="post-meta">
            {{_("Posted by")}}
            <a href="#">{{post.author}}</a>
            {{_("on")}}
            {{post.date|date_formatted}}
          </p>
        </div>
        <hr>
      </div>
      <!-- Pager -->
      <ul class="pager">
        <li class="next">
          <a href="#">{{_('Older Posts')}} &rarr;</a>
        </li>
      </ul>
    </div>
  </div>
</div>
<hr>
<!-- Footer -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <p class="copyright text-muted">
          <span sup-bind-html="site_meta.copyright"></span>
          <span sup-bind-html="site_meta.license"></span>
        </p>
      </div>
    </div>
  </div>
</footer>