{% include 'g.tpl' %}
{% include '_css_.tpl' %}

<!-- Navigation -->
{% include '_nav_.tpl' %}

<!-- Page Header -->
<header class="intro-header error-kv {{meta.hero.class}}"
        style="{{meta.hero.style}}">
  <div sup-widget-bg
       presets="[
         {'key': 'repeat-bg', 'label': _('Repeat')}
       ]"
       ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="page-heading">
          <h1>
            <span sup-widget-text
                  default="{{_('Error 404')}}"
                  ng-model="meta.title"></span>
          </h1>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- Main Content -->
<div class="container">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
      <div class="content text-center"
           sup-angular-wysiwyg
           default="{{_('$_ERROR404')}}"
           ng-model="content">
      </div>
    </div>
  </div>
</div>
<hr>
<!-- Footer -->
{% include '_footer_.tpl' %}
