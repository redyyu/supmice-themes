<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<!-- bootstrap -->
<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/bootstrap.min.css">

<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/animate.css">

<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/owl.carousel.css">
<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/owl.transitions.css">
<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/owl.theme.css">

<link rel="stylesheet"
      ng-href="{{theme_url}}/styles/style.css">

<!-- Custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
<nav id="primary-nav"
     class="navbar navbar-default navbar-fixed-top sticky">
  <div class="container-fluid">
  <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle collapsed"
              data-toggle="collapse"
              data-target=".primary-navbar">
        <span class="sr-only">{{_('Toggle navigation')}}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         href="#">{{site_meta.title}}</a>
    </div>

    <div class="collapse navbar-collapse primary-navbar">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a href="{{menu.url}}"
             class="page-scroll {{menu.class}}"
             target="{{menu.target}}">{{menu.name}}</a>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</nav>

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="common">
  <div class="container">
    <header>
      <h2>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h2>
      <p>
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
    </header>

    <div id="owl-carosuel"
         class="owl-carousel owl-theme is-block">

      <div class="client"
           sup-widget-carousel
           default="{{[
             {
               'title': _('Client Title'),
               'caption': _('Click here to edit the client.'),
               'src': theme_url+'/styles/client1.png'
             },
             {
               'title': _('Client Title'),
               'caption': _('Click here to edit the client.'),
               'src': theme_url+'/styles/client2.png'
             },
             {
               'title': _('Client Title'),
               'caption': _('Click here to edit the client.'),
               'src': theme_url+'/styles/client3.png'
             },
           ]}}"
           ng-model="meta.carousel">
        <h3>{{meta.carousel[0].title}}</h3>
        <img class="thumbnail-img"
             ng-src="{{theme_url}}/styles/trans_cover.png"
             style="{{meta.carousel[0].src|bg_img}}">
        <p>{{meta.carousel[0].caption}}</p>
      </div>

    </div>
  </div>
</section>
