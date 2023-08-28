{% import "g.tpl" %}
{% include '_css_.tpl' %}

<div class="body {{meta.bg.class}}"
     palette="{{g.opts.palette}}"
     style="{{meta.bg.style}}">

  <div sup-widget-bg ng-model="meta.bg"></div>

  {% include '_nav_.tpl' %}
  <section class="wrapper">
    <article class="container paper">
      <figure class="featured-img">
        <div sup-widget-media
             ng-model="meta.featured_img">
          <img class="img-responsive"
               ng-src="{{meta.featured_img.src || g.default_img}}">
        </div>
      </figure>
      <header class="upper">
        <h1>
          <span default="{{_('Title')}}"
                sup-widget-text
                ng-model="meta.title"></span>
        </h1>
      </header>
      <div class="date">
        {{meta.date|date_formatted}}
      </div>
      <hr class="row">
      <!-- content -->
      <div class="content"
           default="{{_('$_CONTENT')}}"
           sup-angular-wysiwyg
           ng-model="content">
      </div>
      <!-- #content -->
      <!-- entries -->
      <div class="attachments"
           sup-widget-series
           ng-model="meta.attachments">
        <div class="row">
          <figure ng-repeat="pic in meta.attachments"
                  ng-if="pic.type == 'image'"
                  class="col-md-2 col-xs-3">
            <div series-item>
              <a href="#"
                 class="img-popup">
                <img class="img-responsive img-holder"
                     ng-src="{{g.img_holder}}"
                     style="{{pic.src|bg_img}}"/>
              </a>
            </div>
          </figure>
          <figure class="col-md-2 col-xs-3">
            <div series-item-create>
              <a href="#"
                 class="img-popup">
                <img class="img-responsive img-holder"
                     ng-src="{{g.img_holder}}"
                     style="{{g.add_img|bg_img}}"/>
              </a>
            </div>
          </figure>
        </div>
      </div>

      <!-- #entries -->

      <!-- paginator -->
      <div class="paginator clearfix">
        <div class="text-left pull-left">
          <div class="ln prev"
               sup-widget-link
               ng-model="meta.prevpage">
            <a href="#">{{_('Previous')}}</a>
          </div>
        </div>
        <div class="text-right pull-right">
          <div class="ln next"
               sup-widget-link
               ng-model="meta.nextpage">
            <a href="#">{{_('Next')}}</a>
          </div>
        </div>
      </div>
      <!-- #paginator -->
      <hr class="row">
    </article>
    {% include '_cr_.tpl' %}
  </section>
  {% include '_sider_.tpl' %}
</div>
