<section id="{{page.slug}}"
         class="common">
  <div class="container" segment>
    <header>
      <h2 sup-bind-html="page.title"></h2>
      <p sup-bind-html="page.description"></p>
    </header>
    <article>
      <div class="content"
           sup-bind-html="page.content"></div>
    </article>
  </div>
</section>