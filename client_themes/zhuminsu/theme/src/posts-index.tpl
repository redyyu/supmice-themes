{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section class="ribbon {{meta.hero.class}}"
         style="{{meta.hero.style}}"
         sup-widget-bg
         ng-model="meta.hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading">
          <span sup-widget-text
               default="{{_('Title')}}"
               ng-model="meta.title"></span>
        </h2>
        <hr class="light">
        <p>
          <span sup-widget-text
               default="{{_('Description text here')}}"
               ng-model="meta.description"></span>
        </p>
      </div>
    </div>
  </div>
</section>


<section sup-query="post"
         ng-model="query.posts">
  <div class="container posts">

    <div class="row item"
         ng-repeat="post in query.posts">
      <div class="col-md-6">
        <figure>
          <img ng-src="{{post.featured_img.src|thumbnail}}"
               class="img-responsive thumbnail-img" />
        </figure>
      </div>
      <div class="col-md-6">
        <h3>{{post.title}}</h3>
        <p>{{post.description}}</p>
        <p><a href="#">{{_('Read More')}}</a></p>
      </div>
    </div>

    <hr>
  </div>
  <div class="container">

    <ul class="pager">
      <li>
        <a href="#">
         &larr; {{_('Newer Posts')}}
        </a>
      </li>
      <li>
        <a href="#">
          {{_('Older Posts')}} &rarr;
        </a>
      </li>
    </ul>

  </div>
</section>

{% include '_footer.tpl' %}
