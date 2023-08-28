{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="ribbon">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
                default="{{_('Error 404')}}"
                ng-model="meta.title"></span>
        </h2>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2 text-center">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_ERROR404')}}"
             ng-model="content"></div>
        <hr>
      </div>
    </div>
  </div>
</section>

{% include '_footer.tpl' %}
