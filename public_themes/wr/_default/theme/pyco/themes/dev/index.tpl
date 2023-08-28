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
           class="section {{meta.hero.preset || 'cover'}}
                          {{meta.hero.class}}"
           style="{{meta.hero.style}}">
    <div sup-widget-bg
         presets="[{'key': 'light-bg', 'label': _('Light Background')}]"
         ng-model="meta.hero"></div>
    <div class="container">
      <h1>
        <div sup-widget-text
             default="{{_('Title')}}"
             ng-model="meta.title"></div>
      </h1>
      <h3>
        <div sup-widget-text
             default="{{_('Description text here')}}"
             ng-model="meta.description"></div>
      </h3>
    </div>
  </section>
</div>