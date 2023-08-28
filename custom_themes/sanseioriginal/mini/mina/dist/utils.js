(function(){var _equals,_format_num,_is_object,_strip,dataurl2blob,dict,endswith,format_time,guess_file_ext,guess_file_name,isArray,isDefined,isDict,isFunction,isNumber,isObject,isString,isUndefined,isUrl,list,list2dict,list2str,lstrip,now,pop,price,rstrip,startswith,str2list,strip,url,uuid4,indexOf=[].indexOf;Promise.prototype.finally=function(callback){var constructor;constructor=this.constructor;return this.then((function(value){return constructor.resolve(callback()).then(function(){return value;});}),function(reason){return constructor.resolve(callback()).then(function(){throw reason;});});};_is_object=function(obj){return Boolean(obj!==null&&typeof obj==='object');};_equals=function(obj1,obj2,deep){var _k,j,k,keys,keys1,keys2,l,len,len1,ref;if(typeof deep!=='number'){deep=6;}else{deep=Math.min(deep,60);}
deep-=1;if(obj1&&obj2&&_is_object(obj1)&&_is_object(obj2)&&deep){keys1=Object.keys(obj1);keys2=Object.keys(obj2);if(keys1.length!==keys2.length){return false;}
keys=[];ref=keys1.concat(keys2);for(j=0,len=ref.length;j<len;j++){_k=ref[j];if(indexOf.call(keys,_k)<0){keys.push(_k);}}
for(l=0,len1=keys.length;l<len1;l++){k=keys[l];if(!_equals(obj1[k],obj2[k],deep)){return false;}}}else if(obj1!==obj2){return false;}
return true;};_format_num=function(n){var ref;n=n.toString();return(ref=n[1])!=null?ref:{n:'0'+n};};isObject=function(obj,not_empty){if(!_is_object(obj)){return false;}
return!not_empty||Object.keys(obj).length>0;};isDict=function(obj,not_empty){if(!_is_object(obj)||Array.isArray(obj)){return false;}
return!not_empty||Object.keys(obj).length>0;};isArray=function(obj,not_empty){if(!Array.isArray(obj)){return false;}
return!not_empty||obj.length>0;};isString=function(obj){return typeof obj==='string';};isNumber=function(obj){return typeof obj==='number';};isFunction=function(obj){return typeof obj==='function';};isUndefined=function(obj){return obj===void 0;};isDefined=function(obj){return obj!==void 0;};isUrl=function(url,regex){if(typeof url!=='string'){return false;}
if(regex==='*'){regex=/^[\w]+:[a-zA-Z0-9\/]/i;}else if(!(regex instanceof RegExp)){regex=/^([\w]+:)?\/\/[a-zA-Z0-9]/i;}
return url.match(regex);};format_time=function(date){var day,hour,minute,month,second,time,year;year=date.getFullYear();month=date.getMonth()+1;day=date.getDate();hour=date.getHours();minute=date.getMinutes();second=date.getSeconds();date=[year,month,day].map(_format_num).join('/');time=[hour,minute,second].map(f_format_num).join(':');return date+' '+time;};now=function(){return parseInt(Date.now()/1000);};guess_file_name=function(path){var path_pairs;path_pairs=path.split('/');return path_pairs[path_pairs.length-1]||'';};guess_file_ext=function(str){var e,ext,pair;try{str=str.split('?')[0].split('#')[0];if(str.substr(-1)==='/'){str=str.substr(0,str.length-1);}
pair=str.split('.');if(pair.length>1){ext=pair.pop();return ext.toLowerCase();}
return'';}catch(error){e=error;return'';}}; dict={update:function(obj,obj2){var k,results,v;results=[];for(k in obj2){v=obj2[k];results.push(obj[k]=v);}
return results;}};list={deduplicate:function(list,attr){var _dup,attr_map,item,j,len,new_list;if(!Array.isArray(list)){return[];}
new_list=[];attr_map={};_dup=function(item){if(attr){return item[attr]in attr_map;}else{return indexOf.call(new_list,item)>=0;}};for(j=0,len=list.length;j<len;j++){item=list[j];if(!_dup(item)){if(attr){attr_map[item[attr]]=item;}
new_list.push(item);}}
return new_list;},get:function(list,item,attr){var idx,is_eq,j,len,obj;is_eq=function(obj1,obj2,attr){if(attr){return _equals(obj1[attr],obj2[attr]);}else{return _equals(obj1,obj2);}};for(idx=j=0,len=list.length;j<len;idx=++j){obj=list[idx];if(is_eq(obj,item,attr)){return obj;}}
return null;},popup:function(list,item,attr){var idx,is_eq,j,len,obj,pop_obj;is_eq=function(obj1,obj2,attr){if(attr){return _equals(obj1[attr],obj2[attr]);}else{return _equals(obj1,obj2);}};pop_obj=null;for(idx=j=0,len=list.length;j<len;idx=++j){obj=list[idx];if(is_eq(obj,item,attr)){pop_obj=obj;list.splice(idx,1);break;}}
return pop_obj;},shift:function(list,curr_index,next_index,switching){var _tmp;if(switching===void 0){switching=true;}
if(curr_index<0){curr_index=0;}else if(curr_index>list.length-1){curr_index=list.length-1;}
next_index=Math.max(Math.min(next_index,list.length-1),0);if(next_index!==curr_index){if(switching){list[curr_index]=list.splice(next_index,1,list[curr_index])[0];}else{_tmp=list[curr_index];list.splice(curr_index,1);list.splice(next_index,0,_tmp);}}
return list;},remove:function(list,item,attr){var equals,i,idx,indexes,j,l,len,len1,obj;equals=function(obj1,obj2,attr){if(attr){return _equals(obj1[attr],obj2[attr]);}else{return _equals(obj1,obj2);}};indexes=[];for(idx=j=0,len=list.length;j<len;idx=++j){obj=list[idx];if(equals(obj,item,attr)){indexes.unshift(idx);}}
for(l=0,len1=indexes.length;l<len1;l++){i=indexes[l];list.splice(i,1);}
return list;},index:function(list,item,attr){var equals,idx,j,len,obj;equals=function(obj1,obj2,attr){if(attr){return _equals(obj1[attr],obj2[attr]);}else{return _equals(obj1,obj2);}};for(idx=j=0,len=list.length;j<len;idx=++j){obj=list[idx];if(equals(obj,item,attr)){return idx;}}
return null;}};list2dict=function(list,key,key2){var idx,item,j,len;if(typeof key!=='string'){key=null;}
if(typeof key2!=='string'){key2=null;}
dict={};for(idx=j=0,len=list.length;j<len;idx=++j){item=list[idx];if(!key){key=idx.toString();}
dict[item[key]]=key2?item[key2]:item;}
return dict;};list2str=function(list,separator){var e,str;if(typeof list==='string'){return list;}else if(!Array.isArray(list)){return'';}
if(!separator){separator=', ';}
try{str=list.join(separator);}catch(error){e=error;str='';}
return str;};str2list=function(str,is_set,separator,whitespace){var e,j,len,newlist,orglist,s;if(Array.isArray(str)){return str;}else if(typeof str!=='string'){return[];}
if(!separator){separator=',';str=str.replace(/[，]/g,',');}
try{orglist=str.split(',');}catch(error){e=error;orglist=[];}
newlist=[];for(j=0,len=orglist.length;j<len;j++){s=orglist[j];if(s){if(!whitespace){s=s.trim();}
if(is_set&&indexOf.call(newlist,s)>=0){continue;}
newlist.push(s);}}
return newlist;};startswith=function(str,text){if(typeof str!=='string'||typeof text!=='string'){return null;}
return str.indexOf(text)===0;};endswith=function(str,text){if(typeof str!=='string'||typeof text!=='string'){return null;}
return str.substr(str.length-text.length)===text;};pop=function(obj,key){var value;value=obj[key];delete obj[key];return value;};uuid4=function(dig,hex){var e,limit,output,s4;s4=function(){return Math.floor((1+Math.random())*0x10000).toString(16).substring(1);};if(hex===void 0){hex=true;}
if(hex){output=s4()+s4()+s4()+s4()+s4()+s4()+s4()+s4();}else{output=s4()+s4()+'-'+s4()+'-'+s4()+'-'+s4()+'-'+s4()+s4()+s4();}
try{limit=parseInt(dig);}catch(error){e=error;limit=0;}
if(limit){output=output.substring(0,limit);}
return output;};strip=function(str,text){return _strip(str,text,true,true);};lstrip=function(str,text){return _strip(str,text,true,false);};rstrip=function(str,text){return _strip(str,text,false,true);};_strip=function(str,text,left,right){var regex_left,regex_right;if(typeof str!=='string'){return null;}
if(typeof text!=='string'){text=null;}
if(text===null){text='\\s';}else if(!text){return str;}
if(left){regex_left=new RegExp('^('+text+')*','g');str=str.replace(regex_left,'');}
if(right){regex_right=new RegExp('('+text+')*$','g');str=str.replace(regex_right,'');}
return str;};url={add_params:function(url,params){var _add,item,j,k,len,v;if(!angular.isObject(params)){return url;}
_add=function(url,key,value){var joint;joint=url.indexOf('?')>-1?'&':'?';key=encodeURIComponent(key);value=encodeURIComponent(value);url=url+joint+key+'='+value;return url;};for(k in params){v=params[k];if(angular.isArray(v)){for(j=0,len=v.length;j<len;j++){item=v[j];url=_add(url,k,item);}}else{url=_add(url,k,v);}}
return url;},get_params:function(url,unique){var hash_idx,j,k,len,pair,params,query_idx,query_vars,v;if(typeof url!=='string'){return{};}
if(unique===void 0){unique=true;}
hash_idx=url.indexOf('#');if(hash_idx>-1){url=url.substring(0,hash_idx);}
params={};query_idx=url.indexOf('?');if(query_idx>-1){query_vars=url.split('?')[1].split('&');for(j=0,len=query_vars.length;j<len;j++){v=query_vars[j];pair=v.split('=');k=pair[0];v=pair[1];if(!k){continue;}else if(!params[k]){params[k]=v;}else if(!unique){if(!angular.isArray(params[k])){params[k]=[params[k]];}
params[k].push(v);}}}
return params;}};dataurl2blob=function(dataURL){var BASE64_MARKER,contentType,i,parts,raw,rawLength,uInt8Array;BASE64_MARKER=';base64,';if(dataURL.indexOf(BASE64_MARKER)===-1){parts=dataURL.split(',');contentType=parts[0].split(':')[1];raw=parts[1];return new Blob([raw],{type:contentType});}
parts=dataURL.split(BASE64_MARKER);contentType=parts[0].split(':')[1];raw=window.atob(parts[1]);rawLength=raw.length;uInt8Array=new Uint8Array(rawLength);i=0;while(i<rawLength){uInt8Array[i]=raw.charCodeAt(i);++i;}
return new Blob([uInt8Array],{type:contentType});};price=function(amount,use_currency,symbol,fractionSize){var size;if(symbol===void 0){symbol='';}
size=parseInt(fractionSize)||2;price=(parseInt(amount)/100)||0;if(use_currency){price=price.toFixed(size).replace(/(\d)(?=(\d{3})+\.)/g,'$1,');}else{price=price.toFixed(size);}
return symbol+price;};module.exports={isArray:isArray,isObject:isObject,isDict:isDict,isFunction:isFunction,isNumber:isNumber,isString:isString,isDefined:isDefined,isUndefined:isUndefined,isUrl:isUrl,format_time:format_time,now:now,list:list,list2dict:list2dict,list2str:list2str,str2list:str2list,startswith:startswith,endswith:endswith,equals:_equals,pop:pop,uuid4:uuid4,strip:strip,lstrip:lstrip,rstrip:rstrip,url:url,guess_file_name:guess_file_name,guess_file_ext:guess_file_ext,dataurl2blob:dataurl2blob,price:price};}).call(this);