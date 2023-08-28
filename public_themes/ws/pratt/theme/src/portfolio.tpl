{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}">
  <div class="section-primary portfolio">
    <div class="container">

      <div class="row centered section-header">
        <div class="col-md-8 col-md-offset-2">
          <h2>
            <span sup-widget-text
                  ng-model="meta.title"
                  default="{{_('Title')}}"></span>
          </h2>
        </div>
      </div>

      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="carousel slide portfolio-gallery"
               sup-widget-carousel
               default="{{[
                 {'src': theme_url+'/styles/works1.png'},
               ]}}"
               ng-model="meta.carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li ng-repeat="i in meta.carousel"
                  ng-class="{'active':$first}"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <div class="item active">
                <img class="contain-img img-holder-cover"
                     ng-src="{{g.img_holder_cover}}"
                     style="{{meta.carousel[0].src|bg_img}}">
              </div>
            </div>

          </div>
        </div>
      </div>

    </div>
  </div>
</section>
