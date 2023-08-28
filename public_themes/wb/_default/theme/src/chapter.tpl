{% import 'g.tpl' %}
{% include '_css_.tpl' %}
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