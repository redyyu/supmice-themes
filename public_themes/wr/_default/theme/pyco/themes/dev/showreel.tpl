<sup-set ng-model="g.ver" value="{{theme_meta.version+'.r1'}}"></sup-set><sup-set ng-model="g.default_img"         value="{{theme_url+'/styles/default_img.jpg'}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set><sup-set ng-model="g.bg_presets"         object="[{key: 'dark-bg', label: _('Dark Background')}]"></sup-set><sup-set ng-model="g.default_carousel"         object="[           {             'title': _('Item Title'),             'src': theme_url+'/styles/default_img.jpg',             'caption': _('Click here add content.')           }         ]"></sup-set>
<!-- reset css -->
<link ng-href="{{theme_url}}/styles/reset.css?{{g.ver}}"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet" />

<link ng-href="{{theme_url}}/styles/editor.css?{{g.ver}}"
      rel="stylesheet" />

<style ng-bind-html="theme_meta.styles"></style>
<div>
  <section id="id-{{meta.slug}}"
           class="section {{meta.hero.preset}} {{meta.hero.class}}"
           style="{{meta.hero.style}}">
    <div sup-widget-bg
         presets="g.bg_presets"
         ng-model="meta.hero"></div>
    <div class="slide">
      <div class="container"
           sup-widget-carousel
           default="{{g.default_carousel}}"
           ng-model="meta.carousel">
        <h2>{{meta.carousel[0].title}}</h2>
        <figure>
          <img ng-src="{{meta.carousel[0].src}}"
               alt="{{meta.carousel[0].title}}" />
        </figure>
        <p>{{meta.carousel[0].caption}}<p>
      </div>
    </div>
  </section>
</div>