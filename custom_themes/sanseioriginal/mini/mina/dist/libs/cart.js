(function(){var CartStack,now,version;version='1.0.1';if(!Function.prototype.property){Function.prototype.property=function(prop,methods){return Object.defineProperty(this.prototype,prop,methods);};}
now=function(){return parseInt(Date.now()/1000);};CartStack=(function(){class CartStack{constructor(opts){var default_key,self;self=this;if(!opts||typeof opts!=='object'){opts={};}
default_key='CART_STORAGE_STACK';if(opts.infinity){default_key='CART_INFINITY_STORAGE_STACK';opts.expires_in=2e308;}
self.STORAGE_KEY=opts.key||default_key;self.MAX_STORAGE=opts.limit||60;self.ID_KEY=opts.id_key||'id';self.expires_in=opts.expires_in||(3600*24*7);self.refresh();}
config(opts){var self;self=this;if(!opts){opts={};}
if(opts.limit){self.MAX_STORAGE=opts.limit;}
if(opts.expires_in){return self.expires_in=opts.expires_in;}}
_limit(list){var self;self=this;if(list.length>self.MAX_STORAGE){return list.length=self.MAX_STORAGE;}}
sync(list){var i,item,len,self;self=this;if(!Array.isArray(list)){list=[];}
self._limit(list);for(i=0,len=list.length;i<len;i++){item=list[i];item.__added=now();}
return wx.setStorageSync(self.STORAGE_KEY,list);}
refresh(){var cart_list,item,self;self=this;cart_list=(function(){var i,len,ref,results;ref=self.list();results=[];for(i=0,len=ref.length;i<len;i++){item=ref[i];if((now()-item.__added)<self.expires_in){results.push(item);}}
return results;})();return wx.setStorageSync(self.STORAGE_KEY,cart_list);}
list(){var cart_list,self;self=this;cart_list=wx.getStorageSync(self.STORAGE_KEY)||[];self._limit(cart_list);return cart_list;}
len(){var cart_list,self;self=this;cart_list=self.list();return cart_list.length;}
get(item_id){var cart_list,i,item,len,self;self=this;if(!item_id){return null;}
cart_list=self.list();for(i=0,len=cart_list.length;i<len;i++){item=cart_list[i];if(item[self.ID_KEY]===item_id){return item;}}
return null;}
add(item){var cart_list,self;self=this;if(!item||!item[self.ID_KEY]){return;}
cart_list=self.list();item.__added=now();cart_list.unshift(item);self._limit(cart_list);return wx.setStorageSync(self.STORAGE_KEY,cart_list);}
remove(item_or_id){var cart,cart_list,curr_idx,i,idx,item_id,len,self;self=this;if(!item_or_id){return;}
cart_list=self.list();if(typeof item_or_id==='object'&&item_or_id){item_id=item_or_id[self.ID_KEY];}else{item_id=item_or_id;}
curr_idx=null;for(idx=i=0,len=cart_list.length;i<len;idx=++i){cart=cart_list[idx];if(cart[self.ID_KEY]===item_id){curr_idx=idx;}}
if(curr_idx!==null){cart_list.splice(curr_idx,1);}
return wx.setStorageSync(self.STORAGE_KEY,cart_list);}
update(item){var cart,cart_list,i,idx,len,self;self=this;if(!item||!item[self.ID_KEY]){return;}
cart_list=self.list();item.__added=now();for(idx=i=0,len=cart_list.length;i<len;idx=++i){cart=cart_list[idx];if(cart[self.ID_KEY]===item[self.ID_KEY]){cart_list[idx]=item;break;}}
return wx.setStorageSync(self.STORAGE_KEY,cart_list);}
clear(){var self;self=this;return wx.setStorageSync(self.STORAGE_KEY,[]);}};CartStack.property('version',{get:function(){return version;}});CartStack.property('key',{get:function(){var self;self=this;return self.STORAGE_KEY;}});return CartStack;})();module.exports=CartStack;}).call(this);