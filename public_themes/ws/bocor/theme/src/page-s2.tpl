{% import 'g.tpl' %}
{% include '_css.tpl' %}

<div palette="{{g.opts.palette}}">

  <section id="{{meta.slug}}"
           class="segment">
    <div>

      <div class="container marginbot-50">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="section-heading text-center">
              <h2 class="h-bold">
                <div sup-widget-text
                     default="{{_('Title')}}"
                     ng-model="meta.title"></div>
              </h2>
              <div class="divider-header"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row marginbot-80">
          <div class="col-md-8 col-md-offset-2">
            <div class="row">
              <div class="col-sm-6">
                <div sup-widget-media
                     ng-model="meta.featured_img">
                  <img class="img-responsive center-block"
                       ng-src="{{meta.featured_img.src||g.default_img}}"
                       alt="{{page.featured_img.title}}" />
                </div>
              </div>
              <div class="col-sm-6">
                <div class="content"
                     sup-angular-wysiwyg
                     default="{{_('$_CONTENT')}}"
                     ng-model="content">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

</div>