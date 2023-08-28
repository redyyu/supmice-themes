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

      <div class="container text-center"
           sup-widget-series
           default="{{[
             {'src': theme_url+'/styles/p1.jpg'},
             {'src': theme_url+'/styles/p2.jpg'},
             {'src': theme_url+'/styles/p3.jpg'}
           ]}}"
           ng-model="meta.series">
        <div class="row">

          <div class="col-sm-6 col-md-3 gallery-item"
               ng-repeat="item in meta.series">
            <div class="item-hover"
                 series-item>
              <img class="img-responsive thumbnail-img"
                   ng-src="{{theme_url}}/styles/trans.png"
                   style="{{item.src|bg_img}}">
            </div>
          </div>

          <div class="col-sm-6 col-md-3 gallery-item">
            <div class="item-hover"
                 series-item-create>
              <img class="img-responsive thumbnail-img"
                   ng-src="{{theme_url}}/styles/trans.png"
                   style="{{g.add_img|bg_img}}');">
            </div>
          </div>

        </div>
      </div>

    </div>
  </section>

</div>