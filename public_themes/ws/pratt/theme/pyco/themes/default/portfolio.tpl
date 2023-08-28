<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.png'}}"></sup-set>

<sup-set ng-model="g.default_hero"
         value="{{theme_url+'/styles/hero.png'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<sup-set ng-model="g.img_holder_cover"
         value="{{theme_url+'/styles/trans_cover.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/libs/bootstrap/css/bootstrap.css"
      rel="stylesheet">
<!-- plugins -->
<link ng-href="{{theme_url}}/libs/magnific-popup/magnific-popup.css"
      rel="stylesheet">

<!-- fonts -->
<link ng-href="{{theme_url}}/fonts/lato/lato.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/fonts/raleway/raleway.css"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/sup.css"
      rel="stylesheet">
<link ng-href="{{theme_url}}/styles/main.css"
      rel="stylesheet">

<!-- custom styles -->
<style sup-bind-html="theme_meta.styles"></style>

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
