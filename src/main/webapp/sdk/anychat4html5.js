/*! Copyright (c) 2005--2017 BaiRuiTech.Co.Ltd. All rights reserved. */
!function(e){function t(o){if(n[o])return n[o].exports;var r=n[o]={exports:{},id:o,loaded:!1};return e[o].call(r.exports,r,r.exports,t),r.loaded=!0,r.exports}var n={};return t.m=e,t.c=n,t.p="",t(0)}([function(e,t,n){function o(e){var t=new Date,n=t.getDate()>9?t.getDate():"0"+t.getDate(),o=t.getMonth()+1>9?t.getMonth()+1:"0"+(t.getMonth()+1),s=t.getFullYear(),c=t.getHours()>9?t.getHours():"0"+t.getHours(),d=t.getMinutes()>9?t.getMinutes():"0"+t.getMinutes(),u=t.getSeconds()>9?t.getSeconds():"0"+t.getSeconds();if(console.log(e),r.Uploadlog("["+s+"-"+o+"-"+n+" "+c+":"+d+":"+u+"] "+e),a=a+"\r\n & time："+c+":"+d+":"+u+":  "+e,e='<p><span class="text-info">time：'+c+":"+d+":"+u+"</span>&nbsp;&nbsp;&nbsp;&nbsp;"+e+"</p>",document.getElementById("log")){var f=document.getElementById("log").innerHTML;document.getElementById("log").innerHTML=e+f}i.putLog(a)}var r=n(1),i=n(9),a="";window.AnyChatSDK=r.instance,window.log=o,window.log_obj=i},function(e,t,n){function o(e){var t={};t.msgbuf=e,f&&f.socket_send("request",0,"uploadlog",t)}var r=n(2),i=n(5),a=n(6),s=n(8),c=n(3),d=window.URL||window.webkitURL||window.msURL||window.oURL,u={},f=null,l=function(){function e(e){}function t(e,t){var n=e+":"+t,o=[];return o.push(n),pe.addr=o,f.sessionid=null,f.connect(o),pe.connectaddr=n,0}function n(e,t,n){if(ue.getStringLength(e)>200||0==ue.getStringLength(e))return 21;var o={};return o.username=e,o.password=t,o.passenctype=n,o.platformtype=se,o.username&&f.socket_send("request",0,"login",o),fe.connect||(pe.loginData={},pe.loginData=o),0}function o(e,t,n,o,r,i,a){if(ue.getStringLength(e)>200||0==ue.getStringLength(e))return 21;var s={};return s.nickname=e,s.userid=t,s.struserid=n,s.appId=o,s.timestamp=r,s.lpSigStr=i,s.lpStrParam=a,s.platformtype=se,f.socket_send("request",0,"loginex",s),0}function l(e,t,n){var o={};return o.roomid=e,o.roompass=t,o.passenctype=n,f.userid===-1?(log("还没有登录成功，不能进房间"),!1):void f.socket_send("request",0,"enterroom",o)}function p(e,t){var n={};n.roomname=e,n.roompass=t,n.passenctype=dwParam,f.socket_send("request",0,"enterroomex",n)}function v(e){var t={};return f.roomid?(ue.closeAll(ae),e||(e=-1),t.roomid=e,f.roomid=0,f.userlist=[],f.socket_send("request",0,"leaveroom",t),0):(log("但不成功，因为没有进入房间"),20)}function m(e,t){var n={};n.userid=e,n.jsonbuf=ue.base64encode(t),f.socket_send("request",0,"transbuffer",n)}function g(e,t,n,o,r){var i={};i.userid=e,i.jsonbuf=ue.base64encode(t),i.param1=n,i.param2=o,i.flags=r,f.socket_send("request",0,"transbufferex",i)}function h(){var e={};return f.socket_send("request",0,"logout",e),0}function b(e,t,n,o,r,i){var a={};a.eventtype=e,a.userid=t,a.errorcode=n,a.flags=o,a.param=r,a.userstr=i,f.socket_send("request",0,"videocallcontrol",a)}function y(e,t,n,o){var r={};r.objecttype=e,r.objectid=t,r.infoname=n,r.infovalue=o,r.valuetype=1,f.socket_send("request",0,"objectsetvalue",r)}function S(e,t,n,o){var r={};r.objecttype=e,r.objectid=t,r.infoname=n,r.infovalue=o,r.valuetype=0,f.socket_send("request",0,"objectsetvalue",r)}function _(e,t,n){var o={};return o.objecttype=e,o.objectid=t,o.infoname=n,f.socket_send("request",0,"objectgetvalue",o),te.GetObjectIntValue(e,t,n)}function O(e,t,n){var o={};return o.objecttype=e,o.objectid=t,o.infoname=n,f.socket_send("request",0,"objectgetvalue",o),te.GetObjectStringValue(e,t,n)}function w(e,t,n,o,r,i,a,s){var c={};if(c.objecttype=e,c.objectid=t,501==n?f.queueId=t:502==n&&(c.objectid=f.queueId),c.ctrlcode=n,c.param1=o,c.param2=r,c.param3=i,c.param4=a,c.strparam=s,f.socket_send("request",0,"objectcontrol",c),502==n)return 0}function k(e){var t={};return t.objecttype=e,f.socket_send("request",0,"objectgetidlist",t),te.ObjectGetIdList(e)}function C(e,t){var n={};n.optname=e,n.optval=t,fe.connect?f.socket_send("request",0,"setsdkoptionstring",n):pe.SetSDKOptionStringArr.push(n)}function I(e,t){var n={};n.optname=e,n.optval=t,fe.connect?f.socket_send("request",0,"setsdkoptionint",n):pe.SetSDKOptionIntArr.push(n)}function A(e){var t={};t.optname=e,f.socket_send("request",0,"getsdkoptionstring",t)}function j(e){var t={};t.optname=e,f.socket_send("request",0,"getsdkoptionint",t)}function x(e,t){var n={};n.userid=e,n.open=t,D(e,t,0,0,"")}function D(e,t,n,o,r){if(!f.roomid)return log("还没有进入房间"),309;f.userlist;if(!e)return log("请输入对方userid"),309;var i={};i.userid=e,i.open=t,i.streamindex=n,i.flags=o,i.strparam=r;var a,s=pe.streamindex_video,c="";if(f.socket_send("request",0,"usercameracontrolex",i),e==-1||e==f.userid)if(c=s[n].value,a=s[n],0==t)ue.closeMyCamera(ae);else{var d=z(c);ue.createStream(d,a)}else if(0==t){var u=pe.setvideoposData,l=0;for(var p in u)u[p].userId==e&&u[p].streamIndex==n&&(l=u[p].peerId);0!=l&&ue.closeOtherCamera(l)}else{var v=f.sessionid+"_"+e+"_"+n;log("打开对方摄像头："+v);var m={};m.peerId=v,m.userId=e,m.streamIndex=n,pe.setvideoposData.push(m),f.createPeerConnection(v,n),f.addStreams(v)}}function M(e,t){var n={};n.userid=e,n.open=t,f.socket_send("request",0,"userspeakcontrol",n)}function R(e,t,n,o,r){var i={};i.userid=e,i.open=t,f.socket_send("request",0,"userspeakcontrol",i)}function L(e,t,n,o){var r={};r.userid=e,r.secret=t,r.buf=ue.base64encode(n),f.socket_send("request",0,"sendtextmessage",r)}function E(e){}function T(e){return 1==e?(pe.device_video_once=0,re.length):2==e?(pe.device_audio_once=0,ie.length):void 0}function q(e){if(1==e){var t=re[pe.device_video_once++];return t.label}if(2==e){var t=ie[pe.device_audio_once++];return t.label}}function N(e,t,n,o){n==BRAC_SO_LOCALVIDEO_BITRATECTRL&&de&&f.updatebrandwidth(de,o),pe.streamindex_video=ue.strema_video(pe,t,n,o)}function V(e,t,n,o){pe.streamindex_video=ue.strema_video(pe,t,n,o)}function B(e){var t;return e==-1?t=f.userlist.filter(function(){return!0}):[]}function U(e){return e}function G(e,t){return 0}function W(){return ne}function P(e,t){if(1==t){if(!oe[e])return;return oe[e].username}if(2==t){if(!oe[e])return;return oe[e].userip}}function K(e){return oe[e]?oe[e].status:void 0}function F(e,t){if(1==e)for(var n in oe)if(oe[n].username===t)return n}function H(e,t){if(6==t)return oe[e]?oe[e].username:void 0}function J(e,t,n,o){if(e==-1||e==f.userId)return 1==t?ae[0]?(ve=new record(ae[0]),ve.mimeType="video/webm",ve.ondataavailable=function(t){var n=d.createObjectURL(t);le.OnRecordSnapShotEx2(e,0,n,0,0,0,"")},ve.start(3e5),0):200:0==t?(ve.stop(),0):0}function z(e){for(var t in re)if(re[t].label==e)return re[t]}function Q(e,t,n){function o(e){var t=pe.setvideoposData;for(var n in t)t[n].userId==e;return n?n:-1}if(!f.roomid)return log("还没有进入房间"),!1;if(e==-1||f.userid==e){var r=document.createElement("video"),i=t;r.setAttribute("class","my"),r.setAttribute("autoplay",""),r.setAttribute("id",n),r.setAttribute("playsinline",""),i.appendChild(r),console.log("初始化显示流");var a=setInterval(function(){ae[0]&&(clearInterval(a),f.attachStream(ae[0],n))},500)}var s=o(e);return s!=-1&&(pe.setvideoposData[s].parentobj=t,void(pe.setvideoposData[s].id=n))}function Y(){function e(e){for(var t=0;t!=e.length;++t){var n=e[t];"video"===n.kind||"videoinput"===n.kind?re.push(n):"audio"!==n.kind&&"audioinput"!==n.kind||n.label.indexOf("麦克风")!=-1&&ie.push(n)}}re=[],ie=[],"undefined"!=typeof MediaStreamTrack.getSources?MediaStreamTrack.getSources(e):navigator.mediaDevices.enumerateDevices().then(function(t){e(t)})}function $(){}function X(){f.on("reply",function(e){var n=e.data,o=n.cmdcode,r=n.errorcode,a="",s="";if(me[o]){switch(o){case"connect":if(ue.clear_timer(),0==r)fe.connect=!0,ue.SetSDKOptionString(pe.SetSDKOptionStringArr),ue.SetSDKOptionInt(pe.SetSDKOptionIntArr),pe.SetSDKOptionStringArr=[],pe.SetSDKOptionIntArr=[],log("Message\tOnConnect(errorcode=0,addr="+pe.connectaddr+")");else if(1==r)return n.gwaddr&&n.gwport&&(fe.connect=!1,f.is_socket=!1,f.socket=null,t(n.gwaddr,n.gwport)),"errorcode 1";if(pe.loginData){var e={};e=pe.loginData,e.username&&f.socket_send("request",0,"login",e)}i.start(f);break;case"login":case"loginex":if(23==r||r==-1)return $(),void log("hold 住");pe.loginData={},0==r?(log("OnLoginSystem(userid="+n.userid+",errorcode="+r+")"),f.sessionid=n.sessionid,f.userid=a=n.userid):(log("OnLoginSystem(errorcode="+r+")"),a=-1);break;case"enterroom":0==r&&(f.roomid=n.roomid),a=n.roomid,log("Message OnEnterRoom(roomid:"+a+",errorcode:"+r+")")}me[o]&&le.OnNotifyMessage(me[o],a,s||r)}"tokenconnect"===o&&(0==r?(ue.clear_timer(),i.start(f),log("重连成功")):(f.sendData={},f.sessionid=null,log("重连失败"))),"heartbeat"===o&&i.notify(r),"logout"===o&&(log("注销成功"),f.socket.close(),ue.closeAll(ae),i.stop(),c.clear_all(),f.roomid=0,f.userid=0,f.socket=null,f.normalCloseWebsocket=!0)}),f.on("request",function(e){var t=e.data,n=t.cmdcode;"restrans"===n&&c.restrans_to_service(t.begin_reg)}),f.on("notify",function(e){var t=e.data,n=t.cmdcode,o=t.errorcode,r="",i="";if(c.set_big_index_notify(e.seq),me[n]){switch(n){case"onlineuser":var a=t.useridlist;if("object"!=typeof a&&(a=JSON.parse(a),a.userlist)){var s=a.userlist;for(var d in s)oe[s[d].userid]||(oe[s[d].userid]={}),oe[s[d].userid].username=s[d].username,log(s[d].username)}var u=a.useridlist;f.userlist=u,r=u.length,i=t.roomid;break;case"linkclose":break;case"useratroom":r=t.userid,1==t.benter?(f.userlist.push(r),oe[r]||(oe[r]={}),t.username&&log("进房间："+t.username),oe[r].username=t.username):ue.ArrayremoveByValue(f.userlist,r),i=t.benter}me[n]&&le.OnNotifyMessage(me[n],r,i||o)}if("keep"===n&&(0==o&&(f.sessionid=t.sessionid,f.userid=r=t.userid),le.OnNotifyMessage(WM_GV_LOGINSYSTEM,r,i||o)),"webrtcconsult"===n&&0==o){var l=JSON.parse(t.jsonbuf);"answer"===l.type?(log("收到answer"),ce=l.sdp,de=l.peerconnectionid,"ios"===f.system?l.sdp=ue.setMediaBitrates(l.sdp,350,30):(log("answer 码率"+f.bitrate+" 系统："+f.system),l.sdp=ue.setMediaBitrates(l.sdp,f.bitrate,30)),f.receiveAnswer(l.peerconnectionid,l.sdp)):"candidate"===l.type&&(log("收到candidate"),f.candidate(l))}if("textmessage"===n){var p=ue.base64decode(t.msgbuf);le.OnAnyChatTextMessage(t.fromuserid,t.touserid,t.secret,p,0)}"objectevent"===n&&(0==t.eventtype?te.setObjectInfo(t):t.eventtype==-1?te.setObjectInfo_1(t):le.OnAnyChatObjectEvent(t.objecttype,t.objectid,t.eventtype,t.param1,t.param2,t.param3,t.param4,t.strparam)),"videocallevent"===n&&le.OnAnyChatVideoCallEvent(t.eventtype,t.userid,t.errorcode,t.flags,t.param,t.jsonbuf),"transbuffer"===n&&le.OnAnyChatTransBuffer(t.userid,ue.base64decode(t.jsonbuf),0),"transbufferex"===n&&le.OnAnyChatTransBufferex(t.userid,ue.base64decode(t.jsonbuf),0,t.param1,t.param2,t.taskid),"friendstatus"===n&&(le.OnNotifyMessage(WM_GV_FRIENDSTATUS,t.userid,t.status),oe[t.userid]=t,ne.indexOf(t.userid)<0&&ne.push(t.userid)),"userinfoupdate"===n&&le.OnNotifyMessage(WM_GV_USERINFOUPDATE,t.userid,t.type),"appconfiginfo"===n&&0==o&&(t.videobitrate&&(f.bitrate=t.videobitrate/1e3),t.videowidth&&(f.videowidth=t.videowidth),t.videoheight&&(f.videoheight=t.videoheight),t.videofps&&(f.videofps=t.videofps))}),f.on("stream_created",function(e){ae[0]=e}),f.on("close_websocket",function(e){log("正在尝试重连"),i.stop(),ue.tokenconnect(pe.addr,ae)}),f.on("linkclose",function(e){var t=WM_GV+6;le.OnNotifyMessage(t,0,e)}),f.on("offer",function(e,t){var n,o={},r={},i=pe.setvideoposData;for(var a in i)i[a].peerId==t&&(n=i[a]);r.type="offer",r.sdp=e.sdp,r.peerconnectionid=t,r.streamindex=n.streamIndex,o.jsonbuf=r,f.socket_send("request",0,"webrtcconsult",o)}),f.on("pc_add_stream",function(e,t){var n=t.split("_");log("打开对方流：sessionid："+t);var o,r=pe.setvideoposData;for(var i in r)r[i].peerId==t&&r[i].streamIndex==n[2]&&(o=r[i]);if(o){var a=document.createElement("video"),s=o.id,c=o.parentobj;o.parentobj&&(a.setAttribute("class","other"),a.setAttribute("name",t),a.setAttribute("autoplay",""),a.setAttribute("playsinline",""),a.setAttribute("id",s),c.appendChild(a),f.attachStream(e,s))}}),f.on("ack",function(e){c.delt_pack(e.seq)})}function Z(e,t){switch(e){case"OnNotifyMessage":le.OnNotifyMessage=t;break;case"OnVideoCallEvent":le.OnAnyChatVideoCallEvent=t;break;case"OnObjectEvent":le.OnAnyChatObjectEvent=t;break;case"OnTextMessage":le.OnAnyChatTextMessage=t;break;case"OnTransBuffer":le.OnAnyChatTransBuffer=t;break;case"OnTransBufferex":le.OnAnyChatTransBufferex=t;break;case"OnRecordSnapShotEx2":le.OnRecordSnapShotEx2=t}}function ee(){f.browserName=ue.getBrowser(),console.log("浏览器名字："+f.browserName),X(),setTimeout(function(){Y()},1)}if(u.Connect)return u;f=new r.instance;var te=new a(f);c.setWay(f);var ne=[],oe={},re=[],ie=[],ae=[],se=0,ce="",de="",ue=s.instance(f);if(f.system=ue.system_s(),se=ue.system_s(1),log("系统："+f.system),!f.support())return log("不支持h5音视频通话，请更换浏览器"),!1;var fe={};fe.connect=!1;var le={},pe={};pe.setvideoposData=[],pe.SetSDKOptionStringArr=[],pe.SetSDKOptionIntArr=[],pe.connectaddr,pe.streamindex_video={},pe.SetSDKOptionString=[],pe.SetSDKOptionInt=[];var ve,me={connect:WM_GV_CONNECT,login:WM_GV_LOGINSYSTEM,loginex:WM_GV_LOGINSYSTEM,enterroom:WM_GV_ENTERROOM,onlineuser:WM_GV_ONLINEUSER,linkclose:WM_GV_LINKCLOSE,useratroom:WM_GV_USERATROOM};return window.onbeforeunload=function(){h()},ee(),u.InitSDK=e,u.Connect=t,u.Login=n,u.LoginEx=o,u.EnterRoom=l,u.EnterRoomEx=p,u.LeaveRoom=v,u.Logout=h,u.on=Z,u.UserCameraControl=x,u.UserCameraControlEx=D,u.UserSpeakControl=M,u.PrepareFetchDevices=T,u.FetchNextDevice=q,u.SetVideoPos=Q,u.SetUserStreamInfoString=N,u.SetUserStreamInfoInt=V,u.SetSDKOptionString=C,u.SetSDKOptionInt=I,u.VideoCallControl=b,u.SetObjectStringValue=y,u.SetObjectIntValue=S,u.GetObjectIntValue=_,u.GetObjectStringValue=O,u.ObjectControl=w,u.ObjectGetIdList=k,u.GetRoomOnlineUsers=B,u.SendTextMessage=L,u.GetSDKOptionString=A,u.GetSDKOptionInt=j,u.TransBuffer=m,u.TransBufferEx=g,u.GetVersion=E,u.GetCurrentDevice=U,u.QueryUserStateInt=G,u.UserSpeakControlEx=R,u.GetUserFriends=W,u.GetUserInfo=P,u.GetFriendStatus=K,u.QueryInfoFromServer=F,u.QueryUserStateString=H,u.StreamRecordCtrl=J,u};t.instance=l,t.Uploadlog=o},function(e,t,n){function o(){this.events={}}function r(){this.localMediaStream=null,this.roomid="",this.userid=-1,this.socket=null,this.sessionid=null,this.is_socket=!1,this.peerConnections={},this.connections=[],this.numStreams=0,this.initializedStreams=0,this.browserName="",this.normalCloseWebsocket=!1,this.userlist=[],this.timeOut=0,this.timeOutInt=s.timeOutInt,this.srrc_index=0,this.sendData={},this.system="",this.mobile_type=0,this.queueId="",this.bitrate=s.bitrate,this.videowidth=s.videowidth,this.videoheight=s.videoheight,this.videofps=s.videofps}function i(e,t){var n="AS";return e=e.indexOf("b="+n+":")===-1?e.replace(/c=IN (.*)\r\n/,"c=IN $1\r\nb="+n+":"+t+"\r\n"):e.replace(new RegExp("b="+n+":.*\r\n"),"b="+n+":"+t+"\r\n"),log("更新码率"+t),e}var a=n(3),s=n(4),c=window.RTCPeerConnection||window.mozRTCPeerConnection||window.webkitRTCPeerConnection||"",d=window.URL||window.webkitURL||window.msURL||window.oURL||"",u=navigator.getUserMedia||navigator.webkitGetUserMedia||navigator.mozGetUserMedia||navigator.msGetUserMedia||"",f=window.mozRTCIceCandidate||window.RTCIceCandidate||"",l=window.mozRTCSessionDescription||window.RTCSessionDescription||"",p=(!!navigator.mozGetUserMedia,{iceServers:[{urls:"stun:h5.anychat.cn:9000"}]});o.prototype.on=function(e,t){this.events[e]=this.events[e]||[],this.events[e].push(t)},o.prototype.emit=function(e,t){var n,o,r=this.events[e],i=Array.prototype.slice.call(arguments,1);if(r)for(n=0,o=r.length;n<o;n++)r[n].apply(null,i)},r.prototype=new o,r.prototype.connect=function(e){var t,n=this;if(this.socket)return log("不需要重连，已经存在websocket 链接"),!1;var o="https:"==document.location.protocol,r=o?"wss:"+e[0]:"ws:"+e[0];if("WebSocket"in window)t=this.socket=new WebSocket(r,"anychat-protocol");else{if(!("MozWebSocket"in window))return log("不支持websocket"),void alert("WebSocket is not supported by this browser.");t=this.socket=new MozWebSocket(r,"anychat-protocol")}t.onopen=function(){n.is_socket=!0;var e={};e=n.sessionid?{eventname:"request",ssrc:0,data:{cmdcode:"tokenconnect",sessionid:n.sessionid}}:{eventname:"request",ssrc:0,data:{cmdcode:"connect"}},t.send(JSON.stringify(e))},t.onmessage=function(e){var o=JSON.parse(e.data),r=o.data;"object"!=typeof r&&(o.data=JSON.parse(r)),o.eventname?n.emit(o.eventname,o):n.emit("socket_receive_message",t,o)},t.onerror=function(e){console.log("socket_error"),n.socket=!1,n.is_socket=!1,n.emit("socket_error",e,t)},t.onclose=function(e){n.is_socket=!1,n.socket=!1,n.normalCloseWebsocket||n.emit("close_websocket",e),n.normalCloseWebsocket=!1},n.on("ready",function(){})},r.prototype.socket_send=function(e,t,n,o){var r={};r.eventname=e,r.ssrc=0,o.userid&&(o.userid=parseInt(o.userid)),r.data={},r.data=o,r.data.cmdcode=n,r=a.data_pack(r),this.is_socket&&this.socket.send(JSON.stringify(r))},r.prototype.data_pack=function(e){},r.prototype.support=function(){return!!c},r.prototype.createStream=function(e,t){function n(){"ios"===a.system?navigator.mediaDevices.getUserMedia(s).then(function(e){a.localMediaStream=e,a.initializedStreams++,log("自己视频流打开成功"),a.emit("stream_created",e)},function(e){throw log("视频流打开失败:"+e),"retry"}):u.call(navigator,s,function(e){a.localMediaStream=e,a.initializedStreams++,log("自己视频流打开成功"),a.emit("stream_created",e)},function(e){throw log("视频流打开失败:"+e),"retry"})}var o,r,i,a=this,s={};if(t?(o=t.width||this.videowidth,r=t.height||this.videoheight,i=t.fpsctrl||this.videofps):(o=this.videowidth,r=this.videoheight,i=this.videofps),console.log("摄像头打开信息，分辨率w:"+o+"；分辨率h："+r),s.video={},s.audio=!0,e&&(s.video.optional=[{sourceId:e}]),u)try{1==a.mobile_type?s.video.mandatory={minHeight:0,maxHeight:r,minWidth:0,maxWidth:o,maxFrameRate:i,minAspectRatio:.75,maxAspectRatio:.75}:s.video.mandatory={minHeight:0,maxHeight:r,minWidth:0,maxWidth:o,maxFrameRate:i,minAspectRatio:1.333333,maxAspectRatio:1.333333},n()}catch(t){try{log("不支持设置视频分辨率"+t),s.video={height:{min:10,ideal:r,max:1280},width:{min:10,ideal:o,max:720},frameRate:{ideal:i,max:60}},e&&(s.video.optional={sourceId:e}),n()}catch(e){log("不支持设置视频分辨率"+e),s.video=!0,n()}}else log("不支持视频流")},r.prototype.addStreams=function(e){var t=this,n=setInterval(function(){t.localMediaStream&&(clearInterval(n),t.peerConnections[e].addStream(t.localMediaStream),t.sendOffers(e))},100)},r.prototype.attachStream=function(e,t){var n=document.getElementById(t);if(!n)return log("找不到可以设置video 标签的div"),!1;if("my"===n.className){if("ios"===this.system)try{var o=new MediaStream;o.addTrack(e.getVideoTracks()[0]),n.srcObject=o}catch(e){alert(e)}else n.src=d.createObjectURL(e);n.volume=0,n.muted=!1,n.style.transform=" rotateY(180deg)"}else"ios"===this.system?n.srcObject=e:n.src=d.createObjectURL(e);n.addEventListener("canplaythrough",function(){log("视频分辨率宽："+n.clientWidth),log("视频分辨率高："+n.clientHeight)})},r.prototype.sendOffers=function(e){var t,n=this,o={};pcCreateOfferCbGen=function(e,t){return function(r){e.setLocalDescription(r),o=r,n.emit("offer",o,t),log("发送offer给对方")}},pcCreateOfferErrorCb=function(e){log("发送offer报错："+e),console.log(e)},t=this.peerConnections[e],t.createOffer(pcCreateOfferCbGen(t,e),pcCreateOfferErrorCb)},r.prototype.updatebrandwidth=function(e,t){var n;n=this.peerConnections[e],n&&n.createOffer().then(function(e){return n.setLocalDescription(e)}).then(function(){var e={type:n.remoteDescription.type,sdp:i(n.remoteDescription.sdp,t)};return n.setRemoteDescription(e)}).then(function(){}).catch()},r.prototype.receiveOffer=function(e,t){this.peerConnections[e];this.sendAnswer(e,t)},r.prototype.sendAnswer=function(e,t){var n=this.peerConnections[e],o=this;n.setRemoteDescription(new l(t)),n.createAnswer(function(t){n.setLocalDescription(t),o.socket.send(JSON.stringify({eventName:"__answer",data:{socketId:e,sdp:t}}))},function(e){console.log(e)})},r.prototype.receiveAnswer=function(e,t){var n=this.peerConnections[e];if(!n)return!1;var o={};o.type="answer",o.sdp=t,n.setRemoteDescription(new l(o))},r.prototype.createPeerConnections=function(){var e,t;for(e=0,t=this.connections.length;e<t;e++)this.createPeerConnection(this.connections[e])},r.prototype.createPeerConnection=function(e,t){var n=this;try{var o=new c(p)}catch(e){return log(e),!1}this.peerConnections[e]=o;var r={},i={sdpMid:"",sdpMLineIndex:"",candidate:""};return o.onicecandidate=function(o){if("object"==typeof o.candidate)try{i.sdpMid=o.candidate.sdpMid,i.sdpMLineIndex=o.candidate.sdpMLineIndex,i.candidate=o.candidate.candidate,i.peerconnectionid=e,i.streamindex=t,i.type="candidate",o.candidate&&(r.jsonbuf=i,n.socket_send("request",0,"webrtcconsult",r))}catch(e){log("onicecandidate warm")}},o.onopen=function(){log("peerConnections打开成功")},o.onaddstream=function(t){n.emit("pc_add_stream",t.stream,e,o)},o.onremovestream=function(e){log("onremovestream")},o.ondatachannel=function(e){},o.oniceconnectionstatechange=function(){},o.onidentityresult=function(){},o.onidpassertionerror=function(){},o.onidpvalidationerror=function(){},o.onnegotiationneeded=function(){},o.onpeeridentity=function(){},o.onsignalingstatechange=function(){},o},r.prototype.closePeerConnection=function(e){e&&e.close()},r.prototype.closeAllPeerConnection=function(){for(var e in this.peerConnections)this.peerConnections[e].close(),delete this.peerConnections[e];log("关闭peerConnection")},r.prototype.closeOtherPeerConnection=function(e){this.peerConnections[e]&&(this.peerConnections[e].close(),delete this.peerConnections[e]),log("关闭他人peerConnection:"+e)},r.prototype.removeVideo=function(){function e(e){var t=e.parentNode;t&&t.removeChild(e)}var t=document.querySelectorAll("video.my,video.other");for(var n in t)isNaN(n)||e(t[n]);log("移除video标签")},r.prototype.removeMyVideo=function(){function e(e){var t=e.parentNode;t&&t.removeChild(e)}var t=document.querySelectorAll("video.my");for(var n in t)e(t[n]);log("移除自己video标签")},r.prototype.removeOtherVideo=function(e){function t(e){var t=e.parentNode;t&&t.removeChild(e)}var n=document.querySelectorAll("video.other");for(var o in n)isNaN(o)||n[o].getAttribute("name")==e&&t(n[o]);log("移除他人video标签："+e)},r.prototype.candidate=function(e){var t=this.peerConnections[e.peerconnectionid];if(!t)return!1;try{var n=new f(e);t.addIceCandidate(n)}catch(n){t.addIceCandidate(e)}},t.instance=r},function(e,t){function n(e){return"heartbeat"!==e.data.cmdcode&&(e.seq=++l,f[l]=e),e}function o(e){for(var t=e;t>=p;t--)delete f[t];p=e}function r(e){u=e,setInterval(function(){a()},m)}function i(e){e-v===1||s(v),v=e}function a(){var e={eventname:"ack",ssrc:0,seq:v,data:{}};u.is_socket&&u.socket.send(JSON.stringify(e))}function s(e){var t={eventname:"request",ssrc:0,seq:0,data:{cmdcode:"restrans",begin_reg:++e}};u.is_socket&&u.socket.send(JSON.stringify(t))}function c(e){for(var t in f)t>e&&u.is_socket&&f[t]&&(u.socket.send(JSON.stringify(f[t])),delete f[t])}function d(){l=0,v=0}var u,f={},l=0,p=0,v=0,m=3e3;t.data_pack=n,t.delt_pack=o,t.setWay=r,t.set_big_index_notify=i,t.restrans_to_service=c,t.clear_all=d},function(e,t){t={timeOutInt:30,bitrate:200,videowidth:320,videoheight:240,videofps:15}},function(e,t){function n(e){var t={};clearInterval(i),i=setInterval(function(){e.socket_send("request",0,"heartbeat",t)},1e3*a)}function o(e){}function r(){i&&clearInterval(i)}var i,a=5;t.start=n,t.notify=o,t.stop=r},function(e,t,n){var o=(n(7),function(){function e(e){this.getway=e,this.objectInfoData={},this.objectInfoData_1={},this.objectidlist_5=[]}return e.prototype.setObjectInfo=function(e){var t=e.objecttype+"_"+e.objectid;this.objectInfoData[t]||e.objecttype==r&&this.objectidlist_5.push(e.objectid),this.objectInfoData[t]=JSON.parse(e.jsonbuf)},e.prototype.setObjectInfo_1=function(e){var t=e.objecttype+"_"+e.objectid;this.objectInfoData_1[t]=JSON.parse(e.jsonbuf)},e.prototype.GetObjectIntValue=function(e,t,n){var o=this,r=0,a=e+"_"+t;return o.objectInfoData[a]?(n==i?r=o.objectInfoData[a].flags:n==s?r=o.objectInfoData[a].priority:n==c?r=o.objectInfoData[a].attribute:n==u?r=o.objectInfoData[a].inttag:n==p?r=o.objectInfoData_1[a].beforeusernum:n==l?r=o.objectInfoData_1[a].mysequenceno:n==v?r=o.objectInfoData_1[a].myenterqueuetime:n==g?r=o.objectInfoData_1[a].waittimesecond:n==m&&(r=o.objectInfoData_1[a].queuelength),r):"undefined"},e.prototype.GetObjectStringValue=function(e,t,n){var o=this,r="",i=e+"_"+t;return o.objectInfoData[i]?(n==a?r=o.objectInfoData[i].objectname:n==d?r=o.objectInfoData[i].description:n==f&&(r=o.objectInfoData[i].stringtag),r):"undefined"},e.prototype.ObjectGetIdList=function(e){if(e==r)return this.objectidlist_5},e}()),r=5,i=7,a=8,s=9,c=10,d=11,u=12,f=13,l=501,p=502,v=503,m=504,g=508;e.exports=o},function(e,t){function n(e){var t,n,o,i,a,s;for(o=e.length,n=0,t="";n<o;){if(i=255&e.charCodeAt(n++),n==o){t+=r.charAt(i>>2),t+=r.charAt((3&i)<<4),t+="==";break}if(a=e.charCodeAt(n++),n==o){t+=r.charAt(i>>2),t+=r.charAt((3&i)<<4|(240&a)>>4),t+=r.charAt((15&a)<<2),t+="=";break}s=e.charCodeAt(n++),t+=r.charAt(i>>2),t+=r.charAt((3&i)<<4|(240&a)>>4),t+=r.charAt((15&a)<<2|(192&s)>>6),t+=r.charAt(63&s)}return t}function o(e){var t,n,o,r,a,s,c;for(s=e.length,a=0,c="";a<s;){do t=i[255&e.charCodeAt(a++)];while(a<s&&t==-1);if(t==-1)break;do n=i[255&e.charCodeAt(a++)];while(a<s&&n==-1);if(n==-1)break;c+=String.fromCharCode(t<<2|(48&n)>>4);do{if(o=255&e.charCodeAt(a++),61==o)return c;o=i[o]}while(a<s&&o==-1);if(o==-1)break;c+=String.fromCharCode((15&n)<<4|(60&o)>>2);do{if(r=255&e.charCodeAt(a++),61==r)return c;r=i[r]}while(a<s&&r==-1);if(r==-1)break;c+=String.fromCharCode((3&o)<<6|r)}return c}var r="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",i=new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1);t.base64encode=n,t.base64decode=o},function(e,t,n){var o,r=n(7),i=function(e){function t(e,t,n){for(var o=e.split("\r\n"),r=-1,i=0;i<o.length;i++)if(console.log("m="+t),0===o[i].indexOf("m="+t)){r=i;break}if(r===-1)return console.debug("Could not find the m line for",t),e;for(console.debug("Found the m line for",t,"at line",r),r++;0===o[r].indexOf("i=")||0===o[r].indexOf("c=");)r++;if(0===o[r].indexOf("b"))return console.debug("Replaced b line at line",r),o[r]-"b=AS."+n,o.join("\r\n");console.debug("Adding new b line before line",r);var a=o.slice(0,r);return a.push("b=AS:"+n),a=a.concat(o.slice(r,o.length)),a.join("\r\n")}var n={};return n.createStream=function(t,n){var o;t?(o=t.id||t.deviceId,e.createStream(o,n)):e.createStream("",n)},n.clear_timer=function(){e.timeOut=0,o||(clearInterval(o),o=null)},n.tokenconnect=function(t,n){o||(o=setInterval(function(){return e.is_socket?(clearInterval(o),o=null,!1):(e.timeOut++,log("正在重连："+e.timeOut),void(e.timeOut==e.timeOutInt&&(e.is_socket||(clearInterval(o),BRAC_LeaveRoom(),e.emit("linkclose",100),e.sendData={},e.roomid="",e.sessionid="",e.timeOut=0,o=null))))},1e3)),setTimeout(function(){e.socket=null,e.connect(t)},4e3)},n.strema_video=function(t,n,o,r){var i,a={},s=t.streamindex_video;switch(o){case BRAC_SO_LOCALVIDEO_DEVICENAME:case BRAC_STREAMINFO_VIDEOCODECID:a.dwStreamIndex=n,a.value=r,s[n]=a;break;case BRAC_SO_LOCALVIDEO_WIDTHCTRL:i==-1||(s[n].width=r);break;case BRAC_SO_LOCALVIDEO_HEIGHTCTRL:i==-1||(s[n].height=r);break;case BRAC_SO_LOCALVIDEO_FPSCTRL:i==-1||(s[n].fpsctrl=r);break;case BRAC_SO_LOCALVIDEO_BITRATECTRL:e.bitrate=r/1e3,i==-1||(s[n].fpscode=r)}return s},n.getBrowser=function(){var e="unknown browser",t=navigator.userAgent.toLowerCase(),n={ie:/msie/.test(t)&&!/opera/.test(t),op:!/msie/.test(t)&&/opera/.test(t),sa:/version.*safari/.test(t),ch:/chrome/.test(t)&&window.navigator.webkitPersistentStorage,ff:/firefox/.test(t),qh360:/chrome/.test(t)&&!window.navigator.webkitPersistentStorage,qq:/qqbrowser/.test(t),sg:/metasr/.test(t)};return n.ch?e="Chrome":n.ie?e="IE":n.ff?e="Firefox":n.sa?e="Safari":n.qh360?e="360浏览器":n.op?e="Opera":n.qq?e="QQ浏览器":n.sg&&(e="搜狗浏览器"),e},n.system_s=function(t){if(!navigator)return 1===t?3:"ios";var n=navigator.userAgent;n.indexOf("Chrome/60.0.3112.116")>0&&(e.mobile_type=1);for(var o=new Array("Android"),r=new Array("iPhone","iPad","iPod","Safari"),i=new Array("Windows"),a=0;a<o.length;a++){var s=n.indexOf(o[a]);if(s>0)return 1===t?2:"android"}for(var a=0;a<i.length;a++){var s=n.indexOf(i[a]);if(s>0)return 1===t?1:"windows"}for(var a=0;a<r.length;a++){var s=n.indexOf(r[a]);if(s>0)return 1===t?n.indexOf("iPhone")>0?(log("iphone"),4):3:"ios"}},n.log=function(e){console.log(e)},n.closeAll=function(t){try{for(var n in t)t[n]&&(log("关闭摄像头"),log(t[n].getVideoTracks()[0]),t[n].getVideoTracks()[0].stop(),t[n].getAudioTracks()[0].stop(),t[n]="",e.localMediaStream=null)}catch(e){log("摄像头关闭失败"),log(e)}e.closeAllPeerConnection(),e.removeVideo()},n.closeMyCamera=function(t){try{log("关闭自己摄像头"),t[0].getVideoTracks()[0].stop(),t[0].getAudioTracks()[0].stop(),t[0]="",e.removeMyVideo(),e.localMediaStream=null}catch(e){log("摄像头关闭失败"),log(e)}},n.closeOtherCamera=function(t){e.closeOtherPeerConnection(t),e.removeOtherVideo(t)},n.SetSDKOptionString=function(t){for(var n in t){var o={};o=t[n],e.socket_send("request",0,"setsdkoptionstring",o)}},n.SetSDKOptionInt=function(t){for(var n in t){var o={};o=t[n],e.socket_send("request",0,"setsdkoptionint",o)}},n.ArrayremoveByValue=function(e,t){for(var n=0;n<e.length;n++)if(e[n]==t){e.splice(n,1);break}},n.base64encode=r.base64encode,n.base64decode=r.base64decode,n.setMediaBitrates=function(e,n,o){return t(t(e,"video",n),"audio",o)},n.funDownload=function(e,t){var n=document.createElement("a");n.download=t,n.style.display="none";var o=new Blob([e]);n.href=URL.createObjectURL(o),document.body.appendChild(n),n.click(),document.body.removeChild(n)},n.getStringLength=function(e){for(var t,n=e,o=0;o<n.length;o++){var r=n.charAt(o);t+=/^[\u0000-\u00ff]$/.test(r)?1:3}return t},n};t.instance=i},function(e,t){var n=function(){function e(){this.filename="BRAnyChatCore.txt",this.log_txt="日志内容"}return e.prototype.explore=function(e,t,n){if(n)return this.weixinLog(e);var o=document.createElement("a");o.download=t,o.style.display="none";var r;try{r=new Blob([e],{type:"text/plain"})}catch(t){var i=BlobBuilder||WebKitBlobBuilder||MozBlobBuilder||"";if("TypeError"==t.name&&i){var a=new i;a.append([e]),r=a.getBlob("text/plain")}}o.href=URL.createObjectURL(r),document.body.appendChild(o),o.click(),document.body.removeChild(o)},e.prototype.weixinLog=function(e){function t(e){new Image;return e.toDataURL("image/jpeg")}function n(e,t,n,o,r){var i=t.getContext("2d");i.fillStyle="#ffffff",i.font="20px";for(var a=0,s=t.width,c=0,d=0;d<e.length;d++)a+=i.measureText(e[d]).width,(a>s-n||"&"==e[d])&&("&"==e[d],i.fillText(e.substring(c,d),n,o),o+=r,a=0,c=d),d==e.length-1&&i.fillText(e.substring(c,d+1),n,o)}var o=document.getElementById("myCanvas");return o.style.width="640px",n(e,o,20,20,22),t(o)},e.prototype.doExplore=function(e){return this.explore(this.log_txt,this.filename,e)},e.prototype.putLog=function(e){this.log_txt=e},e}(),o=new n;e.exports=o}]);