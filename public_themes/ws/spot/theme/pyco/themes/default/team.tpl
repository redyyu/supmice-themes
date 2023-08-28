<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>
<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>
<sup-set ng-model="g.img_cover_holder"
         value="{{theme_url+'/styles/trans_cover.png'}}"></sup-set>
<sup-set ng-model="g.default_featured"
         value="{{theme_url+'/styles/default.png'}}"></sup-set>
<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/css/bootstrap.css"
      rel="stylesheet">

<!-- fonts -->
<!-- fonts -->
<link ng-href="{{theme_url}}/fonts/lato/lato.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/sup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>
<!-- Fixed navbar -->
<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button"
              class="navbar-toggle"
              data-toggle="collapse"
              data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"
         ng-href="#">
        {{site_meta.title}}
      </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li ng-repeat="menu in menu.primary"
            class="{{menu|active:meta.path}}">
          <a href="#"
             class="navbar-item {{menu.class}}"
             target="{{menu.target}}">
            {{menu.name}}
          </a>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>
<div class="navbar-placeholder"></div>

<div class="section-header blue-bg">
  <div class="container">
    <div class="row centered">
      <div class="col-md-8 col-md-offset-2">
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

<div class="section-primary light-bg">
  <div class="container">
    <div class="row centered"
         sup-widget-series
         default="{{[
           {
             'title': _('Team Member'),
             'caption': _('Click here to edit the team member.'),
             'src': theme_url+'/styles/t1.jpg'
           },
           {
             'title': _('Team Member'),
             'caption': _('Click here to edit the team member.'),
             'src': theme_url+'/styles/t2.jpg'
           },
           {
             'title': _('Team Member'),
             'caption': _('Click here to edit the team member.'),
             'src': theme_url+'/styles/t3.jpg'
           },
         ]}}"
         ng-model="meta.series">

      <div class="col-sm-6 team-item"
           ng-class="{'col-md-3': meta.series.length > 2,
                      'col-md-4': meta.series.length == 2,
                      'col-md-6': meta.series.length < 2,
                      'col-sm-4': meta.series.length % 2 != 0,
                      'col-sm-6': meta.series.length % 2 == 0}"
           ng-repeat="item in meta.series">
        <div series-item>
          <img class="img-circle avatar-img"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}" />
          <h4 class="text-nowrap">
            {{item.title}}
          </h4>
          <p class="text-clamp-4">
            {{item.caption}}
          </p>
        </div>
      </div>

      <div class="col-sm-6 team-item"
           ng-class="{'col-md-3': meta.series.length > 2,
                      'col-md-4': meta.series.length == 2,
                      'col-md-6': meta.series.length < 2,
                      'col-sm-4': meta.series.length % 2 != 0,
                      'col-sm-6': meta.series.length % 2 == 0}">
        <div series-item-create>
          <img class="img-circle avatar-img"
               ng-src="{{g.img_holder}}"
               style="{{g.add_img|bg_img}}" />
          <h4 class="text-nowrap">
            {{_('Create New Member')}}
          </h4>
          <p class="text-clamp-4">
            {{_('Click here to add a new team member.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</div>

<div class="section-primary">
  <div class="container">
    <div class="row centered">
      <div class="col-md-8 col-md-offset-2 section-header">
        <h3 class="headline">
          <span sup-widget-text
                ng-model="meta.badges_title"
                default="{{_('Title')}}"></span>
        </h3>
      </div>
    </div>
    <div class="row centered"
         sup-widget-series
         default="{{[
           {
             'title': _('Skill Title'),
             'caption': _('Click here to edit the skill.'),
             'src': theme_url+'/styles/s1.png'
           },
           {
             'title': _('Skill Title'),
             'caption': _('Click here to edit the skill.'),
             'src': theme_url+'/styles/s2.png'
           },
           {
             'title': _('Skill Title'),
             'caption': _('Click here to edit the skill.'),
             'src': theme_url+'/styles/s3.png'
           },
         ]}}"
         ng-model="meta.badges">

      <div class="col-sm-6 skill-item"
           ng-class="{'col-md-3': meta.badges.length > 2,
                      'col-md-4': meta.badges.length == 2,
                      'col-md-6': meta.badges.length < 2,
                      'col-sm-4': meta.badges.length % 2 != 0,
                      'col-sm-6': meta.badges.length % 2 == 0}"
           ng-repeat="item in meta.badges">
        <div ng-class="item.class"
             series-item>
          <img class="skill-img"
               ng-src="{{g.img_holder}}"
               style="{{item.src|thumbnail|bg_img}}">
          <h4 class="text-nowrap">
            {{item.title}}
          </h4>
          <p class="text-clamp-4">
            {{item.caption}}
          </p>
        </div>
      </div>

      <div class="col-sm-6 skill-item"
           ng-class="{'col-md-3': meta.badges.length > 2,
                      'col-md-4': meta.badges.length == 2,
                      'col-md-6': meta.badges.length < 2,
                      'col-sm-4': meta.badges.length % 2 != 0,
                      'col-sm-6': meta.badges.length % 2 == 0}">
        <div series-item-create>
          <img class="skill-img"
               ng-src="{{g.img_holder}}"
               style="{{g.add_img|bg_img}}">
          <h4 class="text-nowrap">
            {{_('Create New Skill')}}
          </h4>
          <p class="text-clamp-4">
            {{_('Click here to add a new skill.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</div>

<div class="section-primary red-bg">
  <div class="container">
    <div class="row centered">
      <div class="col-lg-8 col-lg-offset-2">
        <h4>
          <span sup-widget-text
                ng-model="meta.statement"
                default="{{_('We are the only option you have')}}"></span>
        </h4>
      </div>
    </div>
  </div>
</div>

<!-- FOOTER -->
<div class="copyright">
  <div class="container">
  	<div class="row centered">
  		<p>
  			<span sup-bind-html="site_meta.copyright"></span>
  			<span sup-bind-html="site_meta.license"></span>
  		</p>
  	</div><!-- row -->
  </div><!-- container -->
</div><!-- Footer -->
