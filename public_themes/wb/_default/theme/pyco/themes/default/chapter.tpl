<sup-set ng-model="g.ver" value="{{theme_meta.version}}"></sup-set><sup-set ng-model="g.default_pic"         value="{{theme_url+'/styles/default.jpg'}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>
<!-- reset css -->
<link ng-href="{{theme_url}}/styles/reset.css?{{g.ver}}"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet" />

<style ng-bind-html="theme_meta.styles"></style>
<div class="outer">
  <div class="masthead">
    <a href="#">
      &rarr; {{_('Cover')}}
    </a>
  </div>
  <header class="header-article container">
    <h1>{{_('Demonstration')}}</h1>
  </header>
  <section class="container">
    <article>
      <header>
        <h3>{{_('This page is for example only')}}</h3>
      </header>
      <p>
        {{_('The real article will be display by chapters ...')}}
      </p>
      <div class="readbox">
        <a class="read"
           href="#">
          {{_('Read')}}
        </a>
      </div>
    </article>
    <hr class="dashed">

    <ul class="paginator">
      <li class="previous">
        <a href="#">
          &larr; {{_('Previous')}}
        </a>
      </li>
      <li class="next">
        <a href="#">
          {{_('Next')}} &rarr;
        </a>
      </li>
    </ul>
  </section>
  <footer class="container">
    <div class="returnbox">
      <a class="return"
         href="#">{{_('Return to Cover')}}</a>
    </div>
  </footer>
</div>