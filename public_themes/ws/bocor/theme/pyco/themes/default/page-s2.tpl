<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<!-- Bootstrap CSS -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css"
      rel="stylesheet" />
<!-- Lightbox -->
<link ng-href="{{theme_url}}/styles/nivo-lightbox.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/nivo-lightbox-theme/default/default.css"
      rel="stylesheet" />

<!-- Styles -->
<link ng-href="{{theme_url}}/styles/style.css"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/palette.css"
      rel="stylesheet" />

<!-- Custom styles -->
<style sup-bind-html="theme_meta.styles"></style>


<div palette="{{g.opts.palette}}">

  <section id="{{meta.slug}}"
           class="segment">
    <div>

      <div class="container marginbot-50">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="section-heading text-center">
              <h2 class="h-bold">
                <div sup-widget-text
                     default="{{_('Title')}}"
                     ng-model="meta.title"></div>
              </h2>
              <div class="divider-header"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row marginbot-80">
          <div class="col-md-8 col-md-offset-2">
            <div class="row">
              <div class="col-sm-6">
                <div sup-widget-media
                     ng-model="meta.featured_img">
                  <img class="img-responsive center-block"
                       ng-src="{{meta.featured_img.src||g.default_img}}"
                       alt="{{page.featured_img.title}}" />
                </div>
              </div>
              <div class="col-sm-6">
                <div class="content"
                     sup-angular-wysiwyg
                     default="{{_('$_CONTENT')}}"
                     ng-model="content">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

</div>