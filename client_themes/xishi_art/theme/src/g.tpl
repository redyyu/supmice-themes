<sup-set ng-model="g.logo"
         value="{{theme_url+'/styles/logo.png'}}"></sup-set>

<sup-set ng-model="g.default_qr"
         value="{{theme_url+'/styles/qr.png'}}"></sup-set>

<sup-set ng-model="g.default_img"
         value="{{theme_url+'/styles/default_img.png'}}"></sup-set>

<sup-set ng-model="g.img_holder"
         object="{'px': theme_url+'/styles/trans.png',
                  '16x10': theme_url+'/styles/trans_16x10.png',
                  '18x10': theme_url+'/styles/trans_18x10.png',
                  '20x10': theme_url+'/styles/trans_20x10.png',
                  '30x10': theme_url+'/styles/trans_30x10.png'}"></sup-set>

<sup-set ng-model="g.content_presets"
         object="[
           {
            'preview': theme_url+'/presets/ps_titlebar.png',
            'code': '<div class=title><h2>'+_('Subtitle')+'</h2><img src='+theme_url+'/styles/bar.jpg /></div>'
           },
           {
            'preview': theme_url+'/presets/ps_figure_hori.png',
            'code': '<table class=figure-hori><tr><td width=30% class=img-box><img src='+theme_url+'/styles/default_img.png /></td><td width=60%><p>'+_('Click on the placeholder image to replace it, and directly edit the text here.')+'</p></td></tr></table>'
           },
           {
            'preview': theme_url+'/presets/ps_figure_vert.png',
            'code': '<table class=figure-vert><tr><td class=img-box><img src='+theme_url+'/styles/default_img.png /></td></tr><tr><td><p>'+_('Click on the placeholder image to replace it, and directly edit the text here.')+'</p></td></tr></table>'
           },
         ]"></sup-set>
