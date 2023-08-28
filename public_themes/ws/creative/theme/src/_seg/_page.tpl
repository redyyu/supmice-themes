<section id="{{page.slug}}"
         class="segment-wrapper {{page.bg.class}}"
         style="{{page.bg.style}}">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
        <h2 class="section-heading"
            sup-bind-html="page.title">
        </h2>
        <hr class="divider">
        <p class="caption"
           sup-bind-html="page.description"></p>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-bind-html="page.content"></div>
      </div>
    </div>
  </div>
</section>
