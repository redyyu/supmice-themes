(function(){var Session,now,version;version='1.0.0';if(!Function.prototype.property){Function.prototype.property=function(prop,methods){return Object.defineProperty(this.prototype,prop,methods);};}
now=function(){return parseInt(Date.now()/1000);};Session=(function(){class Session{constructor(opts){var self;self=this;self.options=opts;}
get(key){var _check_item,item;item=wx.getStorageSync(key);_check_item=function(item){if(!item){return false;}
if(item.expires_in&&(now()-item.timestamp)>item.expires_in){return false;}
return true;};if(_check_item(item)){return item.value;}else{wx.removeStorageSync(key);return null;}}
ttl(key){var item;item=wx.getStorageSync(key);if(!item||(now()-item.timestamp)>item.expires_in){wx.removeStorageSync(key);return 0;}else{return item.expires_in-(now()-item.timestamp);}}
set(key,value,expires_in){var _session;_session={value:value,timestamp:now(),expires_in:expires_in||null};wx.setStorageSync(key,_session);return _session;}
pop(key){var self,value;self=this;value=self.get(key);wx.removeStorageSync(key);return value;}
remove(key){return wx.removeStorageSync(key);}
clear(){return wx.clearStorageSync();}};Session.property('version',{get:function(){return version;}});return Session;})();module.exports=Session;}).call(this);