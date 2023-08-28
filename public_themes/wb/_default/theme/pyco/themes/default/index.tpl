<sup-set ng-model="g.ver" value="{{theme_meta.version}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set><sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>
<!-- reset css -->
<link ng-href="{{theme_url}}/styles/reset.css?{{g.ver}}"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet" />

<style ng-bind-html="theme_meta.styles"></style>
<div class="outer cover">
  <header class="container centered">
    <div sup-widget-media
         ng-model="meta.featured_img">
      <img ng-src="{{meta.featured_img.src || g.default_img}}" />
    </div>
    <h1>
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h1>
    <h3>{{meta.author}}</h3>
    <p class="caption">
      <span sup-widget-text
            default="{{_('Description text here')}}"
            ng-model="meta.description"></span>
    </p>
  </header>
  <hr>
  <section class="container">
    <ol class="chapters">
      <li ng-repeat="term in taxonomy.chapter.terms">
        <a href="#">{{term.meta.name}}</a>
      </li>
    </ol>
  </section>
  <footer class="bottom">
    <p class="cr">
      <span ng-bind-html="site_meta.copyright"></span>
      <span ng-bind-html="site_meta.license"></span>
    </p>
  </footer>
</div>
