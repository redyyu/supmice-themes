(function(){var t,e;e=require("../../core.js");t=getApp();Page({data:{profile:null,items:null,image:e.image,show_tip:false},swipe_start_point:null,onShareAppMessage:function(){return t.share()},onLoad:function(e){var r;r=this;return t.get_profile(function(t){return r.setData({profile:t,show_tip:!wx.getStorageSync("skip_cart_tip")})})},onShow:function(){var e;e=this;t.cart.refresh();return e.setData({items:t.cart.list()})},onPullDownRefresh:function(){var t;t=this;if(!t.data.items.length&&!t.data.show_tip){t.setData({show_tip:true});wx.removeStorageSync("skip_cart_tip")}return wx.stopPullDownRefresh()},sync_profile:function(){var e;e=this;return t.sync_profile(function(t){return e.setData({profile:t})})},skip_cart_tip:function(){var t;t=this;wx.setStorageSync("skip_cart_tip",true);return t.setData({show_tip:false})},help:function(){return t.goto({route:e.config.paths.help,method:wx.switchTab})},gobuy:function(){return t.goto({route:e.config.paths.index,method:wx.switchTab})},clear:function(){var e;e=this;t.cart.clear();return e.setData({items:[]})},swipe_start:function(t){var e;e=this;try{return e.swipe_start_point=t.changedTouches[0].clientX}catch(t){return e.swipe_start_point=null}},swipe_end:function(e){var r,n,i,a;a=this;if(!a.swipe_start_point){return}i=e.currentTarget.dataset.item;try{n=e.changedTouches[0].clientX}catch(t){n=0}r=a.swipe_start_point-n;if(Math.abs(r)>120){t.cart.remove(i);a.setData({items:t.cart.list()})}return a.swipe_start_point=null},swipe_cancel:function(){var t;t=this;return t.swipe_start_point=null},use:function(e){var r,n;n=this;r=e.currentTarget.dataset.item;if(!r){return}return t.show_coupon({code:r.coupon_code,msg:r.coupon_msg||"..."})}})}).call(this);
