(function(factory){"use strict";if(typeof define==='function'&&define.amd){define(['jquery'],factory);}else{factory((typeof(jQuery)!='undefined')?jQuery:window.Zepto);}}
(function($){"use strict";var feature={};feature.fileapi=$("<input type='file'/>").get(0).files!==undefined;feature.formdata=window.FormData!==undefined;var hasProp=!!$.fn.prop;$.fn.attr2=function(){if(!hasProp){return this.attr.apply(this,arguments);}
var val=this.prop.apply(this,arguments);if((val&&val.jquery)||typeof val==='string'){return val;}
return this.attr.apply(this,arguments);};$.fn.ajaxSubmit=function(options){if(!this.length){log('ajaxSubmit: skipping submit process - no element selected');return this;}
var method,action,url,$form=this;if(typeof options=='function'){options={success:options};}
else if(options===undefined){options={};}
method=options.type||this.attr2('method');action=options.url||this.attr2('action');url=(typeof action==='string')?$.trim(action):'';url=url||window.location.href||'';if(url){url=(url.match(/^([^#]+)/)||[])[1];}
options=$.extend(true,{url:url,success:$.ajaxSettings.success,type:method||$.ajaxSettings.type,iframeSrc:/^https/i.test(window.location.href||'')?'javascript:false':'about:blank'},options);var veto={};this.trigger('form-pre-serialize',[this,options,veto]);if(veto.veto){log('ajaxSubmit: submit vetoed via form-pre-serialize trigger');return this;}
if(options.beforeSerialize&&options.beforeSerialize(this,options)===false){log('ajaxSubmit: submit aborted via beforeSerialize callback');return this;}
var traditional=options.traditional;if(traditional===undefined){traditional=$.ajaxSettings.traditional;}
var elements=[];var qx,a=this.formToArray(options.semantic,elements);if(options.data){options.extraData=options.data;qx=$.param(options.data,traditional);}
if(options.beforeSubmit&&options.beforeSubmit(a,this,options)===false){log('ajaxSubmit: submit aborted via beforeSubmit callback');return this;}
this.trigger('form-submit-validate',[a,this,options,veto]);if(veto.veto){log('ajaxSubmit: submit vetoed via form-submit-validate trigger');return this;}
var q=$.param(a,traditional);if(qx){q=(q?(q+'&'+qx):qx);}
if(options.type.toUpperCase()=='GET'){options.url+=(options.url.indexOf('?')>=0?'&':'?')+q;options.data=null;}
else{options.data=q;}
var callbacks=[];if(options.resetForm){callbacks.push(function(){$form.resetForm();});}
if(options.clearForm){callbacks.push(function(){$form.clearForm(options.includeHidden);});}
if(!options.dataType&&options.target){var oldSuccess=options.success||function(){};callbacks.push(function(data){var fn=options.replaceTarget?'replaceWith':'html';$(options.target)[fn](data).each(oldSuccess,arguments);});}
else if(options.success){callbacks.push(options.success);}
options.success=function(data,status,xhr){var context=options.context||this;for(var i=0,max=callbacks.length;i<max;i++){callbacks[i].apply(context,[data,status,xhr||$form,$form]);}};if(options.error){var oldError=options.error;options.error=function(xhr,status,error){var context=options.context||this;oldError.apply(context,[xhr,status,error,$form]);};}
if(options.complete){var oldComplete=options.complete;options.complete=function(xhr,status){var context=options.context||this;oldComplete.apply(context,[xhr,status,$form]);};}
var fileInputs=$('input[type=file]:enabled',this).filter(function(){return $(this).val()!=='';});var hasFileInputs=fileInputs.length>0;var mp='multipart/form-data';var multipart=($form.attr('enctype')==mp||$form.attr('encoding')==mp);var fileAPI=feature.fileapi&&feature.formdata;log("fileAPI :"+fileAPI);var shouldUseFrame=(hasFileInputs||multipart)&&!fileAPI;var jqxhr;if(options.iframe!==false&&(options.iframe||shouldUseFrame)){if(options.closeKeepAlive){$.get(options.closeKeepAlive,function(){jqxhr=fileUploadIframe(a);});}
else{jqxhr=fileUploadIframe(a);}}
else if((hasFileInputs||multipart)&&fileAPI){jqxhr=fileUploadXhr(a);}
else{jqxhr=$.ajax(options);}
$form.removeData('jqxhr').data('jqxhr',jqxhr);for(var k=0;k<elements.length;k++){elements[k]=null;}
this.trigger('form-submit-notify',[this,options]);return this;function deepSerialize(extraData){var serialized=$.param(extraData,options.traditional).split('&');var len=serialized.length;var result=[];var i,part;for(i=0;i<len;i++){serialized[i]=serialized[i].replace(/\+/g,' ');part=serialized[i].split('=');result.push([decodeURIComponent(part[0]),decodeURIComponent(part[1])]);}
return result;}
function fileUploadXhr(a){var formdata=new FormData();for(var i=0;i<a.length;i++){formdata.append(a[i].name,a[i].value);}
if(options.extraData){var serializedData=deepSerialize(options.extraData);for(i=0;i<serializedData.length;i++){if(serializedData[i]){formdata.append(serializedData[i][0],serializedData[i][1]);}}}
options.data=null;var s=$.extend(true,{},$.ajaxSettings,options,{contentType:false,processData:false,cache:false,type:method||'POST'});if(options.uploadProgress){s.xhr=function(){var xhr=$.ajaxSettings.xhr();if(xhr.upload){xhr.upload.addEventListener('progress',function(event){var percent=0;var position=event.loaded||event.position;var total=event.total;if(event.lengthComputable){percent=Math.ceil(position/total*100);}
options.uploadProgress(event,position,total,percent);},false);}
return xhr;};}
s.data=null;var beforeSend=s.beforeSend;s.beforeSend=function(xhr,o){if(options.formData){o.data=options.formData;}
else{o.data=formdata;}
if(beforeSend){beforeSend.call(this,xhr,o);}};return $.ajax(s);}
function fileUploadIframe(a){var form=$form[0],el,i,s,g,id,$io,io,xhr,sub,n,timedOut,timeoutHandle;var deferred=$.Deferred();deferred.abort=function(status){xhr.abort(status);};if(a){for(i=0;i<elements.length;i++){el=$(elements[i]);if(hasProp){el.prop('disabled',false);}
else{el.removeAttr('disabled');}}}
s=$.extend(true,{},$.ajaxSettings,options);s.context=s.context||s;id='jqFormIO'+(new Date().getTime());if(s.iframeTarget){$io=$(s.iframeTarget);n=$io.attr2('name');if(!n){$io.attr2('name',id);}
else{id=n;}}
else{$io=$('<iframe name="'+id+'" src="'+s.iframeSrc+'" />');$io.css({position:'absolute',top:'-1000px',left:'-1000px'});}
io=$io[0];xhr={aborted:0,responseText:null,responseXML:null,status:0,statusText:'n/a',getAllResponseHeaders:function(){},getResponseHeader:function(){},setRequestHeader:function(){},abort:function(status){var e=(status==='timeout'?'timeout':'aborted');log('aborting upload... '+e);this.aborted=1;try{if(io.contentWindow.document.execCommand){io.contentWindow.document.execCommand('Stop');}}
catch(ignore){}
$io.attr('src',s.iframeSrc);xhr.error=e;if(s.error){s.error.call(s.context,xhr,e,status);}
if(g){$.event.trigger("ajaxError",[xhr,s,e]);}
if(s.complete){s.complete.call(s.context,xhr,e);}}};g=s.global;if(g&&0===$.active++){$.event.trigger("ajaxStart");}
if(g){$.event.trigger("ajaxSend",[xhr,s]);}
if(s.beforeSend&&s.beforeSend.call(s.context,xhr,s)===false){if(s.global){$.active--;}
deferred.reject();return deferred;}
if(xhr.aborted){deferred.reject();return deferred;}
sub=form.clk;if(sub){n=sub.name;if(n&&!sub.disabled){s.extraData=s.extraData||{};s.extraData[n]=sub.value;if(sub.type=="image"){s.extraData[n+'.x']=form.clk_x;s.extraData[n+'.y']=form.clk_y;}}}
var CLIENT_TIMEOUT_ABORT=1;var SERVER_ABORT=2;function getDoc(frame){var doc=null;try{if(frame.contentWindow){doc=frame.contentWindow.document;}}catch(err){log('cannot get iframe.contentWindow document: '+err);}
if(doc){return doc;}
try{doc=frame.contentDocument?frame.contentDocument:frame.document;}catch(err){log('cannot get iframe.contentDocument: '+err);doc=frame.document;}
return doc;}
var csrf_token=$('meta[name=csrf-token]').attr('content');var csrf_param=$('meta[name=csrf-param]').attr('content');if(csrf_param&&csrf_token){s.extraData=s.extraData||{};s.extraData[csrf_param]=csrf_token;}
function doSubmit(){var t=$form.attr2('target'),a=$form.attr2('action'),mp='multipart/form-data',et=$form.attr('enctype')||$form.attr('encoding')||mp;form.setAttribute('target',id);if(!method||/post/i.test(method)){form.setAttribute('method','POST');}
if(a!=s.url){form.setAttribute('action',s.url);}
if(!s.skipEncodingOverride&&(!method||/post/i.test(method))){$form.attr({encoding:'multipart/form-data',enctype:'multipart/form-data'});}
if(s.timeout){timeoutHandle=setTimeout(function(){timedOut=true;cb(CLIENT_TIMEOUT_ABORT);},s.timeout);}
function checkState(){try{var state=getDoc(io).readyState;log('state = '+state);if(state&&state.toLowerCase()=='uninitialized'){setTimeout(checkState,50);}}
catch(e){log('Server abort: ',e,' (',e.name,')');cb(SERVER_ABORT);if(timeoutHandle){clearTimeout(timeoutHandle);}
timeoutHandle=undefined;}}
var extraInputs=[];try{if(s.extraData){for(var n in s.extraData){if(s.extraData.hasOwnProperty(n)){if($.isPlainObject(s.extraData[n])&&s.extraData[n].hasOwnProperty('name')&&s.extraData[n].hasOwnProperty('value')){extraInputs.push($('<input type="hidden" name="'+s.extraData[n].name+'">').val(s.extraData[n].value).appendTo(form)[0]);}else{extraInputs.push($('<input type="hidden" name="'+n+'">').val(s.extraData[n]).appendTo(form)[0]);}}}}
if(!s.iframeTarget){$io.appendTo('body');}
if(io.attachEvent){io.attachEvent('onload',cb);}
else{io.addEventListener('load',cb,false);}
setTimeout(checkState,15);try{form.submit();}catch(err){var submitFn=document.createElement('form').submit;submitFn.apply(form);}}
finally{form.setAttribute('action',a);form.setAttribute('enctype',et);if(t){form.setAttribute('target',t);}else{$form.removeAttr('target');}
$(extraInputs).remove();}}
if(s.forceSync){doSubmit();}
else{setTimeout(doSubmit,10);}
var data,doc,domCheckCount=50,callbackProcessed;function cb(e){if(xhr.aborted||callbackProcessed){return;}
doc=getDoc(io);if(!doc){log('cannot access response document');e=SERVER_ABORT;}
if(e===CLIENT_TIMEOUT_ABORT&&xhr){xhr.abort('timeout');deferred.reject(xhr,'timeout');return;}
else if(e==SERVER_ABORT&&xhr){xhr.abort('server abort');deferred.reject(xhr,'error','server abort');return;}
if(!doc||doc.location.href==s.iframeSrc){if(!timedOut){return;}}
if(io.detachEvent){io.detachEvent('onload',cb);}
else{io.removeEventListener('load',cb,false);}
var status='success',errMsg;try{if(timedOut){throw'timeout';}
var isXml=s.dataType=='xml'||doc.XMLDocument||$.isXMLDoc(doc);log('isXml='+isXml);if(!isXml&&window.opera&&(doc.body===null||!doc.body.innerHTML)){if(--domCheckCount){log('requeing onLoad callback, DOM not available');setTimeout(cb,250);return;}}
var docRoot=doc.body?doc.body:doc.documentElement;xhr.responseText=docRoot?docRoot.innerHTML:null;xhr.responseXML=doc.XMLDocument?doc.XMLDocument:doc;if(isXml){s.dataType='xml';}
xhr.getResponseHeader=function(header){var headers={'content-type':s.dataType};return headers[header.toLowerCase()];};if(docRoot){xhr.status=Number(docRoot.getAttribute('status'))||xhr.status;xhr.statusText=docRoot.getAttribute('statusText')||xhr.statusText;}
var dt=(s.dataType||'').toLowerCase();var scr=/(json|script|text)/.test(dt);if(scr||s.textarea){var ta=doc.getElementsByTagName('textarea')[0];if(ta){xhr.responseText=ta.value;xhr.status=Number(ta.getAttribute('status'))||xhr.status;xhr.statusText=ta.getAttribute('statusText')||xhr.statusText;}
else if(scr){var pre=doc.getElementsByTagName('pre')[0];var b=doc.getElementsByTagName('body')[0];if(pre){xhr.responseText=pre.textContent?pre.textContent:pre.innerText;}
else if(b){xhr.responseText=b.textContent?b.textContent:b.innerText;}}}
else if(dt=='xml'&&!xhr.responseXML&&xhr.responseText){xhr.responseXML=toXml(xhr.responseText);}
try{data=httpData(xhr,dt,s);}
catch(err){status='parsererror';xhr.error=errMsg=(err||status);}}
catch(err){log('error caught: ',err);status='error';xhr.error=errMsg=(err||status);}
if(xhr.aborted){log('upload aborted');status=null;}
if(xhr.status){status=(xhr.status>=200&&xhr.status<300||xhr.status===304)?'success':'error';}
if(status==='success'){if(s.success){s.success.call(s.context,data,'success',xhr);}
deferred.resolve(xhr.responseText,'success',xhr);if(g){$.event.trigger("ajaxSuccess",[xhr,s]);}}
else if(status){if(errMsg===undefined){errMsg=xhr.statusText;}
if(s.error){s.error.call(s.context,xhr,status,errMsg);}
deferred.reject(xhr,'error',errMsg);if(g){$.event.trigger("ajaxError",[xhr,s,errMsg]);}}
if(g){$.event.trigger("ajaxComplete",[xhr,s]);}
if(g&&!--$.active){$.event.trigger("ajaxStop");}
if(s.complete){s.complete.call(s.context,xhr,status);}
callbackProcessed=true;if(s.timeout){clearTimeout(timeoutHandle);}
setTimeout(function(){if(!s.iframeTarget){$io.remove();}
else{$io.attr('src',s.iframeSrc);}
xhr.responseXML=null;},100);}
var toXml=$.parseXML||function(s,doc){if(window.ActiveXObject){doc=new ActiveXObject('Microsoft.XMLDOM');doc.async='false';doc.loadXML(s);}
else{doc=(new DOMParser()).parseFromString(s,'text/xml');}
return(doc&&doc.documentElement&&doc.documentElement.nodeName!='parsererror')?doc:null;};var parseJSON=$.parseJSON||function(s){return window['eval']('('+s+')');};var httpData=function(xhr,type,s){var ct=xhr.getResponseHeader('content-type')||'',xml=type==='xml'||!type&&ct.indexOf('xml')>=0,data=xml?xhr.responseXML:xhr.responseText;if(xml&&data.documentElement.nodeName==='parsererror'){if($.error){$.error('parsererror');}}
if(s&&s.dataFilter){data=s.dataFilter(data,type);}
if(typeof data==='string'){if(type==='json'||!type&&ct.indexOf('json')>=0){data=parseJSON(data);}else if(type==="script"||!type&&ct.indexOf("javascript")>=0){$.globalEval(data);}}
return data;};return deferred;}};$.fn.ajaxForm=function(options){options=options||{};options.delegation=options.delegation&&$.isFunction($.fn.on);if(!options.delegation&&this.length===0){var o={s:this.selector,c:this.context};if(!$.isReady&&o.s){log('DOM not ready, queuing ajaxForm');$(function(){$(o.s,o.c).ajaxForm(options);});return this;}
log('terminating; zero elements found by selector'+($.isReady?'':' (DOM not ready)'));return this;}
if(options.delegation){$(document).off('submit.form-plugin',this.selector,doAjaxSubmit).off('click.form-plugin',this.selector,captureSubmittingElement).on('submit.form-plugin',this.selector,options,doAjaxSubmit).on('click.form-plugin',this.selector,options,captureSubmittingElement);return this;}
return this.ajaxFormUnbind().bind('submit.form-plugin',options,doAjaxSubmit).bind('click.form-plugin',options,captureSubmittingElement);};function doAjaxSubmit(e){var options=e.data;if(!e.isDefaultPrevented()){e.preventDefault();$(e.target).ajaxSubmit(options);}}
function captureSubmittingElement(e){var target=e.target;var $el=$(target);if(!($el.is("[type=submit],[type=image]"))){var t=$el.closest('[type=submit]');if(t.length===0){return;}
target=t[0];}
var form=this;form.clk=target;if(target.type=='image'){if(e.offsetX!==undefined){form.clk_x=e.offsetX;form.clk_y=e.offsetY;}else if(typeof $.fn.offset=='function'){var offset=$el.offset();form.clk_x=e.pageX-offset.left;form.clk_y=e.pageY-offset.top;}else{form.clk_x=e.pageX-target.offsetLeft;form.clk_y=e.pageY-target.offsetTop;}}
setTimeout(function(){form.clk=form.clk_x=form.clk_y=null;},100);}
$.fn.ajaxFormUnbind=function(){return this.unbind('submit.form-plugin click.form-plugin');};$.fn.formToArray=function(semantic,elements){var a=[];if(this.length===0){return a;}
var form=this[0];var formId=this.attr('id');var els=semantic?form.getElementsByTagName('*'):form.elements;var els2;if(els&&!/MSIE [678]/.test(navigator.userAgent)){els=$(els).get();}
if(formId){els2=$(':input[form='+formId+']').get();if(els2.length){els=(els||[]).concat(els2);}}
if(!els||!els.length){return a;}
var i,j,n,v,el,max,jmax;for(i=0,max=els.length;i<max;i++){el=els[i];n=el.name;if(!n||el.disabled){continue;}
if(semantic&&form.clk&&el.type=="image"){if(form.clk==el){a.push({name:n,value:$(el).val(),type:el.type});a.push({name:n+'.x',value:form.clk_x},{name:n+'.y',value:form.clk_y});}
continue;}
v=$.fieldValue(el,true);if(v&&v.constructor==Array){if(elements){elements.push(el);}
for(j=0,jmax=v.length;j<jmax;j++){a.push({name:n,value:v[j]});}}
else if(feature.fileapi&&el.type=='file'){if(elements){elements.push(el);}
var files=el.files;if(files.length){for(j=0;j<files.length;j++){a.push({name:n,value:files[j],type:el.type});}}
else{a.push({name:n,value:'',type:el.type});}}
else if(v!==null&&typeof v!='undefined'){if(elements){elements.push(el);}
a.push({name:n,value:v,type:el.type,required:el.required});}}
if(!semantic&&form.clk){var $input=$(form.clk),input=$input[0];n=input.name;if(n&&!input.disabled&&input.type=='image'){a.push({name:n,value:$input.val()});a.push({name:n+'.x',value:form.clk_x},{name:n+'.y',value:form.clk_y});}}
return a;};$.fn.formSerialize=function(semantic){return $.param(this.formToArray(semantic));};$.fn.fieldSerialize=function(successful){var a=[];this.each(function(){var n=this.name;if(!n){return;}
var v=$.fieldValue(this,successful);if(v&&v.constructor==Array){for(var i=0,max=v.length;i<max;i++){a.push({name:n,value:v[i]});}}
else if(v!==null&&typeof v!='undefined'){a.push({name:this.name,value:v});}});return $.param(a);};$.fn.fieldValue=function(successful){for(var val=[],i=0,max=this.length;i<max;i++){var el=this[i];var v=$.fieldValue(el,successful);if(v===null||typeof v=='undefined'||(v.constructor==Array&&!v.length)){continue;}
if(v.constructor==Array){$.merge(val,v);}
else{val.push(v);}}
return val;};$.fieldValue=function(el,successful){var n=el.name,t=el.type,tag=el.tagName.toLowerCase();if(successful===undefined){successful=true;}
if(successful&&(!n||el.disabled||t=='reset'||t=='button'||(t=='checkbox'||t=='radio')&&!el.checked||(t=='submit'||t=='image')&&el.form&&el.form.clk!=el||tag=='select'&&el.selectedIndex==-1)){return null;}
if(tag=='select'){var index=el.selectedIndex;if(index<0){return null;}
var a=[],ops=el.options;var one=(t=='select-one');var max=(one?index+1:ops.length);for(var i=(one?index:0);i<max;i++){var op=ops[i];if(op.selected){var v=op.value;if(!v){v=(op.attributes&&op.attributes.value&&!(op.attributes.value.specified))?op.text:op.value;}
if(one){return v;}
a.push(v);}}
return a;}
return $(el).val();};$.fn.clearForm=function(includeHidden){return this.each(function(){$('input,select,textarea',this).clearFields(includeHidden);});};$.fn.clearFields=$.fn.clearInputs=function(includeHidden){var re=/^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i;return this.each(function(){var t=this.type,tag=this.tagName.toLowerCase();if(re.test(t)||tag=='textarea'){this.value='';}
else if(t=='checkbox'||t=='radio'){this.checked=false;}
else if(tag=='select'){this.selectedIndex=-1;}
else if(t=="file"){if(/MSIE/.test(navigator.userAgent)){$(this).replaceWith($(this).clone(true));}else{$(this).val('');}}
else if(includeHidden){if((includeHidden===true&&/hidden/.test(t))||(typeof includeHidden=='string'&&$(this).is(includeHidden))){this.value='';}}});};$.fn.resetForm=function(){return this.each(function(){if(typeof this.reset=='function'||(typeof this.reset=='object'&&!this.reset.nodeType)){this.reset();}});};$.fn.enable=function(b){if(b===undefined){b=true;}
return this.each(function(){this.disabled=!b;});};$.fn.selected=function(select){if(select===undefined){select=true;}
return this.each(function(){var t=this.type;if(t=='checkbox'||t=='radio'){this.checked=select;}
else if(this.tagName.toLowerCase()=='option'){var $sel=$(this).parent('select');if(select&&$sel[0]&&$sel[0].type=='select-one'){$sel.find('option').selected(false);}
this.selected=select;}});};$.fn.ajaxSubmit.debug=false;function log(){if(!$.fn.ajaxSubmit.debug){return;}
var msg='[jquery.form] '+Array.prototype.join.call(arguments,'');if(window.console&&window.console.log){window.console.log(msg);}
else if(window.opera&&window.opera.postError){window.opera.postError(msg);}}}));$(document).ready(function(){var values={};function getUrlVars()
{var vars=[],hash;var hashes=window.location.href.slice(window.location.href.indexOf('?')+1).split('&');for(var i=0;i<hashes.length;i++)
{hash=hashes[i].split('=');vars.push(hash[0]);vars[hash[0]]=hash[1];}
return vars;}
get_vars=getUrlVars()
function onSuccess(data)
{if(data='ok')
{$('#request_form').toggle();}}
$('#call_submit_form').submit(function(e){e.preventDefault();if('product'in get_vars)
{values['product']=get_vars['product']}
var $inputs=$('#call_submit_form :input');$inputs.each(function(){values[this.name]=$(this).val();});if(values['number'].length<10)
{$('#error_field').html('<span style="color: red;">номер слишком короткий</span>')}
else
$.post("/call_req/",values,onSuccess);})});(function(c){c.address=function(){var s=function(a){a=c.extend(c.Event(a),function(){for(var b={},f=c.address.parameterNames(),m=0,p=f.length;m<p;m++)b[f[m]]=c.address.parameter(f[m]);return{value:c.address.value(),path:c.address.path(),pathNames:c.address.pathNames(),parameterNames:f,parameters:b,queryString:c.address.queryString()}}.call(c.address));c(c.address).trigger(a);return a},g=function(a){return Array.prototype.slice.call(a)},k=function(){c().bind.apply(c(c.address),Array.prototype.slice.call(arguments));return c.address},da=function(){c().unbind.apply(c(c.address),Array.prototype.slice.call(arguments));return c.address},G=function(){return A.pushState&&d.state!==h},T=function(){return("/"+n.pathname.replace(new RegExp(d.state),"")+n.search+(H()?"#"+H():"")).replace(S,"/")},H=function(){var a=n.href.indexOf("#");return a!=-1?n.href.substr(a+1):""},q=function(){return G()?T():H()},U=function(){return"javascript"},M=function(a){a=a.toString();return(d.strict&&a.substr(0,1)!="/"?"/":"")+a},t=function(a,b){return parseInt(a.css(b),10)},C=function(){if(!I){var a=q();if(decodeURI(e)!=decodeURI(a))if(v&&x<7)n.reload();else{v&&!J&&d.history&&u(N,50);e=a;B(o)}}},B=function(a){u(ea,10);return s(V).isDefaultPrevented()||s(a?W:X).isDefaultPrevented()},ea=function(){if(d.tracker!=="null"&&d.tracker!==D){var a=c.isFunction(d.tracker)?d.tracker:i[d.tracker],b=(n.pathname+n.search+(c.address&&!G()?c.address.value():"")).replace(/\/\//,"/").replace(/^\/$/,"");if(c.isFunction(a))a(b);else if(c.isFunction(i.urchinTracker))i.urchinTracker(b);else if(i.pageTracker!==h&&c.isFunction(i.pageTracker._trackPageview))i.pageTracker._trackPageview(b);else i._gaq!==h&&c.isFunction(i._gaq.push)&&i._gaq.push(["_trackPageview",decodeURI(b)])}},N=function(){var a=U()+":"+o+";document.open();document.writeln('<html><head><title>"+l.title.replace(/\'/g,"\\'")+"</title><script>var "+y+' = "'+encodeURIComponent(q()).replace(/\'/g,"\\'")+(l.domain!=n.hostname?'";document.domain="'+l.domain:"")+"\";<\/script></head></html>');document.close();";if(x<7)j.src=a;else j.contentWindow.location.replace(a)},Z=function(){if(E&&Y!=-1){var a,b,f=E.substr(Y+1).split("&");for(a=0;a<f.length;a++){b=f[a].split("=");if(/^(autoUpdate|history|strict|wrap)$/.test(b[0]))d[b[0]]=isNaN(b[1])?/^(true|yes)$/i.test(b[1]):parseInt(b[1],10)!==0;if(/^(state|tracker)$/.test(b[0]))d[b[0]]=b[1]}E=D}e=q()},aa=function(){if(!$){$=r;Z();c('a[rel*="address:"]').address();if(d.wrap){var a=c("body");c("body > *").wrapAll('<div style="padding:'+(t(a,"marginTop")+t(a,"paddingTop"))+"px "+
(t(a,"marginRight")+t(a,"paddingRight"))+"px "+(t(a,"marginBottom")+t(a,"paddingBottom"))+"px "+(t(a,"marginLeft")+t(a,"paddingLeft"))+'px;" />').parent().wrap('<div id="'+y+'" style="height:100%;overflow:auto;position:relative;'+(K&&!window.statusbar.visible?"resize:both;":"")+'" />');c("html, body").css({height:"100%",margin:0,padding:0,overflow:"hidden"});K&&c('<style type="text/css" />').appendTo("head").text("#"+y+"::-webkit-resizer { background-color: #fff; }")}if(v&&!J){a=l.getElementsByTagName("frameset")[0];j=l.createElement((a?"":"i")+"frame");j.src=U()+":"+o;if(a){a.insertAdjacentElement("beforeEnd",j);a[a.cols?"cols":"rows"]+=",0";j.noResize=r;j.frameBorder=j.frameSpacing=0}else{j.style.display="none";j.style.width=j.style.height=0;j.tabIndex=-1;l.body.insertAdjacentElement("afterBegin",j)}u(function(){c(j).bind("load",function(){var b=j.contentWindow;e=b[y]!==h?b[y]:"";if(e!=q()){B(o);n.hash=e}});j.contentWindow[y]===h&&N()},50)}u(function(){s("init");B(o)},1);if(!G())if(v&&x>7||!v&&J)if(i.addEventListener)i.addEventListener(F,C,o);else i.attachEvent&&i.attachEvent("on"+F,C);else fa(C,50);"state"in window.history&&c(window).trigger("popstate")}},ga=function(a){a=a.toLowerCase();a=/(chrome)[ \/]([\w.]+)/.exec(a)||/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||a.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(a)||[];return{browser:a[1]||"",version:a[2]||"0"}},h,D=null,y="jQueryAddress",F="hashchange",V="change",W="internalChange",X="externalChange",r=true,o=false,d={autoUpdate:r,history:r,strict:r,wrap:o},z=function(){var a={},b=ga(navigator.userAgent);if(b.browser){a[b.browser]=true;a.version=b.version}if(a.chrome)a.webkit=true;else if(a.webkit)a.safari=true;return a}(),x=parseFloat(z.version),K=z.webkit||z.safari,v=!c.support.opacity,i=function(){try{return top.document!==h&&top.document.title!==h?top:window}catch(a){return window}}(),l=i.document,A=i.history,n=i.location,fa=setInterval,u=setTimeout,S=/\/{2,9}/g;z=navigator.userAgent;var J="on"+F in i,j,E=c("script:last").attr("src"),Y=E?E.indexOf("?"):-1,O=l.title,I=o,$=o,ba=r,L=o,e=q();if(v){x=parseFloat(z.substr(z.indexOf("MSIE")+4));if(l.documentMode&&l.documentMode!=x)x=l.documentMode!=8?7:8;var ca=l.onpropertychange;l.onpropertychange=function(){ca&&ca.call(l);if(l.title!=O&&l.title.indexOf("#"+q())!=-1)l.title=O}}if(A.navigationMode)A.navigationMode="compatible";if(document.readyState=="complete")var ha=setInterval(function(){if(c.address){aa();clearInterval(ha)}},50);else{Z();c(aa)}c(window).bind("popstate",function(){if(decodeURI(e)!=decodeURI(q())){e=q();B(o)}}).bind("unload",function(){if(i.removeEventListener)i.removeEventListener(F,C,o);else i.detachEvent&&i.detachEvent("on"+F,C)});return{bind:function(){return k.apply(this,g(arguments))},unbind:function(){return da.apply(this,g(arguments))},init:function(){return k.apply(this,["init"].concat(g(arguments)))},change:function(){return k.apply(this,[V].concat(g(arguments)))},internalChange:function(){return k.apply(this,[W].concat(g(arguments)))},externalChange:function(){return k.apply(this,[X].concat(g(arguments)))},baseURL:function(){var a=n.href;if(a.indexOf("#")!=-1)a=a.substr(0,a.indexOf("#"));if(/\/$/.test(a))a=a.substr(0,a.length-1);return a},autoUpdate:function(a){if(a!==h){d.autoUpdate=a;return this}return d.autoUpdate},history:function(a){if(a!==h){d.history=a;return this}return d.history},state:function(a){if(a!==h){d.state=a;var b=T();if(d.state!==h)if(A.pushState)b.substr(0,3)=="/#/"&&n.replace(d.state.replace(/^\/$/,"")+b.substr(2));else b!="/"&&b.replace(/^\/#/,"")!=H()&&u(function(){n.replace(d.state.replace(/^\/$/,"")+"/#"+b)},1);return this}return d.state},strict:function(a){if(a!==h){d.strict=a;return this}return d.strict},tracker:function(a){if(a!==h){d.tracker=a;return this}return d.tracker},wrap:function(a){if(a!==h){d.wrap=a;return this}return d.wrap},update:function(){L=r;this.value(e);L=o;return this},title:function(a){if(a!==h){u(function(){O=l.title=a;if(ba&&j&&j.contentWindow&&j.contentWindow.document){j.contentWindow.document.title=a;ba=o}},50);return this}return l.title},value:function(a){if(a!==h){a=M(a);if(a=="/")a="";if(e==a&&!L)return;e=a;if(d.autoUpdate||L){if(B(r))return this;if(G())A[d.history?"pushState":"replaceState"]({},"",d.state.replace(/\/$/,"")+(e===""?"/":e));else{I=r;if(K)if(d.history)n.hash="#"+e;else n.replace("#"+e);else if(e!=q())if(d.history)n.hash="#"+e;else n.replace("#"+e);v&&!J&&d.history&&u(N,50);if(K)u(function(){I=o},1);else I=o}}return this}return M(e)},path:function(a){if(a!==h){var b=this.queryString(),f=this.hash();this.value(a+(b?"?"+b:"")+(f?"#"+f:""));return this}return M(e).split("#")[0].split("?")[0]},pathNames:function(){var a=this.path(),b=a.replace(S,"/").split("/");if(a.substr(0,1)=="/"||a.length===0)b.splice(0,1);a.substr(a.length-1,1)=="/"&&b.splice(b.length-1,1);return b},queryString:function(a){if(a!==h){var b=this.hash();this.value(this.path()+(a?"?"+a:"")+(b?"#"+b:""));return this}a=e.split("?");return a.slice(1,a.length).join("?").split("#")[0]},parameter:function(a,b,f){var m,p;if(b!==h){var P=this.parameterNames();p=[];b=b===h||b===D?"":b.toString();for(m=0;m<P.length;m++){var Q=P[m],w=this.parameter(Q);if(typeof w=="string")w=[w];if(Q==a)w=b===D||b===""?[]:f?w.concat([b]):[b];for(var R=0;R<w.length;R++)p.push(Q+"="+w[R])}c.inArray(a,P)==-1&&b!==D&&b!==""&&p.push(a+"="+b);this.queryString(p.join("&"));return this}if(b=this.queryString()){f=[];p=b.split("&");for(m=0;m<p.length;m++){b=p[m].split("=");b[0]==a&&f.push(b.slice(1).join("="))}if(f.length!==0)return f.length!=1?f:f[0]}},parameterNames:function(){var a=this.queryString(),b=[];if(a&&a.indexOf("=")!=-1){a=a.split("&");for(var f=0;f<a.length;f++){var m=a[f].split("=")[0];c.inArray(m,b)==-1&&b.push(m)}}return b},hash:function(a){if(a!==h){this.value(e.split("#")[0]+(a?"#"+a:""));return this}a=e.split("#");return a.slice(1,a.length).join("#")}}}();c.fn.address=function(s){this.data("address")||this.on("click",function(g){if(g.shiftKey||g.ctrlKey||g.metaKey||g.which==2)return true;var k=g.currentTarget;if(c(k).is("a")){g.preventDefault();g=s?s.call(k):/address:/.test(c(k).attr("rel"))?c(k).attr("rel").split("address:")[1].split(" ")[0]:c.address.state()!==undefined&&!/^\/?$/.test(c.address.state())?c(k).attr("href").replace(new RegExp("^(.*"+c.address.state()+"|\\.)"),""):c(k).attr("href").replace(/^(#\!?|\.)/,"");c.address.value(g)}}).on("submit",function(g){var k=g.currentTarget;if(c(k).is("form")){g.preventDefault();g=c(k).attr("action");k=s?s.call(k):(g.indexOf("?")!=-1?g.replace(/&$/,""):g+"?")+c(k).serialize();c.address.value(k)}}).data("address",true);return this}})(jQuery);$(document).ready(function(){var QTABS={init:function(){$.address.init(function(event){QTABS.setPanel(event);}).change(function(event){QTABS.setPanel(event);});},setPanel:function(event){var hashtag=event.pathNames[0];var tab=(hashtag)?$('#tabs li a[href=#'+hashtag+']'):$('#tabs li:first a');$('#tabs li').removeClass('active');$('#panels .panel').hide();if(hashtag){tab.parent().addClass('active');$('#panels .panel:eq('+(tab.parent().index())+')').show();}else{$('#tabs li:first').addClass('active');$('#panels .panel:first').show();}}}
QTABS.init();});