{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div class="wrapper">
  {% include '_header.tpl' %}

  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
        <article>
          <header>
            <h2 class="text-center error-header">
              <span sup-widget-text
                    ng-model="meta.title"
                    default="{{_('Error 404')}}"></span>
            </h2>
          </header>
          <div class="content text-center"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_ERROR404')}}"></div>
        </article>
      </div>
    </div>
  </div>

</div>

{% include '_footer.tpl' %}
