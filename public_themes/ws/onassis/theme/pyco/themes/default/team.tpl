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

<nav class="menu primary-menu">

	<!-- Menu button -->

	<div class="menu-toggle"><i class="fa fa-reorder"></i></div>

</nav>

<section id="id-{{meta.slug}}">
  <div class="team section-primary">
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

      <div class="row"
           sup-widget-series
           default="{{[
             {
               'src': theme_url+'/styles/t1.jpg',
               'title': _('Member Name'),
               'caption': _('Click here to edit the member.')
             },
             {
               'src': theme_url+'/styles/t2.jpg',
               'title': _('Member Name'),
               'caption': _('Click here to edit the member.')
             },
             {
               'src': theme_url+'/styles/t3.jpg',
               'title': _('Member Name'),
               'caption': _('Click here to edit the member.')
             }
           ]}}"
           ng-model="meta.series">

        <div class="col-sm-6 col-md-3 team-item"
             ng-repeat="item in meta.series">
          <div series-item>
            <div class="avatar">
              <img class="img-circle img-holder"
                   ng-src="{{g.img_holder}}"
                   style="{{item.src|thumbnail|bg_img}}">
            </div>
            <h4 class="text-nowrap">{{item.title}}</h4>
            <p class="text-clamp-4">{{item.caption}}</p>
          </div>
        </div>

        <div class="col-sm-6 col-md-3 team-item">
          <div series-item-create>
            <div class="avatar">
              <img class="img-circle img-holder"
                   ng-src="{{g.img_holder}}"
                   style="{{g.add_img|bg_img}}" />
            </div>
            <h4 class="text-nowrap">
              {{_('Create New Member')}}
            </h4>
            <p class="text-clamp-4">
              {{_('Click here to add a new Member.')}}
            </p>
          </div>
        </div>

      </div>

  </div>
</section>