<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.larger_img"
         value="{{theme_url+'/styles/larger.jpg'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.add_item"
         value="{{theme_url+'/styles/add_item.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<sup-set ng-model="g.badge_holder"
         value="{{theme_url+'/styles/trans_badge.png'}}"></sup-set>

<sup-set ng-model="g.default_features"
         object="[
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_1.png'
           },
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_2.png'
           },
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_3.png'
           },
           {
             'title': _('Item Title'),
             'caption': _('Click here to edit this item.'),
             'src': theme_url+'/styles/fe_ico_4.png'
           }
         ]"></sup-set>

<sup-set ng-model="g.default_clients"
         object="[
           {
             'title': _('Client Name'),
             'src': theme_url+'/styles/client_1.png'
           },
           {
             'title': _('Client Name'),
             'src': theme_url+'/styles/client_2.png'
           },
           {
             'title': _('Client Name'),
             'src': theme_url+'/styles/client_3.png'
           }
         ]"></sup-set>


<sup-set ng-model="g.default_badges"
         object="[
           {
             'title': _('Apple iOS'),
             'src': theme_url+'/styles/app_badge_apple.png',
             'link': '#'
           },
           {
             'title': _('Google Play'),
             'src': theme_url+'/styles/app_badge_android.png',
             'link': '#'
           },
           {
             'title': _('Windows Phone'),
             'src': theme_url+'/styles/app_badge_wp.png',
             'link': '#'
           }
         ]"></sup-set>

<!-- fonts -->
<link ng-href='{{theme_url}}/styles/fonts/lato.css'
      rel='stylesheet'>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/bootstrap.min.css"
      rel='stylesheet'>

<!-- common -->
<link ng-href="{{theme_url}}/styles/common.css"
      rel="stylesheet">

<!-- styles-->
<link ng-href="{{theme_url}}/styles/style.css"
      rel='stylesheet'>

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>



<!-- Header -->
<header class="masthead">
  <nav class="container nav-primary">
    <div class="navbar">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <div class="navbar-brand">
          {{site_meta.title}}
        </div>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li ng-repeat="nav in menu.primary">
            <a href="#" class="parallax-link {{nav.meta.class}}">
              {{nav.name}}
            </a>
          </li>
          <li ng-if="languages.length">
            <a href="#" class="language">
              <span class="language-switcher-text">
                {{_('Languages')}}
              </span>&nbsp;<span class="caret"></span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>
<!-- #Header -->
<!-- Main -->
<section id="{{meta.slug}}" class="main-section">
  <div sup-widget-bg
       ng-model="meta.hero"></div>
  <div class="container">
    <div class="brand">
      <div class="logo">
        <div sup-widget-media
             ng-model="meta.logo">
          <img ng-src="{{meta.logo.src || site_meta.logo || g.logo}}"
               alt="{{site_meta.title}}" />
        </div>
      </div>
      <h1>
        <span sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></span>
      </h1>
      <h2>
        <span sup-widget-text
              ng-model="meta.subtitle"
              default="{{_('Subtitle text here')}}"></span>
      </h2>
    </div>
    <div class="get-link"
         sup-widget-attrs
         ng-model="meta.mailto"
         structure="[
           {'key': 'address', 'label': _('Email Address'),
            'value': 'your@email.here'},

           {'key': 'subject', 'label': _('Email Subject'),
            'value': _('Email subject here')},

           {'key': 'btntext', 'label':_('Button Text'),
            'value': _('Get Link')},

           {'key': 'hidden', 'label':_('Hidden'),
            'value': false, 'type': 'switch'},
         ]">

      <form action="#"
            ng-show="!meta.mailto.hidden">
        <input type="hidden"
               name="subject"
               value="{{meta.mailto.subject}}">
        <div class="form-group row">
          <div class="col-sm-8">
            <!-- email -->
            <input type="email"
                   name="email"
                   placeholder="{{_('Email Address here')}}"
                   class="form-control email">
            <!-- #email -->
          </div>
          <div class="col-sm-4">
            <button class="btn btn-primary btn-block">
              {{meta.mailto.btntext}}
            </button>
          </div>
        </div>
      </form>
    </div>

    <div>
      <div class="excerpt">
        <p>
          <span sup-widget-text
                ng-model="meta.description"
                default="{{_('Description text here')}}"></span>
        </p>
      </div>
      <div class="store">
        <div class="row"
             sup-widget-series
             default="{{g.default_badges}}"
             limit="3"
             ng-model="meta.badges">
          <div class="col-sm-4
                      {{meta.badges.length < 2 ? 'col-sm-offset-2' : ''}}"
               ng-repeat="prd in (meta.badges|limitTo:3)">
            <div series-item>
              <a class="flag {{prd.class}}"
                 href="#">
                <img ng-src="{{g.badge_holder}}"
                     style="{{prd.src|bg_img}}" />
              </a>
            </div>
          </div>
          <div class="col-sm-4
                      {{meta.badges.length < 1?'col-sm-offset-4':''}}">
            <div series-item-create>
              <a class="flag"
                 href="#">
                <img ng-src="{{g.add_item}}"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="learn-more">
        <a href="#"
           class="btn-more">
          {{_('Learn More')}}
        </a>
      </div>
		</div>
  </div>
