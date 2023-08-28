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

<sup-body class="post single-post"></sup-body>

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

  <div id="content" class="site-content center-relative">
    <article>
      <h1 class="entry-title">
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <div class="center-relative clear">
        <div class="cat-links"
             sup-categorize
             ng-model="query.category">
          <a href="#"
             ng-repeat="term_key in meta.terms">
            {{query.category.terms_dict[term_key].meta.name}}
            {{ $last ?'':', '}}
          </a>
        </div>
        <div class="post-info">
          <div class="post-date">
            {{meta.date|date_formatted}}
          </div>
          <div class="post-author">
            {{meta.author}}
          </div>
        </div>

        <div class="entry-content">
          <div class="content-wrap center-text"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               ng-model="content">
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </article>
    <div class="nav-links">
      <div class="nav-previous"
           sup-widget-link
           ng-model="meta.prevpage">
        <a href="#" rel="prev">
          {{meta.prevpage.name || _('Previous')}}
        </a>
        <p class="nav-previous-text">
            <img ng-src="{{g.assets_url}}/left.png"
                 alt="{{_('Previous')}}" />
        </p>
        <div class="clear"></div>
      </div>
      <div class="nav-next"
           sup-widget-link
           ng-model="meta.nextpage">
        <a href="#" rel="next">
          {{meta.nextpage.name || _('Next')}}
        </a>
        <p class="nav-next-text">
            <img ng-src="{{g.assets_url}}/right.png"
                 alt="{{_('Next')}}" />
        </p>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
  </div>

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