{% include 'g.tpl' %}
{% include '_css_.tpl' %}
<!-- Navigation -->
{% include '_nav_.tpl' %}

<!-- Page Header -->
<header class="intro-header home-kv {{meta.hero.class}}"
        style="{{meta.hero.style}}">
  <div sup-widget-bg
       presets="[
         {'key': 'repeat-bg', 'label': _('Repeat')}
       ]"
       ng-model="meta.hero"></div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="site-heading">
          <h1>
            <span sup-widget-text
                  default="{{_('Title')}}"
                  ng-model="meta.title"></span>
          </h1>
          <hr class="small">
          <span class="subheading"
                sup-widget-text
                default="{{_('Description text here')}}"
                ng-model="meta.description"></span>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- Main Content -->
<div class="container">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"
         sup-query='post'
         ng-model="query.posts">
      <!-- Create -->
      <div sup-widget-create type="post">
        <div class="post-preview">
          <a href="#">
            <h2 class="post-title">
              {{_('Create New Post')}}
            </h2>
            <h3 class="post-subtitle">
                {{_('Click here to create a new post')}}
            </h3>
          </a>
          <p class="post-meta">
            {{_("Only published articles will appear here.")}}
          </p>
        </div>
        <hr>
      </div>
      <div ng-repeat="post in query.posts.contents">
        <div class="post-preview"
             sup-widget-open
             file="post">
          <a href="#">
            <h2 class="post-title" sup-bind-html="post.title"></h2>
            <h3 class="post-subtitle">
                {{post.description}}
            </h3>
          </a>
          <p class="post-meta">
            {{_("Posted by")}}
            <a href="#">{{post.author}}</a>
            {{_("on")}}
            {{post.date|date_formatted}}
          </p>
        </div>
        <hr>
      </div>
      <!-- Pager -->
      <ul class="pager">
        <li class="next">
          <a href="#">{{_('Older Posts')}} &rarr;</a>
        </li>
      </ul>
    </div>
  </div>
</div>
<hr>
<!-- Footer -->
{% include '_footer_.tpl' %}