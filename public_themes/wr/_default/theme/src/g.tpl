<sup-set ng-model="g.ver" value="{{theme_meta.version}}"></sup-set>
<sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.bg_presets"
         object="[
           {key: 'primary-bg', label: _('Primary')},
           {key: 'accent-bg', label: _('Accent')},
           {key: 'light-bg', label: _('Light')},
           {key: 'dark-bg', label: _('Dark')}
         ]"></sup-set>

<sup-set ng-model="g.carousel"
         object="[
           {
             'title': _('Item Title'),
             'src': theme_url+'/styles/pic_1.jpg',
             'caption': _('Click here add content.')
           },
           {
             'title': _('Item Title'),
             'src': theme_url+'/styles/pic_2.jpg',
             'caption': _('Click here add content.')
           }
         ]"></sup-set>