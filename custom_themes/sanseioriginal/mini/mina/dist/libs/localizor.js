(function(){var Localizor,version;version='1.0.0';if(!Function.prototype.property){Function.prototype.property=function(prop,methods){return Object.defineProperty(this.prototype,prop,methods);};}
Localizor=(function(){class Localizor{constructor(dict_map,opts){var d,i,k,len,ref,self,v;self=this;if(!opts){opts={};}
self.localizedDict={};self.localizedText={};self.locale_code='';self.options={case_sensitive:false};ref=self.options;for(k in ref){v=ref[k];self.options[k]=opts[k]||v;}
if(Array.isArray(dict_map)){for(i=0,len=dict_map.length;i<len;i++){d=dict_map[i];self.load(d.key,d.texts);}}else if(typeof dict_map==='object'&&dict_map){for(k in dict_map){v=dict_map[k];self.load(k,v);}}}
load(loc,tanslates){var self;self=this;if(loc&&Array.isArray(tanslates)){return self.localizedDict[loc.toString()]=tanslates;}}
set(loc){var i,k,key,lang,len,loc_dict,loc_text,locale,self,text,trans_text_list,v;self=this;locale=loc.replace('-','_');lang=loc.split('_')[0];loc_dict=self.localizedDict;for(k in loc_dict){v=loc_dict[k];if(k.toLowerCase()===loc.toLowerCase()){locale=k;break;}}
loc_text={};trans_text_list=loc_dict[lang]||loc_dict[locale]||[];for(i=0,len=trans_text_list.length;i<len;i++){text=trans_text_list[i];if(!text.msgid){continue;}
key=self.options.case_sensitive?text.msgid:text.msgid.toLowerCase();loc_text[key]=text.msgstr;}
self.localizedText=loc_text;return self.locale_code=locale;}
translate(str){var arg,args,i,j,len,len1,ref,self,strkey,trans;self=this;if(!str||typeof str!=='string'){return str;}
strkey=self.options.case_sensitive?str:str.toLowerCase();trans=self.localizedText[strkey]||str;args=[];for(i=0,len=arguments.length;i<len;i++){arg=arguments[i];args.push(arg);}
ref=args.slice(1);for(j=0,len1=ref.length;j<len1;j++){arg=ref[j];if(arg===void 0){arg='';}
trans=trans.replace("%s",arg);}
return trans;}};Localizor.property('version',{get:function(){return version;}});Localizor.property('locale',{get:function(){var self;self=this;return self.locale_code;}});Localizor.property('lang',{get:function(){var self;self=this;return self.locale_code.split('_')[0];}});Localizor.property('_dictionary',{get:function(){var self;self=this;return self.localizedText;}});return Localizor;})();module.exports=Localizor;}).call(this);