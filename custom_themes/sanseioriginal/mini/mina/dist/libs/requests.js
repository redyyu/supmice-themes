(function(){var _interceptor,config,request,request_del,request_get,request_post,request_put,requests,version;version='1.0.0';config={common:{interceptor:function(opts){return opts;}}};_interceptor=function(opts,custom_interceptor){var e;try{config.common.interceptor(opts);}catch(error){e=error;console.error(e);}
if(typeof custom_interceptor==='function'){custom_interceptor(opts);}
return opts;};request=function(method,url,opts){var promise;if(!opts){opts={};}
opts.method=method;opts.url=url;opts=_interceptor(opts,opts.interceptor);promise=new Promise(function(resolve,reject){if(opts.show_navbar_loading){wx.showNavigationBarLoading();}
opts.success=function(res){if(res.statusCode>=400){if(typeof opts.after_reject==='function'){opts.after_reject(res);}
return reject(res);}else{if(typeof opts.after_success==='function'){opts.after_success(res);}
return resolve(res.data,res);}};opts.fail=function(res){if(typeof opts.after_reject==='function'){opts.after_reject(res);}
return reject(res);};opts.complete=function(){if(opts.show_navbar_loading){return wx.hideNavigationBarLoading();}};if(typeof opts.before_request==='function'){opts.before_request(opts);}
return wx.request(opts);});return promise;};request_get=function(url,args,opts){if(!opts){opts={};}
opts.data=args;return request('GET',url,opts);};request_put=function(url,data,opts){if(!opts){opts={};}
opts.data=data;return request('PUT',url,opts);};request_post=function(url,data,opts){if(!opts){opts={};}
opts.data=data;return request('POST',url,opts);};request_del=function(url,args,opts){if(!opts){opts={};}
opts.data=args;return request('DELETE',url,opts);};requests={version:version,config:config,request:request,get:request_get,put:request_put,update:request_put,post:request_post,del:request_del,remove:request_del};module.exports=requests;}).call(this);