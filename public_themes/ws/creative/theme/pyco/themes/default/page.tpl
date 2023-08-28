<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css"
      rel="stylesheet">
<!-- plugin -->
<link ng-href="{{theme_url}}/styles/animate.min.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/magnific-popup.css"
      rel="stylesheet">
<!-- custom -->
<link ng-href="{{theme_url}}/styles/creative.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/editor.css"
      rel="stylesheet">

<!-- Custom styles -->
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
         href="#">{{site_meta.title}}</a>
    </div>

    <div class="collapse navbar-collapse" id="primary-navbar">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
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
         class="segment-wrapper {{meta.bg.class}} no-border"
         style="{{meta.bg.style}}">
  <div class="container">
    <div sup-widget-bg
         presets="[
           {'key': 'palette-orange', 'label': _('Orange')},
           {'key': 'palette-dark', 'label': _('Darkness')}
         ]"
         ng-model="meta.bg"></div>
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
        <hr class="divider">
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
      </div>
    </div>
  </div>
</section>
