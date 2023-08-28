{% include 'g.tpl' %}
{% include '_css_.tpl' %}
<!-- Navigation -->
{% include '_nav_.tpl' %}

<!-- Page Header -->
<header class="intro-header post-kv {{meta.hero.class}}"
        style="{{meta.hero.style}}">
  <div sup-widget-bg
       presets="[
         {'key': 'repeat-bg', 'label': _('Repeat')}
       ]"
       ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="post-heading">
          <h1>
            <span sup-widget-text
                  default="{{_('Title')}}"
                  ng-model="meta.title"></span>
          </h1>
          <h2 class="subheading">
            <span sup-widget-text
                  default="{{_('Description text here')}}"
                  ng-model="meta.description"></span>
          </h2>
          <span class="meta">
            {{_("Posted by")}}
            {{meta.author}}
            {{_("on")}}
            {{meta.date|date_formatted}}
          </span>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- Post Content -->
<article>
  <div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}">
          </div>
        </div>
    </div>
  </div>
</article>
<hr>
<!-- Footer -->
{% include '_footer_.tpl' %}