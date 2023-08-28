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
        <div class="col-md-12">
          <div class="content textbox text-center"
               sup-angular-wysiwyg
               ng-model="content"
               default="{{_('$_CONTENT')}}">
          </div>
          <div class="imgbox">
            <div sup-widget-media
                 ng-model="meta.featured_img">
              <img ng-src="{{meta.featured_img.src || g.larger_img}}"
                   class="{{meta.featured_img.class}}" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- #Content Block -->