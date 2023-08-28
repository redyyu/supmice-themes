{% import 'g.tpl' %}
{% include '_css.tpl' %}

<div class="wrapper">
  {% include '_header.tpl' %}

  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">

        <aside>
          <figure sup-widget-media
                  ng-model="meta.featured_img">
            <img class="{{meta.featured_img.class}}"
                 ng-src="{{meta.featured_img.src||g.default_img}}"/>
          </figure>
        </aside>


        <article>
          <header>
            <h2>
              <span sup-widget-text
                    ng-model="meta.title"
                    default="{{_('Title')}}"></span>
            </h2>
          </header>
          <div class="content"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}"></div>
        </article>

      </div>
    </div>

    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="row img-gallery"
             sup-widget-series
             ng-model="meta.attachments">
          <div class="col-md-3 prd"
               ng-repeat="pic in meta.attachments"
               ng-if="pic.type == 'image'">
            <figure series-item>
              <a href="#"
                 class="img-popup"
                 title="{{pic.title}}">
                <img ng-src="{{g.img_holder}}"
                     class="img-holder"
                     style="{{pic.src|thumbnail|bg_img}}" />
              </a>
            </figure>
          </div>

          <div class="col-md-3 prd">
            <figure series-item-create>
              <a href="#"
                 class="img-popup">
                <img class="img-holder"
                     ng-src="{{g.img_holder}}"
                     style="{{g.add_img|bg_img}}" />
              </a>
            </figure>
          </div>

        </div>
      </div>
    </div>

  </div>

</div>

{% include '_footer.tpl' %}