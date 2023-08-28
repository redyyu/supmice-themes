<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css"
      rel="stylesheet">

<!-- plugins -->
<link ng-href="{{theme_url}}/styles/gnmenu/gnmenu.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/nivo-lightbox.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/nivo-lightbox-theme/default/default.css"
      rel="stylesheet"/>

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/palette.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/editor.css"
      rel="stylesheet">

<!-- additional -->
<style sup-bind-html="theme_meta.styles"></style>

<section id="{{meta.slug}}"
         class="primary-section">

  <div class="container text-center">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="section-heading marginbot-50">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
          <p>
            <span sup-widget-text
                  ng-model="meta.description"
                  default="{{_('Description text here')}}"></span>
          </p>
        </div>
      </div>
    </div>
  </div>

  <div class="container text-center">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             ng-model="content"
             default="{{_('$_CONTENT')}}">
        </div>
      </div>
    </div>
  </div>

</section>
