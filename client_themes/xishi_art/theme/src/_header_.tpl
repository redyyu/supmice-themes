<header ng-class="{'free':meta.hero.src}">
  <div sup-widget-media
       ng-model="meta.hero">
    <img ng-src="{{meta.hero.src || site_meta.logo || g.logo}}" />
  </div>
</header>