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
         class="primary-section text-center">

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
    <div class="row"
         sup-widget-series
         default="{{[
           {
             'src': theme_url+'/styles/t1.jpg',
             'title': _('Member Name'),
             'caption': _('Edit the member.')
           },
           {
             'src': theme_url+'/styles/t2.jpg',
             'title': _('Member Name'),
             'caption': _('Edit the member.')
           },
           {
             'src': theme_url+'/styles/t3.jpg',
             'title': _('Member Name'),
             'caption': _('Edit the member.')
           }
         ]}}"
         ng-model="meta.series">
      <div class="col-sm-6 col-md-3 team-box"
           ng-repeat="item in meta.series">

        <div series-item>
          <div class="team boxed-gray">
            <div class="inner">
              <h5 class="text-nowrap">
                {{item.title}}
              </h5>
              <p class="subtitle text-nowrap">
                {{item.caption}}
              </p>
              <div class="avatar">
                <img ng-src="{{g.img_holder}}"
                     class="img-responsive thumbnail-img"
                     style="{{item.src|thumbnail|bg_img}}" />
              </div>
            </div>
          </div>
        </div>

      </div>

      <div class="col-sm-6 col-md-3 team-box">

        <div series-item-create>
          <div class="team boxed-gray">
            <div class="inner">
              <h5 class="text-nowrap">
                {{_('Create New Member')}}
              </h5>
              <p class="subtitle text-nowrap">
                {{_('Add a new member.')}}
              </p>
              <div class="avatar">
                <img ng-src="{{g.img_holder}}"
                     class="img-responsive thumbnail-img"
                     style="{{g.add_img|bg_img}}" />
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
