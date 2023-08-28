<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/assets/add.png'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<!-- webfonts -->
<link ng-href="{{res_url}}/font/lato/lato.css"
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
<style ng-bind="theme_meta.styles"></style>

<section id="{{meta.slug}}" class="segment">
  <div class="container">
    <div class="row justify-content-center">
      <article class="col-md-8 mb-4 text-center">
        <header>
          <h2 sup-widget-text
              ng-model="meta.title"
              default="{{_('Title')}}"></h2>
        </header>
        <div sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}"></div>
      </article>
    </div>
  </div>
</section>
