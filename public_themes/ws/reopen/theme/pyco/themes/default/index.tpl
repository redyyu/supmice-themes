<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>

<sup-set ng-model="g.assets_url"
         value="{{theme_url+'/assets'}}"></sup-set>

<sup-set ng-model="g.logo"
         value="{{theme_url+'/assets/logo.png'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/assets/add_img.jpg'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<!-- webfonts -->
<link ng-href="{{res_url}}/font/alegreya/alegreya.css"
      rel="stylesheet"
      type="text/css">

<!-- styles -->
<link ng-href="{{g.assets_url}}/style.css"
      rel="stylesheet"
      type="text/css">

<!-- custom -->
<style>{{theme_meta.styles}}</style>

<sup-body class="page"></sup-body>


<div class="body-wrapper">
  <div class="header-holder center-relative relative">
  <div class="header-logo center-text">
    <a href="#">
      <img ng-src="{{meta.logo.src || site_meta.logo || g.logo}}">
    </a>
  </div>
  <div class="toggle-holder absolute">
    <div id="toggle">
      <div class="first-menu-line"></div>
      <div class="second-menu-line"></div>
      <div class="third-menu-line"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
  <div class="page-attrs">
    <div sup-widget-attrs
         ng-model="meta.attrs"
         outline-none
         structure="[
           {'key': 'perpage',
            'label': _('Number of Perpage'),
            'value': g.opts.perpage,
            'type': 'text'},
           {'key': 'hide_headline',
            'label': _('Hide Headline'),
            'value': false,
            'type': 'switch'},
         ]"></div>
  </div>
  <div class="block content-1170 center-relative"
       ng-if="!meta.attrs.hide_headline">
    <h1 class="entry-title">
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h1>
    <p class="page-desc">
      <span sup-widget-text
            default="{{_('Description text here')}}"
            ng-model="meta.description"></span>
    </p>
  </div>

  <div class="grid" id="portfolio"
       sup-query="post"
       perpage="(meta.attrs.perpage||g.opts.perpage)"
       ng-model="query.result">
    <div class="grid-sizer"
         sup-categorize
         ng-model="query.category"></div>

    <div class="grid-item element-item">
      <div sup-widget-create
           type="post">
        <img ng-src="{{g.add_img}}" />
      </div>
    </div>

    <div class="grid-item element-item"
         ng-repeat="post in query.result.contents">
      <a href="#">
        <img ng-src="{{(post.featured_img.src || g.default_img)|thumbnail}}"
             alt="{{post.title}}" />
        <div class="portfolio-text-holder">
          <p class="portfolio-text">
            {{post.title}}
          </p>
          <p class="portfolio-type">
             <span>
              {{query.category.terms_dict[post.terms[0]].meta.name}}
            </span>
          </p>
        </div>
      </a>
    </div>

  </div>

  <div class="clear"></div>

  <div class="content-1170 center-relative center-text top-50 bottom-50">
    <a class="more-posts-portfolio"
       href="#">
      <img ng-src="{{g.assets_url}}/load_more.png"
           alt="{{_('Load more')}}" />
    </a>
  </div>

  <div class="clear"></div>
  <!-- footer -->
<footer class="footer">
  <div class="content-970 center-relative">
    <ul>
      <li sup-bind-html="site_meta.copyright"></li>
      <li sup-bind-html="site_meta.license"></li>
      <li>
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        <small>
          {{_('Modified with')}}
          <a href="#">Colorlib</a>
        </small>
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
      </li>
    </ul>
  </div>
</footer>
</div>
