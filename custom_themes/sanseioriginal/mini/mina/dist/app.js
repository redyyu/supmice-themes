var CartStack,Navigation,core,localize,restCustomer,restStore,utils;Navigation=require('libs/navigation.js');CartStack=require('libs/cart.js');utils=require('utils.js');core=require('core.js');localize=require('localize.js');restStore=require('restapi/store.js');restCustomer=require('restapi/customer.js');App({project:{name:'SanseiOriginal Mina',version:'1.0.0',creator:['Redyyu']},show_splash:false,store:null,locale:null,lang:null,nav:new Navigation(),cart:new CartStack(),checkout:new CartStack({infinity:true}),onLaunch:function(opts){var index_path,self;self=this;console.info('Launched...');console.info('-------------------');console.info(self.project.name);console.info(self.project.version);console.info(self.project.creator.join(', '));if(utils.isUndefined(opts.query.debug)){index_path=utils.strip(core.config.paths.index,'/');self.show_splash=Boolean(opts.path===index_path);}
return restStore.store.get().then(function(store){self.store=store;self.locale=store.locale;return self.lang=store.lang;}).catch(function(){return self.locale=core.config.default_locale;}).finally(function(){var i,len,page,ref,results;ref=getCurrentPages();results=[];for(i=0,len=ref.length;i<len;i++){page=ref[i];results.push(page.setData({locale:self.locale}));}
return results;});},onShow:function(opts){var self;self=this;return self.login();},onPageNotFound:function(opts){return app.nav.redirect({route:core.config.paths.error});},set_tabs:function(){var self;self=this;if(self.tabs_interval_id){clearInterval(self.tabs_interval_id);}
return self.tabs_interval_id=setInterval(function(){var i,idx,len,tab,tabs;if(!self.lang){return;}
tabs=localize.tabs(self.lang);for(idx=i=0,len=tabs.length;i<len;idx=++i){tab=tabs[idx];wx.setTabBarItem({index:idx,text:tab});}
return clearInterval(self.tabs_interval_id);},100);},set_navbar:function(title,is_static){var self;self=this;if(self.navbar_interval_id){clearInterval(self.navbar_interval_id);}
return self.navbar_interval_id=setInterval(function(){var default_title,site_meta;if(!self.store){return;}
site_meta=self.store.site_meta||{};default_title=site_meta.title||site_meta.slug;if(is_static){title=localize.title(self.lang,title);}
wx.setNavigationBarTitle({title:title||default_title});return clearInterval(self.navbar_interval_id);},100);},login_status:false,login:function(callback,force){var _login,_loop,interval_id,self;self=this;if(!utils.isFunction(callback)){callback=function(){};}
if(core.session.get('token')&&!force){callback();}else if(self.login_status){_loop=60;return interval_id=setInterval(function(){if(!self.login_status&&core.session.get('token')){clearInterval(interval_id);return callback();}else if(_loop<0){return clearInterval(interval_id);}else{return _loop-=1;}},600);}else{_login=function(callback,retry){retry=!utils.isNumber(retry)?0:retry+1;if(retry>=core.config.retry){wx.redirectTo({url:core.config.paths.error});return;}else if(retry>0){console.info('retry:',retry);}
self.login_status=true;return wx.login({success:function(data){return restCustomer.login({code:data.code}).then(function(auth){self.login_status=false;core.session.set('token',auth.token,auth.expires_in-60);return callback();}).catch(function(error){self.login_status=false;return _login(callback,retry);});},fail:function(){self.login_status=false;return _login(callback,retry);}});};return _login(callback);}},share:function(opts){var e,self,share_opts,site_meta;self=this;if(!opts){try{site_meta=self.store.site_meta;opts={title:site_meta.title||site_meta.slug,src:site_meta.share_img,path:null};}catch(error1){e=error1;opts={};}}
share_opts={title:opts.title,imageUrl:opts.src,path:opts.path};return share_opts;},get_profile:function(callback){var self;self=this;if(!utils.isFunction(callback)){callback=function(){};}
if(self.profile){return callback(profile);}else{return restCustomer.member.get().then(function(profile){self.profile=profile;return callback(profile);});}},set_profile:function(profile,callback){var self;self=this;if(!utils.isFunction(callback)){callback=function(){};}
return restCustomer.member.update({meta:profile}).then(function(profile){self.profile=profile;return callback(profile);});}});