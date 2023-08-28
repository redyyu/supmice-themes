{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="segment-wrapper no-padding no-border">

  <aside class="aside-bar">
    <div class="container text-center">
      <h2 class="section-heading">
        <span default="{{_('Title')}}"
              sup-widget-text
              ng-model="meta.title"></span>
      </h2>
      <hr class="divider">
    </div>
  </aside>

  <div class="container-fluid">
    <div class="row no-gutter"
         sup-widget-series
         default="{{[
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p1.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p2.jpg'
           }
         ]}}"
         ng-model="meta.series">

      <div class="col-lg-4 col-sm-6"
           ng-repeat="item in meta.series">
        <a href="#"
           class="portfolio-box"
           sup-ico-inset="top"
           series-item>
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{item.src|bg_img}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{item.title || '&nbsp;'}}
              </div>
              <div class="project-caption caption">
                {{item.caption || '&nbsp;'}}
              </div>
            </div>
          </div>
        </a>
      </div>

      <div class="col-lg-4 col-sm-6">
        <a href="#"
           class="portfolio-box"
           sup-ico-inset="top"
           series-item-create>
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{g.add_img|bg_img}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{_('Create New Works')}}
              </div>
              <div class="project-caption caption">
                {{_('Click here to add a new works.')}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>
</section>
