<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default.jpg'}}"></sup-set>

<sup-set ng-model="g.add_img"
         value="{{theme_url+'/styles/add.png'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/styles/trans.png'}}"></sup-set>

<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>

<sup-set ng-model="g.perpage"
         value="{{theme_meta.options.perpage || 12}}"></sup-set>
