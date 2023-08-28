{% import 'g.tpl' %}
{% include '_css.tpl' %}
<sup-body class="wrapper-body"></sup-body>

<header class="fixed-top">
  <nav class="navbar navbar-expand-lg affix">
    <div class="container-fluid">
      <a class="navbar-brand"
         href="#">
        {{site_meta.title}}
      </a>
      <div>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link"
               href="#">
              <svg width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/><path d="M21 11H6.83l3.58-3.59L9 6l-6 6 6 6 1.41-1.41L6.83 13H21z"/></svg>
              <span>{{_('Back to articles')}}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<div class="wrapper">
  <div class="container p-5">
    <div class="row">
      <!-- col article -->
      <div class="col-md-7 mb-5">
        <article>
          <header>
            <h2>
              <span sup-widget-text
                    default="{{_('Title')}}"
                    ng-model="meta.title"></span>
            </h2>
            <h6 class="text-secondary">{{meta.date|date_formatted}}</h6>
          </header>
          <figure sup-widget-media
                  ng-model="meta.featured_img">
            <img ng-src="{{meta.featured_img.src || g.default_img}}" />
          </figure>
          <hr>
          <div class="content"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               text-styles="[
                 {'class': 'text-primary', 'name': _('Primary Text'),
                  'colorize': '#c7a873'},
                 {'class': 'text-secondary', 'name': _('Secondary Text'),
                  'colorize': '#9c7e4a'},
                 {'class': 'text-danger', 'name': _('Danger Text'),
                  'colorize': '#ff4136'}
               ]"
               ng-model="content"></div>
        </article>
      </div>

      <!-- col recent -->
      <div class="col-md-4 ml-auto">
        <h6 class="text-primary">{{_('Recent Articles')}}</h6>
      </div>

    </div>
  </div>
</div>

{% include '_footer.tpl' %}
