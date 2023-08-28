<sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default.jpg'}}"></sup-set><sup-set ng-model="g.add_img"         value="{{theme_url+'/styles/add.png'}}"></sup-set><sup-set ng-model="g.img_holder"         value="{{theme_url+'/styles/trans.png'}}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.css"
      rel="stylesheet">
<!-- plugins -->
<link ng-href="{{theme_url}}/styles/magnific-popup.css"
      rel="stylesheet">

<!-- fonts -->
<link ng-href="{{theme_url}}/fonts/lato/lato.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/fonts/raleway/raleway.css"
      rel="stylesheet">

<link ng-href="{{theme_url}}/styles/font-awesome/css/font-awesome.min.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/common.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<section id="id-{{meta.slug}}">
  <div class="page section-primary {{meta.bg.class}}"
       style="{{meta.bg.style}}">
    <div sup-widget-bg
         presets="[{'key': 'palette-dark', 'label': 'Darkness'}]"
         ng-model="meta.bg"></div>
    <div class="container text-center">

      <div class="row">
        <div class="col-md-8 col-md-offset-2 section-header">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
        </div>
      </div>

      <div class="row">
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