</section>
<!-- #Main -->
<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           class="content-block {{page.bg.class}}"
           style="{{page.bg.style}}"
           ng-repeat="page in segments"
           ng-if="page.template != meta.template">

  	<!-- segments -->
    <div ng-if="page.template == 'page'">
      <div class="container" segment>
  <div class="row">
    <div class="col-md-8 col-md-offset-2 textbox">
      <header class="text-center">
        <h2 sup-bind-html="page.title"></h2>
      </header>
      <div class="content text-center"
           sup-bind-html="page.content">
      </div>
    </div>
  </div>
</div>
    </div>
    <div ng-if="page.template == 'page-s1'">
      <div class="container" segment>
  <div class="row">
    <div class="col-md-6 pull-right textbox aside">
      <header>
        <h2 sup-bind-html="page.title"></h2>
      </header>
      <div class="content"
           sup-bind-html="page.content">
      </div>
    </div>
    <div class="col-md-6 pull-left imgbox">
      <img ng-src="{{page.featured_img.src || g.default_img}}"
           alt="{{page.featured_img.title}}" />
    </div>
  </div>
</div>
    </div>
    <div ng-if="page.template == 'page-s2'">
      <div class="container" segment>
  <div class="row">
    <div class="col-md-6 pull-left textbox aside">
      <header>
        <h2 sup-bind-html="page.title"></h2>
      </header>
      <div class="content"
           sup-bind-html="page.content">
      </div>
    </div>
    <div class="col-md-6 pull-right imgbox">
      <img ng-src="{{page.featured_img.src || g.default_img}}"
           alt="{{page.featured_img.title}}"
           class="{{page.featured_img.class}}"/>
    </div>
  </div>
</div>
    </div>
    <div ng-if="page.template == 'page-s3'">
      <div class="container" segment>
  <div class="row">
    <div class="col-md-12">
      <header class="text-center">
        <h2 sup-bind-html="page.title"></h2>
      </header>
    </div>
    <div class="col-md-12">
      <div class="content textbox text-center"
           sup-bind-html="page.content">
      </div>
      <div class="imgbox">
        <img ng-src="{{page.featured_img.src || g.larger_img}}"
             alt="{{page.title}}"
             class="{{page.featured_img.class}}" />
      </div>
    </div>
  </div>
</div>
    </div>
    <div ng-if="page.template == 'features'">
      <div class="container" segment>
  <div class="row">
    <div class="col-sm-3 text-center feature {{item.class}}"
         ng-repeat="item in page.series">
      <figure>
        <img ng-src="{{g.img_holder}}"
             class="img-holder"
             style="{{item.src|bg_img}}">
      </figure>
      <h3 class="text-nowrap">{{item.title}}</h3>
      <p class="text-clamp-3 caption"
         sup-bind-html="item.caption">
      </p>
    </div>
  </div>
</div>
    </div>
    <div ng-if="page.template == 'clients'">
      <div class="container" segment>
  <div class="row">
    <div class="col-md-12">
      <header class="text-center">
        <h2 sup-bind-html="page.title"></h2>
      </header>
    </div>
  </div>
  <div class="row">

    <div class="{{$first?(page.series|col_offset:'col-sm-offset-':4):''}}
                item {{item.class}}"
         ng-class="{'col-sm-3': page.series.length >= 4,
                    'col-sm-4': page.series.length < 4}"
         ng-repeat="item in page.series">
      <a href="#">
        <img ng-src="{{g.img_holder}}"
             class="img-holder"
             style="{{item.src|bg_img}}" />
      </a>
    </div>

  </div>
</div>
    </div>
  	<!-- #Section Blocks -->

  </section>
  <section class="content-block last">
    <div>
      <div class="container">
        <div segment-create="major"></div>
      </div>
    </div>
  </section>
</div>

<!-- Footer -->
<footer class="footer">
  <div class="container">
    <div class="shareto"
         ng-hide="socials|is_empty">
      <div ng-repeat="social in socials"
           sup-bind-html="social.code">
      </div>
    </div>
    <div class="copyright">
      <span sup-bind-html="site_meta.copyright"></span>
		  <span sup-bind-html="site_meta.license"></span>
    </div>
  </div>
</footer>
<!-- #Footer -->


<div class="cover {{meta.hero.class}}"
     style="{{meta.hero.style}}"></div>
