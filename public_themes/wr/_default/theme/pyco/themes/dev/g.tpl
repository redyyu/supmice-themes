<sup-set ng-model="g.ver" value="{{theme_meta.version+'.r1'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default_img.jpg'}}"></sup-set>
<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.bg_presets"
         object="[{key: 'dark-bg', label: _('Dark Background')}]"></sup-set>

<sup-set ng-model="g.default_carousel"
         object="[
           {
             'title': _('Item Title'),
             'src': theme_url+'/styles/default_img.jpg',
             'caption': _('Click here add content.')
           }
         ]"></sup-set>