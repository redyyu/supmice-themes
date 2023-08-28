{% include 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}" class="segment"
         sup-query='works'
         perpage='7'
         ng-model="query.works">

  <div class="container">
    <div class="carousel slide portfolio">
      <ol class="carousel-indicators">
        <li class="{{$first ? 'active' : ''}}"
            ng-repeat="x in [1,2,3]"></li>
        <li class="more">
          <a href="#"></a>
        </li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="container">
            <div class="row media-gallery">
              <figure class="col-6 col-lg-3">
                <div sup-widget-create
                     sup-ico-inset="top"
                     type="works">
                  <a href="#">
                    <div class="flip dot">
                      <div class="text-truncate">
                        {{_('Create New Works')}}
                      </div>
                    </div>
                    <img ng-src="{{g.trans}}"
                         style="{{g.add_img|bg_img}}" />
                  </a>
                </div>
              </figure>
              <figure class="col-6 col-lg-3"
                      ng-repeat="item in query.works.contents">
                <div sup-widget-open
                     sup-ico-inset="top"
                     file="item">
                  <a href="#">
                    <div class="flip dot">
                      <div class="text-truncate">
                        {{item.title || item.slug}}
                      </div>
                    </div>
                    <img ng-src="{{g.trans}}"
                         style="{{(item.featured_img.src || g.default_img)
                                   |thumbnail|bg_img}}" />
                  </a>
                </div>
              </figure>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>
