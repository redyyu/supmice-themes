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

  <div class="site-content">
    <div class="block content-1170 center-relative">
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

    <article>
      <div class="content-970 center-relative"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content">
      </div>
      <div class="clear"></div>
    </article>
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