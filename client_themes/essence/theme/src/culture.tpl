{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}

<div class="jumbotron {{meta.bg.class}}"
     style="{{meta.bg.style || site_meta.bg.style}}">
  <div sup-widget-bg ng-model="meta.bg"></div>
</div>

<div class="container wrap-box">
  <div class="row">
    <div sup-query="post"
         ng-model="query.post">
      <div class="post-box text-center"
           ng-repeat="p in query.post.contents"
           sup-widget-open="p">
        <h2>{{p.title}}</h2>
        <hr class="post-hr" />
        <p>{{p.description}}</p>
        <img class="thumbnail-img" src="{{p.featured_img.src}}">
        <div class="clearfix">
          <a class="btn-bluegrey pull-right" href="#">{{_('More')}}</a>
        </div>
      </div>

      <div class="post-box text-center"
           sup-widget-create
           type="post">
        <h2>{{_('Create New Post')}}</h2>
        <hr class="post-hr" />
        <p>{{_('Click here to create a new post.')}}</p>
        <img class="thumbnail-img"
             src="{{theme_url}}/img/default_img.png">
        <div class="clearfix">
          <a class="btn-bluegrey pull-right" href="#">{{_('More')}}</a>
        </div>
      </div>
    </div>
  </div>
</div>

{% include '_footer_.tpl' %}
