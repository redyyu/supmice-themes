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
    <div class="container">
      <h2>
        <div sup-widget-text
             default="{{_('Title')}}"
             ng-model="meta.title"></div>
      </h2>
      <figure ng-if="meta.featured_img.src">
        <img ng-src="{{meta.featured_img.src}}"
             alt="{{meta.featured_img.title}}" />
      </figure>
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content">
      </div>
    </div>
  </section>
</div>