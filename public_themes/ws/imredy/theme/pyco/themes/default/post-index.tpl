<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>



<!-- styles -->
<link ng-href="{{theme_url}}/libs/bootstrap.min.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/libs/magnific-popup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/redy.css"
      ng-if="theme_meta.options.imredy"
      rel="stylesheet">

<!-- custom styles -->
<style ng-bind="theme_meta.styles"></style>

<div class="body {{meta.bg.class}}"
     palette="{{g.opts.palette}}"
     style="{{meta.bg.style}}">

  <div sup-widget-bg ng-model="meta.bg"></div>

  <nav id="primary-nav">
  <a href="#" class="icon-btn menu menu-toggle" data-toggle="collapse"></a>
  <a href="#" class="logo">
    <img ng-src="{{site_meta.logo || g.logo}}"
         alt="{{site_meta.title}}" />
  </a>
  <ul class="nav">
    <li ng-repeat="item in menu.primary">
      <a href="#"
         class="{{item.class}} {{item|active:meta.path}}">
        {{item.name}}
      </a>
    </li>
  </ul>
</nav>
  <section class="wrapper">
    <div class="container entries"
         sup-query="post"
         ng-model="query.posts">
      <header>
        <h1>
          <span sup-widget-text
                default="{{_('Journal')}}"
                ng-model="meta.title"></span>
        </h1>
      </header>
      <div class="row entry"
           sup-widget-create
           type="post">
        <figure class="col-lg-2 col-md-3 col-sm-4">
          <a href="#">
            <img class="img-responsive img-holder"
                 ng-src="{{g.img_holder}}"
                 style="{{g.default_img|bg_img}}" />
          </a>
        </figure>
        <div class="col-lg-10 col-md-9 col-sm-8">
          <h3>
            <a href="#">{{_('Create new post')}}</a>
          </h3>
          <p>{{_('Click here to add a new post.')}}</p>
        </div>
      </div>
      <!-- entry -->
      <div class="row entry"
           ng-repeat="post in query.posts.contents"
           sup-widget-open="post">
        <figure class="col-lg-2 col-md-3 col-sm-4">
          <a href="#">
            <img class="img-responsive img-holder"
                 ng-src="{{g.img_holder}}"
                 style="{{(post.featured_img.src||g.default_img)
                          |thumbnail|bg_img}}"/>
          </a>
        </figure>
        <div class="col-lg-10 col-md-9 col-sm-8">
          <h3>
            <a href="#">{{post.title|striptags}}</a>
          </h3>
          <p>{{post.excerpt}}</p>
          <div class="ln more">
            <a href="#">{{_('Read more')}}</a>
          </div>
        </div>
      </div>
      <!-- #entry -->
      <!-- paginator -->
      <div class="paginator clearfix">
        <div class="text-left">
          <div class="ln next">
            <a href="#">
              {{_('Forward')}}
            </a>
          </div>
        </div>
        <div class="text-right">
          <div class="ln prev">
            <a href="#">
              {{_('Previous')}}
            </a>
          </div>
        </div>
      </div>
      <!-- #paginator -->
      <hr class="row">
    </div>
    <div class="container cr">
  <p>
    <span sup-bind-html="site_meta.copyright"></span>
    <span sup-bind-html="site_meta.license"></span>
  </p>
</div>
  </section>
  <aside id="sider">
  <a href="#" class="icon-btn share share-modal"></a>
</aside>
</div>