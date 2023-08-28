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
    <div class="row"
         sup-widget-series
         default="{{[
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f1.jpg'
            },
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f2.jpg'
            },
         ]}}"
         ng-model="meta.series">

      <div class="col-md-4 text-center"
           ng-repeat="item in meta.series">
        <div class="feature {{item.class}}">
          <div series-item>
            <figure class="mx-auto mb-4">
              <img class="icon"
                   ng-src="{{g.trans}}"
                   style="{{item.src|bg_img}}"
                   alt="{{item.title}}" />
            </figure>
            <h2 class="title text-truncate">
              {{item.title || '&nbsp;'}}
            </h2>
            <p class="text-clamp-6">
              {{item.caption || '&nbsp;'}}
            </p>
          </div>
        </div>
      </div>
      <div class="col-md-4 text-center">
        <div class="feature">
          <div series-item-create>
            <figure class="mx-auto mb-4">
              <img class="icon"
                   ng-src="{{g.trans}}"
                   style="{{g.add_img|bg_img}}"
                   alt="{{item.title}}" />
            </figure>
            <h2 class="title text-truncate">
              {{_('Feature Title')}}
            </h2>
            <p class="text-clamp-6">
              {{_('Click here to edit the feature.')}}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>