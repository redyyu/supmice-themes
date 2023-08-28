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
             {
               'title': _('Service Title'),
               'caption': _('Click here to edit the service.'),
               'src': theme_url+'/styles/service_1.png'
             },
             {
               'title': _('Service Title'),
               'caption': _('Click here to edit the service.'),
               'src': theme_url+'/styles/service_2.png'
             },
           ]}}"
           ng-model="meta.series">
        <div class="row">
          <!-- items -->
          <div class="col-sm-4"
               ng-repeat="item in meta.series">
            <div class="service-box"
                 series-item>
              <div class="service-icon">
                <img class="thumbnail-img"
                     ng-src="{{theme_url}}/styles/trans.png"
                     style="{{item.src|bg_img}}">
              </div>
              <div class="service-desc">
                <h5 class="text-nowrap">
                  {{item.title}}
                </h5>
                <div class="divider-header"></div>
                <p class="text-clamp-3">
                  {{item.caption}}
                </p>
              </div>
            </div>
          </div>
          <!-- #items -->
          <!-- empty -->
          <div class="col-sm-4">
            <div class="service-box"
                 series-item-create>
              <div class="service-icon">
                <img class="thumbnail-img"
                     ng-src="{{theme_url}}/styles/trans.png"
                     style="{{g.add_img|bg_img}}">
              </div>
              <div class="service-desc">
                <h5 class="text-nowrap">
                  {{_('Create New Service')}}
                </h5>
                <div class="divider-header"></div>
                <p class="text-clamp-3">
                  {{_('Click here add a new service.')}}
                </p>
              </div>
            </div>
          </div>
          <!-- #empty -->
        </div>
      </div>

    </div>
  </section>

</div>