{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2>
          <span sup-widget-text
                default="{{_('Title')}}"
                ng-model="meta.title"></span>
        </h2>
        <hr>
        <p>
          <span sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </p>
      </div>
    </div>
  </div>
</section>


<section class="no-padding no-border"
         sup-query="works"
         ng-model="query.works">
  <div class="container-fluid">
    <div class="row no-gutter">
      <div class="col-md-4 col-sm-6"
           sup-widget-create
           type="works"
           sup-ico-inset="top">
        <a href="#"
           class="portfolio-box">
          <img ng-src="{{theme_url}}/styles/trans_16x10.png"
               class="img-responsive"
               style="{{g.add_img|bg_img}}"
               alt="{{item.title}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{_('Create New Works')}}
              </div>
              <div class="project-caption faded">
                {{_('Click here to create a new works')}}
              </div>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-4 col-sm-6"
           ng-repeat="item in query.works.contents"
           sup-widget-open="item"
           sup-ico-inset="top">
        <a href="#"
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

<section class="no-border">
  <div class="container">

    <ul class="pager">

      <li class="previous">
        <a href="#">
         &larr; {{_('Previous')}}
        </a>
      </li>

      <li class="next">
        <a href="#">
          {{_('Next')}} &rarr;
        </a>
      </li>

    </ul>

  </div>
</section>

{% include '_footer.tpl' %}
