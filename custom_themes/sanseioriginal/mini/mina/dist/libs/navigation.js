(function(){var Navigation,version;version='1.0.0';if(!Function.prototype.property){Function.prototype.property=function(prop,methods){return Object.defineProperty(this.prototype,prop,methods);};}
Navigation=(function(){class Navigation{constructor(opts){var self;self=this;if(!opts){opts={};}}
config(opts){var self;self=this;if(!opts){return opts={};}}
_goto(opts){var arg_str,joiner,k,nav_fn,ref,target_url,v;if(opts.route.indexOf('/')===0){target_url=opts.route;}else{target_url='/'+opts.route;}
joiner='?';ref=opts.args;for(k in ref){v=ref[k];if(!k){continue;}
arg_str=v?joiner+k+'='+v:joiner+k;target_url+=arg_str;joiner='&';}
nav_fn=opts.method||wx.navigateTo;return nav_fn({url:target_url});}
go(opts){var self;self=this;return self._goto(opts);}
tab(opts){var self;self=this;opts.method=wx.switchTab;return self._goto(opts);}
redirect(opts){var self;self=this;opts.method=wx.redirectTo;return self._goto(opts);}
back(delta){return wx.navigateBack({delta:delta||1});}
launch(opts){var curr_page,pages,self;self=this;if(!opts){opts={};}
if(!opts.route){pages=getCurrentPages();curr_page=pages[pages.length-1];opts.route=curr_page.route;opts.args=curr_page.options||{};}
opts.method=wx.reLaunch;return self._goto(opts);}};Navigation.property('version',{get:function(){return version;}});return Navigation;})();module.exports=Navigation;}).call(this);