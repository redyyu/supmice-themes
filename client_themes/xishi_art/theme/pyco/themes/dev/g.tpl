<sup-set ng-model="g.ver"
         value="{{theme_meta.version}}"></sup-set>
<sup-set ng-model="g.opts"
         object="theme_meta.options"></sup-set>

<sup-set ng-model="g.default_logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default_img.png'}}"></sup-set>
<sup-set ng-model="g.default_cover"
         value="{{theme_url+'/styles/default_cover.png'}}"></sup-set>

<sup-set ng-model="g.default_qr"
         value="{{theme_url+'/styles/qr.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         object="{'px': theme_url+'/styles/trans.png',
                  '16x10': theme_url+'/styles/trans_16x10.png',
                  '18x10': theme_url+'/styles/trans_18x10.png',
                  '20x10': theme_url+'/styles/trans_20x10.png',
                  '30x10': theme_url+'/styles/trans_30x10.png'}"></sup-set>