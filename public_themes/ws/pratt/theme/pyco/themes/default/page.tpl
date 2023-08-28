<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.png'}}"></sup-set>

<sup-set ng-model="g.default_hero"
         value="{{theme_url+'/styles/hero.png'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<sup-set ng-model="g.img_holder_cover"
         value="{{theme_url+'/styles/trans_cover.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/css/bootstrap.css"
      rel="stylesheet">
<!-- plugins -->
<link ng-href="{{theme_url}}/libs/magnific-popup/magnific-popup.css"
      rel="stylesheet">

<!-- fonts -->
<link ng-href="{{theme_url}}/fonts/lato/lato.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/fonts/raleway/raleway.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/sup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>

<section id="{{meta.slug}}">
  <div class="section-primary {{meta.bg.class}}"
       style="{{meta.bg.style}}">

    <div sup-widget-bg ng-model="meta.bg"></div>

    <div class="container">

      <div class="row centered section-header">
        <div class="col-md-8 col-md-offset-2">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
        </div>
      </div>

      <div class="row centered">
        <div class="col-md-8 col-md-offset-2">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </div>
      </div>

    </div>

  </div>
</section>