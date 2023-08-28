<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<!-- webfonts -->
<link ng-href="{{res_url}}/font/roboto/roboto.css"
      rel="stylesheet"
      type="text/css">

<!-- bootstrap -->
<link ng-href="{{theme_url}}/assets/bootstrap.min.css"
      rel="stylesheet"
      type="text/css">

<!-- styles -->
<link ng-href="{{theme_url}}/assets/main.css"
      rel="stylesheet"
      type="text/css">

<!-- custom -->
<style sup-bind-html="theme_meta.styles"></style>

<section id="{{meta.slug}}"
         class="segment {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div class="page-attrs">
    <div sup-widget-attrs
         ng-model="meta.attrs"
         structure="[
           {'key': 'hide_description',
            'label': _('Hide Description Text'),
            'value': false,
            'type': 'switch'},
         ]"></div>
  </div>
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.bg"></div>
  <div class="container">
    <header>
      <h2>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h2>
      <h4 class="lead"
          ng-show="!meta.attrs.hide_description">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           presets="[
           {'name':_('2 Columns'),
            'type':'column',
            'code':'<div class=&quot;row text-left&quot;>
              <div class=&quot;col-sm&quot;><p>'+_('$_CONTENT')+'</p></div>
              <div class=&quot;col-sm&quot;><p>'+_('$_CONTENT')+'</p></div>
              </div><div>&nbsp;</div>'}
           ]"
           ng-model="content"></div>
    </div>
  </div>
</section>
