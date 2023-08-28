{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div id="{{meta.slug}}"
         class="carousel slide"
         style="{{meta.hero.style}}"
         sup-widget-carousel="major"
         default="{{[
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-01.jpg'
           },
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-02.jpg'
           },
           {
             'title': _('Carousel Title'),
             'caption': _('Click here to edit carousel content'),
             'src': theme_url+'/styles/photo-03.jpg'
           },
         ]}}"
         ng-model="meta.carousel">

  <ol class="carousel-indicators">
    <li ng-repeat="item in meta.carousel"
        data-target="#{{meta.slug}}"
        data-slide-to="{{loop.index0}}"
        ng-class="{'active': $first}">
    </li>
  </ol>

  <div class="carousel-inner">
    <div ng-repeat="item in meta.carousel"
         class="item {{item.class}}"
         ng-class="{'active': $first}"
         style="{{item.src|bg_img}}">
      <div class="item-inner">
        <h1 class="title">
          <span>{{item.title}}</span>
        </h1>
        <h4 class="caption">
          <span>{{item.caption}}</span>
        </h4>
      </div>
    </div>
  </div>

  <a class="left carousel-control"
     href="#"
     role="button"
     data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"
          aria-hidden="true"></span>
  </a>
  <a class="right carousel-control"
     href="#"
     role="button"
     data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"
          aria-hidden="true"></span>
  </a>

</div>

<section>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <img ng-src="{{site_meta.logo}}"
             ng-if="site_meta.logo">
        <h3>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h3>
        <hr>
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
      </div>
    </div>
  </div>
</section>

<section class="no-padding no-border"
         sup-query="works"
         perpage="6"
         ng-model="query.works">

  <div class="container-fluid">
    <div class="row no-gutter">

      <div class="col-md-4 col-sm-6"
           ng-repeat="item in query.works.contents"
           sup-widget-open
           file="item">
        <a href="{{item.url}}"
           class="portfolio-box">
          <img ng-src="{{theme_url}}/styles/trans_16x10.png"
               class="img-responsive"
               style="{{(item.featured_img.src || g.default_img)
                         |thumbnail|bg_img}}"
               alt="{{item.title}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{item.title}}
              </div>
              <div class="project-caption faded">
                {{item.description}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>

</section>

{% include '_footer.tpl' %}
