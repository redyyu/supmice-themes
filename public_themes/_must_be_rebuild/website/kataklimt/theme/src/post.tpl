{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
  <div id="content">
    <div class="container">
      <div class="row">
        <article class="span8">
          <div class="inner-1">
            <ul class="list-blog">
              <li>
                <h3>
                  <div sup-editor-meta ng-model="meta.title"></div>
                </h3>
                <time datetime="2012-11-09" class="date-1">{{meta.date_formatted}}</time>
                <div class="name-author">by <mark sup-editor-meta ng-model="meta.author"></mark></div>
                <div class="clear"></div>
                <div sup-editor-media ng-model="meta.photo">
                  <img class="thumbnial-img" style="background-image: url('{{meta.photo.src}}')" ng-src="{{theme_url}}/img/bg740.png">
                </div>
                <p>
                  <div sup-editor-meta ng-model="meta.description"></div>
                </p>
              </li>
            </ul>
          </div>
        </article>
      </div>
    </div>
  </div>
</div>
{% include '_footer.tpl' %}
