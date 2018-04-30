<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>VoIP demo</title>
</head>
<body>
<link rel="stylesheet" href="./res/rongcloud.css">
<a href="https://github.com/rongcloud/websdk-demo/blob/master/voip.html" class="get-source">获取源码</a>

<style>
/*.wrapper{
    visibility:hidden;
}
*/.wrapper input{
  margin:10px;
}
#main{
    border:1px solid #ccc;
    width:400px;
    height:300px;
    position:relative;
    margin-bottom:20px;
}
    
.rong-calllib-remote{
    height: 150px;
    width: 200px;
    border:1px solid #ccc;
    position:absolute;
    right:5px;
    top:5px;
}
.big{
    height: 300px;
    width: 400px;
    border:1px solid #ccc;
    position:absolute;
    left:225px;
    top:5px;
}
.mainSmall{
    align-items: right;
    justify-content: flex-end;
}
.mainSmall canvas{
    height: 150px;
    width: 200px;
}
.notice{
    font-size: 12px;
    line-height:2;
    margin-top: 30px;
}
#video,
#audio,
#mute,
#convert,
#acceptVideo,
#acceptAudio,
#hungup,
#switchVideoWindows{
    display: none;
}
</style>

<div class="wrapper">
    <div id="main"></div>

    <input type="text" placeholder="ey pwe86ga5piec6" id="appkey">
    <input type="text" placeholder="被邀请人的 userId" id="targetId"><br>
    <input type="text" placeholder="当前用户的 token" style="width: 280px;" id="token"><br>

    <input type="button" value="连接" id="connect" onclick="connect()">

    <input type="button" value="视频通话" id="video">
    <input type="button" value="音频通话" id="audio">

    <input type="button" value="视频转音频" id="convert">    
    <input type="button" value="静音" id="mute">
    
    <input type="button" value="接通视频" id="acceptVideo">
    <input type="button" value="接通音频" id="acceptAudio">
    <input type="button" value="挂断" id="hungup">
    <input type="button" value="窗口切换" id="switchVideoWindows">
</div>

<div class="notice">
使用说明：<br>
    1、下载代码 <br>
    2、请使用自己已经开通 VoIP 服务的 appKey<br>
    3、连接前请填写 Appkey、token、被邀请人的 userId<br>
    4、部署测试，访问: http://yourhost/voip.html<br>
    5、官方文档 <a href="http://www.rongcloud.cn/docs/web_calllib.html">http://www.rongcloud.cn/docs/web_calllib.html</a>
</div>

<script src="lib/jquery-3.1.1.js"></script>

<script src="//cdn.ronghub.com/RongIMLib-2.3.0.js"></script>
<!-- <script src="//cdn.ronghub.com/RongCallLib-2.2.0.min.js"></script> -->
<script src="./lib/RongCallLib-2.3.0.min.js"></script>

<script src="init.js"></script>
<script>
var video = $('#video'),
    audio = $('#audio'),
    mute = $('#mute'),
    convert = $('#convert'),
    acceptVideo = $('#acceptVideo'),
    acceptAudio = $('#acceptAudio'),
    hungup = $('#hungup');
    switcher = $('#switchVideoWindows'),
    connectElement = $('#connect'),
    appkeyElement = $('#appkey'),
    tokenElement = $('#token'),
    targetIdElement = $('#targetId');
