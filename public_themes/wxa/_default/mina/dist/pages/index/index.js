(function(){var t,e,r,n;e=require("../../core.js");n=require("../../utils.js");r=require("../../restapi/store.js");t=getApp();Page({data:{image:e.image,is_loading:null,has_more:null,commodities:[],promotions:[],cat_groups:[],shortcuts:[],banners:[],cat_group_limit:e.config.category_group_limit||1},paged:1,perpage:12,limit:60,timestamp:n.now(),onShareAppMessage:function(){return t.share()},onLoad:function(t){var e;e=this;return e.refresh()},onPullDownRefresh:function(){var t;t=this;return t.refresh().finally(function(){return wx.stopPullDownRefresh()})},onReachBottom:function(){var t;t=this;if(t.data.has_more===true){t.paged+=1;return t.list()}},refresh:function(){var t;t=this;t.paged=1;t.timestamp=n.now();t.setData({commodities:[],has_more:null});return r.promotion.list().then(function(e){return t.setData({promotions:e})}).then(function(){return r.category.list()}).then(function(e){return t.setData({cat_groups:t._group_categories(e)})}).then(function(){return r.shortcut.list()}).then(function(e){return t.setData({shortcuts:e})}).then(function(){return t.list()})},list:function(){var e;e=this;e.setData({is_loading:true});return r.commodity.list({data:{paged:e.paged,perpage:e.perpage,timestamp:e.timestamp,newest:true}}).then(function(r){var n,o,a;for(n=0,a=r.length;n<a;n++){o=r[n];o.coupon=t.parse_coupon(o.coupon_info)}return e.setData({commodities:e.data.commodities.concat(r),has_more:r[0]&&r[0]._more&&e.paged<e.limit})}).finally(function(){return e.setData({is_loading:false})})},enter_promo:function(e){var r;r=e.currentTarget.dataset.promo;return t.goto({route:"/pages/index/promotion",query:{slug:r.slug}})},enter_category:function(e){var r;r=e.currentTarget.dataset.category;return t.goto({route:"/pages/index/category",query:{slug:r.slug}})},enter_shortcut:function(e){var r,n,o,a,i,u,s,c,g;g=e.currentTarget.dataset.shortcut;u=g.path.split("?");c=u[0];i=(u[1]||"").split("&")||[];s={};for(r=0,o=i.length;r<o;r++){a=i[r];n=a.split("=");if(!n[0]||!n[1]){continue}s[n[0]]=n[1]}return t.goto({route:"/pages/"+c,query:s})},enter:function(e){return t.enter_item(e.currentTarget.dataset.item)},_group_categories:function(t){var r,n,o,a,i,u;i=e.config.category_group_limit||8;n=[];u=[];for(o=0,a=t.length;o<a;o++){r=t[o];n.push(r);if(n.length>=i){u.push(n);n=[]}}if(n.length){u.push(n)}return u}})}).call(this);
