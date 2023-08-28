<section id="{{page.slug}}"
         class="common">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>

    <div id="owl-carosuel"
         class="owl-carousel owl-theme is-block">

      <div class="client">
        <h3>{{page.carousel[0].title}}</h3>
        <img class="thumbnail-img"
             ng-src="{{theme_url}}/styles/trans_cover.png"
             style="{{page.carousel[0].src|bg_img}}">
        <p>{{page.carousel[0].caption}}</p>
      </div>

    </div>
  </div>
</section>
