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

  <section class="wrapper">
    <article class="container paper">
      <header class="upper">
        <h1>
          <span default="{{_('Error 404')}}"
                sup-widget-text ng-model="meta.title"></span>
        </h1>
      </header>
      <hr class="row">
      <!-- content -->
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_ERROR404')}}"
           ng-model="content">
      </div>
      <!-- #content -->
      <hr class="row">
    </article>
    <div class="container cr">
  <p>
    <span sup-bind-html="site_meta.copyright"></span>
    <span sup-bind-html="site_meta.license"></span>
  </p>
</div>
  </section>
</body>
</html>
