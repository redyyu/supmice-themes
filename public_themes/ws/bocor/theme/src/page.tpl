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
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div class="content"
                 sup-angular-wysiwyg
                 default="{{_('$_CONTENT')}}"
                 ng-model="content">
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

</div>