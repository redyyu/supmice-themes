<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<!-- webfonts -->
<link ng-href="{{res_url}}/font/roboto/roboto.css"
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
<style sup-bind-html="theme_meta.styles"></style>
<section id="{{meta.slug}}" class="segment">
  <div class="container">
    <header>
      <h2>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h2>
      <h4 class="lead">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </h4>
    </header>

    <div class="row"
         sup-widget-series
         default="{{[
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f1.png'
            },
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f2.png'
            },
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f3.png'
            }
         ]}}"
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6"
           ng-repeat="item in meta.series">
        <div class="p-3 text-center {{item.class}}"
             series-item>
          <figure class="w-50 py-1 m-auto">
            <img class="rounded-circle thumbnail"
                 ng-src="{{g.trans}}"
                 style="{{item.src|bg_img}}" />
          </figure>
          <h5 class="text-truncate title">
            {{item.title || '&nbsp;'}}
          </h5>
          <p class="text-clamp-4">
            {{item.caption || '&nbsp;'}}
          </p>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="p-3 text-center"
             series-item-create>
          <figure class="w-50 py-1 m-auto">
            <img class="rounded-circle thumbnail"
                 ng-src="{{g.trans}}"
                 style="{{theme_url+'/assets/add_feature.png'|bg_img}}"/>
          </figure>
          <h5 class="text-truncate title">
            {{_('Create New Feature')}}
          </h5>
          <p class="text-clamp-4">
            {{_('Click here to add new one.')}}
          </p>
        </div>
      </div>

    </div>

  </div>
</section>
