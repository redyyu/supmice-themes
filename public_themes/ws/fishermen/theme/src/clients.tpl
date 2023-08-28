{% import 'g.tpl' %}
{% include '_css.tpl' %}


<div class="editor-gap-top"></div>
<!-- Content Block -->
<section id="{{meta.slug}}"
         class="content-block {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg
       ng-model="meta.bg"></div>
  <div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <header class="text-center">
            <h2 sup-widget-text
                ng-model="meta.title"
                default="{{_('Title')}}"></h2>
          </header>
        </div>
      </div>
      <div class="row"
           sup-widget-series
           default="{{g.default_clients}}"
           limit="4"
           ng-model="meta.series">

        <div class="item {{item.class}}
             {{$first?(meta.series|col_offset:'col-sm-offset-':4:8):''}}"
             ng-class="{'col-sm-3': meta.series.length >= 3,
                        'col-sm-4': meta.series.length < 3}"
             ng-repeat="item in meta.series">
          <div series-item>
            <a class="client"
               href="#">
              <img ng-src="{{g.img_holder}}"
                   class="img-holder"
                   style="{{item.src|bg_img}}"/>
            </a>
          </div>
        </div>
        <div class="item"
             ng-class="{'col-sm-offset-4': (meta.series|is_empty),
                        'col-sm-3': meta.series.length >= 3,
                        'col-sm-4': meta.series.length < 3}">
          <div series-item-create>
            <a href="#">
              <img ng-src="{{g.img_holder}}"
                   class="img-holder"
                   style="{{g.add_img|bg_img}}">
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- #Content Block -->