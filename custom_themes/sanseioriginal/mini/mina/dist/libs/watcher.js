(function(){var Watcher,version,indexOf=[].indexOf;version='1.0.0';Watcher=class Watcher{constructor(page,opts){var data_keys,self;self=this;if(!opts){opts={};}
self.watch_data={};if(!page){console.error('Mini Watch: Watch hanlder must attach to a Page object.');return false;}
if(typeof page.watch!=='object'||!page.watch){return false;}
data_keys=Object.keys(page.data);Object.keys(page.watch).map(function(key){var prop;self.watch_data[key]=page.data[key];if(indexOf.call(data_keys,key)<0){return;}
prop={};prop[key]={enumerable:true,configurable:true,set:function(new_val){var old_val;old_val=self.watch_data[key];console.log(old_val);if(new_val!==old_val){setTimeout((function(){page.watch[key].call(page,old_val,new_val);}).bind(this),0);}
self.watch_data[key]=new_val;},get:function(){return self.watch_data[key];}};return Object.defineProperties(page.data,prop);});}};module.exports=Watcher;}).call(this);