{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="header-content">
    <div class="header-content-inner">
      <h1>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <hr>
      <p>
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
      <a href="#"
         class="btn btn-primary btn-xl"
         sup-widget-button
         ng-model="meta.entrance">
         {{meta.entrance.name || _('Learn More')}}</a>
    </div>
  </div>
</section>

<section class="no-padding no-border"
         sup-query="post"
         ng-model="query.posts">

  <div class="container-fluid">
    <div class="row no-gutter">

      <div class="col-lg-4 col-sm-6"
           ng-repeat="item in query.posts"
           sup-widget-open
           file="post">
        <a href="{{item.url}}"
           class="portfolio-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{'background-image:url('+
                        (item.featured_img.src|thumbnail)+');'}}"
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

<section>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.subject"></span>
        </h2>
        <hr class="primary">
      </div>
    </div>
    <div class="row"
         sup-widget-gallery
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="item in meta.series">
        <div class="service-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{'background-image:url('+
                        (item.src|thumbnail)+');'}}"
               alt="{{item.title}}">
          <h3 class="text-nowrap">
            {{item.title}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{item.caption}}
          </p>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="i in [1,2,3,4]"
           ng-if="meta.series|is_empty">
        <div class="service-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{'background-image:url('+g.default_img+');'}}" >
          <h3 class="text-nowrap">
            {{_('Item Title')}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{_('Click here add series content')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>
