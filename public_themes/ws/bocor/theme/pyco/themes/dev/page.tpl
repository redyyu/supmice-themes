<sup-set ng-model="g.ver" value="{{theme_meta.version}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set><sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<!-- Bootstrap CSS -->
<link ng-href="{{theme_url}}/styles/bootstrap.min.css?{{g.ver}}"
      rel="stylesheet" />
<!-- Lightbox -->
<link ng-href="{{theme_url}}/styles/nivo-lightbox.css?{{g.ver}}"
      rel="stylesheet" />
<link ng-href="{{theme_url+'/styles/nivo-lightbox-theme/'+
                 'default/default.css?'+g.ver}}"
      rel="stylesheet" />

<!-- Styles -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet" />
<link ng-href="{{theme_url}}/styles/palette.css?{{g.ver}}"
      rel="stylesheet" />

<!-- Custom styles -->
<style ng-bind-html="theme_meta.styles"></style>

<div palette="{{g.opts.palette}}">

  <section id="id-{{meta.slug}}"
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
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="content"
                 sup-angular-wysiwyg
                 default="{{_('$_CONTENT')}}"
                 ng-model="content">
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

</div>