var show = function(nodes){
    $(nodes).each(function (index, item){
        item.show();
    });
};
var hide = function(nodes){
    $(nodes).each(function (index, item){
        item.hide();
    });
};
var userId = "";
var inviteUserId = "";
var targetId = "";
var CallLib = null;
var messageHandler = function(messageType){
    var handler = {
        InviteMessage: function(message){
            var isVideo = message.content.mediaType == mediaVideo;
            var node = isVideo ? acceptVideo : acceptAudio;
            show([node, hungup]);
            hide([video, audio]);
        },
        SummaryMessage: function(message){
             // 通话信息，挂断收到此消息
            hide([hungup, convert, acceptAudio, acceptVideo, mute, switcher]);
            show([video, audio]);
        },
        RingingMessage: function(message){
            // 对方接到视频指令，己方播放响铃
        },
        AcceptMessage: function(message){
            show([convert, mute, hungup]);
            hide([audio, video]);
        },
        MediaModifyMessage: function(message){
            // 音视频切换
        },
        otherMessage: function(message){
            console.log('other-message', message);
        }
    };
    return messageType in handler ? handler[messageType] : handler.otherMessage;
};
var callbacks = {
    getInstance : function(instance){
        //instance.sendMessage
        console.log("链接成功，可进行音视频通话测试！")
        hide([connectElement]);
        show([video, audio]);
        //call lib 部分代码
        var localWindow = $('#main')[0];
        var options = {
          container : {
            local: localWindow
          }
        };
        // 初始化 WebCallLib
        RongIMLib.RongCallLib.init(options);
        CallLib = RongIMLib.RongCallLib.getInstance();
    },
    getCurrentUser : function(userInfo){
        userId = userInfo.userId;
        console.log(userInfo.userId);
        console.log("链接成功；userid=" + userInfo.userId);
    },
    receiveNewMessage : function(message){
        console.log("收到新消息")
        console.log(message);
       if (message.offLineMessage){
            return;
        }
        var messageType = message.messageType;
        messageHandler(messageType)(message);
    }
};
function connect(){
    var appkey = appkeyElement.val();
    var token = tokenElement.val();
    targetId = targetIdElement.val();
    inviteUserId = targetId;
    // 初始化 WebSDK 
    var params = {
        appKey : appkey,
        token : token
    };
    if (!appkey) {
        alert('请填写 appkey');
        return;
    }
    if (!token) {
        alert('请填写自己的 token');
        return;
    }
    if (!targetId) {
        alert('请填写被邀请人的 userId');
        return;
    }
    init(params,callbacks);
}
var mediaVideo = RongIMLib.VoIPMediaType.MEDIA_VEDIO; //视频通话
var mediaAudio = RongIMLib.VoIPMediaType.MEDIA_AUDIO; //音频通话
var ErrorCode = RongIMLib.ErrorCode;
var conversationType = RongIMLib.ConversationType.PRIVATE;
//消息体中的附加信息,用于消息的扩展
var extras = ["extra content","{\"test\":1,\"b\":\"b\"}"];
var random = Math.ceil(Math.random()*1000000)%2;
var extra = extras[random]; 
/*
音视频流量问题，声网提供了具体数据：
时间单位每分钟：音频 40kbps,   SD 200-400 kbsp, HD  500-1000kbps HD+ >1000kpbs
*/ 
var startConversation = function(conversationType, targetId, inviteUserId, mediaType, extra){
    CallLib.startCall(conversationType, targetId, inviteUserId, mediaType, extra, {
      onSuccess:function(){
         show([hungup]);
         hide([video, audio]);
      },
      onError:function(err){
         console.log('startCall error', err);
      }
    });
};
// 发起视频通话
video.click(function(){
    startConversation(conversationType, targetId, [inviteUserId], mediaVideo, extra);
});
// 发起音频通话
audio.click(function(){
    startConversation(conversationType, targetId, [inviteUserId], mediaAudio, extra);
});
var switchVideoWindows = function(){
    var myScreen, otherScreen, canvas;
    if($("#main > div:first").attr('id') === undefined){
        myScreen = $("#main > div:first");
        otherScreen = $("#main > div:eq(1)");
    } else {
        myScreen = $("#main > div:eq(1)");
        otherScreen = $("#main > div:first");
    }
    myScreen.toggleClass('mainSmall');
    otherScreen.toggleClass('big');
}
// 音视频互转 TODO 功能未调通
var conversationItem = {
    method: 'videoToAudio',
    videoToAudio: function(btn){
        btn.val('音频转视频');
        this.method = 'audioToVideo';
    },
    audioToVideo: function(btn){
        btn.val('视频转音频');
        this.method = 'videoToAudio';
    }
};
convert.click(function(){
   var method = conversationItem.method;
   CallLib[method](conversationType, targetId, function(){
     conversationItem[method](convert);
   });
});
switcher.click(function(){
   switchVideoWindows();
});
// 静音、取消静音
var muteItem = {
    method:'mute',
    mute: function(btn){
        btn.val('取消静音');
        this.method = 'unmute';
    },
    unmute: function(btn){
        btn.val('静音');
        this.method = 'mute';
    }
};
mute.click(function(){
    var method = muteItem.method;
    CallLib[method](function(){
        muteItem[method](mute);
    });
});
// 接听视频
acceptVideo.click(function(){
    CallLib.joinCall(mediaVideo,{
       onSuccess:function(){
         show([mute, convert, switcher]);     
         hide([video, audio, acceptVideo]);   
       },
       onError:function(err){
         console.log("acceptVideo err ",err);
       }
    });
});
// 仅接听音频
acceptAudio.click(function(){
    CallLib.joinCall(mediaAudio,{
       onSuccess:function(){
         show([mute, convert, switcher]); 
         hide([video, audio, acceptAudio]);       
       },
       onError:function(err){
         console.log("acceptVideo err ",err);
       }
    });
});
// 挂断
hungup.click(function(){
    CallLib.hungupCall(conversationType,targetId, ErrorCode.HANGUP);
});
</script>  

</body>
</html>