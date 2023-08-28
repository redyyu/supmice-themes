(function(){var Cart,Stack,_validation,_validator,authorize_run,config,dialog,form_validator,image,interceptor,make_profile,utils;config=require('config.js');utils=require('utils.js');image=require('constant/image.js');Promise.prototype['finally']=function(callback){var constructor;constructor=this.constructor;return this.then((function(value){return constructor.resolve(callback()).then(function(){return value;});}),function(reason){return constructor.resolve(callback()).then(function(){throw reason;});});};interceptor=function(opts){if(!opts.url){opts.url=config.baseURL.api+(opts.path||'');}
opts.before_reject=function(res){var to_url;switch(res.statusCode){case 401:to_url=config.paths.error;wx.removeStorageSync('auth');break;case 403:to_url=config.paths.error;wx.removeStorageSync('auth');break;default:to_url=config.paths.error;}
if(to_url){return wx.redirectTo({url:to_url});}};opts.header=opts.header||{};return opts;};authorize_run=function(opts,callback,fail_callback){if(!opts){opts={};}
if(!utils.isFunction(callback)){callback=function(){};}
if(!utils.isFunction(fail_callback)){fail_callback=function(){};}
return wx.getSetting({success:function(data){if(data.authSetting[opts.scope]){return callback(data);}else if(opts.required){if(data.authSetting[opts.scope]===void 0){return callback(data);}else if(data.authSetting[opts.scope]===false){return wx.openSetting({success:function(op_data){if(op_data.authSetting[opts.scope]){return callback(data);}},fail:function(error){return fail_callback(error);}});}}},fail:function(error){return fail_callback(error);}});};make_profile=function(userinfo){var profile;profile={country:userinfo.country||'',province:userinfo.province||'',city:userinfo.city||'',language:userinfo.language||'zh_CN',name:userinfo.nickName||'',avatar:userinfo.avatarUrl||'',gender:userinfo.gender||0};return profile;};_validator={required:function(value){return /.+/i.test(value.replace(' ',''));}};_validation=function(rules,value){var i,len,rule;if(utils.isString(rules)){rules=[rules];}else if(!utils.isArray(rules)){return null;}
for(i=0,len=rules.length;i<len;i++){rule=rules[i];try{if(_validator[rule]&&!_validator[rule](value)){return false;}}catch(error1){return false;}}
return true;};form_validator={validate:function(from_value,rules){var ffv,k,v;if(!utils.isDict(rules,true)){return;}
ffv={};for(k in from_value){v=from_value[k];ffv[k]=_validation(rules[k],v);}
for(k in ffv){v=ffv[k];if(v===false){ffv.$error=true;}}
return ffv;},setPristine:function(ffv,field_name){var e,k,v;try{delete ffv[field_name];}catch(error1){e=error1;console.error(e);}
for(k in ffv){v=ffv[k];if(v===false){ffv.$error=true;}}
return ffv;}}; dialog={confirm:function(opts){var modal_opts;if(!opts){opts={};}
if(!utils.isFunction(opts.confirm)){opts.confirm=function(){};}
if(!utils.isFunction(opts.cancel)){opts.cancel=function(){};}
modal_opts={title:opts.title||'',content:opts.content||'',success:function(result){if(result.confirm){return opts.confirm();}else{return opts.cancel(result.cancel);}},fail:function(){return opts.cancel(null);}};if(opts.confirmColor){modal_opts.confirmColor=opts.confirmColor;}
if(opts.confirmText){modal_opts.confirmText=opts.confirmText;}
if(opts.cancelColor){modal_opts.cancelColor=opts.cancelColor;}
if(opts.cancelText){modal_opts.cancelText=opts.cancelText;}
return wx.showModal(modal_opts);},alert:function(opts){var modal_opts;if(!opts){opts={};}
if(!utils.isFunction(opts.confirm)){opts.confirm=function(){};}
modal_opts={title:opts.title||'',content:opts.content||'',showCancel:false,success:function(result){if(result.confirm){return opts.confirm();}}};if(opts.confirmColor){modal_opts.confirmColor=opts.confirmColor;}
if(opts.confirmText){modal_opts.confirmText=opts.confirmText;}
return wx.showModal(modal_opts);}};Stack=class Stack{constructor(fields){var field,i,len,self;self=this;self.stack={};for(i=0,len=fields.length;i<len;i++){field=fields[i];self.stack[field]=[];}}
fieldError(){throw new Error('Stack: field does not exist.');}
get(field){var self;self=this;if(!field in self.stack){self.fieldError();}
return self.stack[field];}
len(field){var self;self=this;if(!field in self.stack){self.fieldError();}
return self.stack[field].length;}
push(item,field){var _,ref,results,self;self=this;if(field){if(field in self.stack){return self.stack[field].push(item);}else{return self.fieldError();}}else{ref=self.stack;results=[];for(field in ref){_=ref[field];results.push(self.stack[field].push(item));}
return results;}}
popup(field){var self;self=this;if(!field in self.stack){self.fieldError();}
return self.stack[field].pop();}
clear(field){var _,ref,results,self;self=this;if(field){if(field in self.stack){return self.stack[field].length=0;}else{return self.fieldError();}}else{ref=self.stack;results=[];for(field in ref){_=ref[field];results.push(self.stack[field].length=0);}
return results;}}};Cart=class Cart{constructor(key,list,limit,expires_in){var self;self=this;self.cart_key=key||'_cart_storage';self.cart_limit=limit||600;self.expires_in=expires_in||(3600*24*7*2);if(utils.isArray(list,true)){self.load(list);}}
_limit(list){var self;self=this;if(list.length>self.cart_limit){return list.length=self.cart_limit;}}
load(list){var self;self=this;self._limit(list);return wx.setStorageSync(self.cart_key,list);}
refresh(){var _now,cart_list,item,self;self=this;_now=utils.now();cart_list=self.list();cart_list=(function(){var i,len,results;results=[];for(i=0,len=cart_list.length;i<len;i++){item=cart_list[i];if((_now-item._added)<self.expires_in){results.push(item);}}
return results;})();cart_list=utils.list.deduplicate(cart_list,'id');return wx.setStorageSync(self.cart_key,cart_list);}
list(){var cart_list,self;self=this;cart_list=wx.getStorageSync(self.cart_key)||[];self._limit(cart_list);return cart_list;}
len(){var cart_list,self;self=this;cart_list=self.list();return cart_list.length;}
get(item_id){var cart_list,self;self=this;if(!item_id){return null;}
cart_list=self.list();return utils.list.get(cart_list,{'id':item_id},'id');}
add(item){var cart_list,self;self=this;if(!item){return;}
item._added=utils.now();cart_list=self.list();utils.list.remove(cart_list,item,'id');cart_list.unshift(item);self._limit(cart_list);return wx.setStorageSync(self.cart_key,cart_list);}
remove(item_or_id){var cart_list,item,self;self=this;if(!item_or_id){return;}
cart_list=self.list();item=utils.isDict(item_or_id,true)?item_or_id:{'id':item_or_id};utils.list.remove(cart_list,item,'id');return wx.setStorageSync(self.cart_key,cart_list);}
update(item){var _now,cart_list,idx,self;self=this;_now=utils.now();cart_list=self.list();idx=utils.list.index(cart_list,item,'id');item._added=utils.now();if(idx!==null){cart_list[idx]=item;}
return wx.setStorageSync(self.cart_key,cart_list);}
clear(){var self;self=this;return wx.setStorageSync(self.cart_key,[]);}};module.exports={config:config,image:image,interceptor:interceptor,make_profile:make_profile,authorize_run:authorize_run,form_validator:form_validator,dialog:dialog,Stack:Stack,Cart:Cart};}).call(this);