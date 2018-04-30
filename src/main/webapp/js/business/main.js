// AnyChat for Web SDK

/********************************************
 *				业务逻辑控制				*
 *******************************************/

var mSelfUserId = -1;
var mTargetUserId = -1;
var roomUserList = []; // 房间内用户列表
var microphones = []; //本地麦克风对象列表
var speaks = []; //本地扬声器对象列表
var cameras = []; //本地摄像头对象列表

mRefreshVolumeTimer = -1; // 实时音量大小定时器

var mDefaultServerAddr = "demo.anychat.cn";
var mDefaultServerPort = 8906;
var mDefaultAppID = "";

var instance;

var blnCheckUnload = false; //刷新页面退出默认值

$(function() {
    //设置按钮
    $("#setting").on("click", function() {
        $("#setting_div").toggle();
    });

    $("#clusterSelect").change(function() {
        if($(this).val() == "0"){
            $("#password").parent().show();
            $("#AppGuid").parent().hide();
        } else {
            $("#password").parent().hide();
            $("#AppGuid").parent().show();
        }
    });

    //登录按钮
    $("#loginbtn").on("click", function() {
        var nickName = $("#username").val();
        var password = $("#password").val();
        var servereIp = $("#ServerAddr").val();
        var serverPort = parseInt($("#ServerPort").val());
        var appId = $("#AppGuid").val();

        // 初始化设置，包括插件初始化、连接、登录
        var initParams = {
            serverIp: servereIp, //服务器地址 （必填项）
            serverPort: serverPort, //端口号（必填项）
            nickName: nickName, //用户昵称（必填项）
            password: password,
            appId: appId, //应用ID
            sign: "", //签名字符串（签名登录时必填）
            timeStamp: "", //时间戳（签名登录时必填）
            onDisConnect: onDisConnect,
            onLogin: onLogin,
            roomOpt: roomOpt, //定义房间相关配置
            //fileOpt: fileOpt, //定义文件上传/下载相关配置
            //videoCallOpt: videoCallOpt, //定义视频呼叫相关配置

            // logOpt: logOpt, //定义日志存储相关配置( 不设该配置项，则插件日志默认保存在插件安装目录下)

            // receiveBuffer: onReceiveBuffer,
            
            // cameraOpt: cameraOpt //定义是否开启虚拟摄像头（该虚拟摄像头用于桌面共享）
        };
		
        if ($("#username").val() == '') {
            ForSession('请输入用户名！', true);
            $("#username").focus();
            return;
        }
		
       

        instance = AnyChatWebSDK.sdkInit(initParams);
        setLoginInfo();
        DisplayLoadingDiv(true);
    });

    //退出系统
    $("#ExitSystemBtn").on('click', function() {
        logout();
    })

    //进入自定义房间
    $("#EnterRoomBtn").on('click', function() {
        if ($("#customroomid").val() != "") {
            enterRoomRequest($("#customroomid").val());
        } else {
            ForSession('房间号不能为空！', true);
            $("#customroomid").val("");
            $("#customroomid").focus();
        }
    });

    //离开当前房间
    $("#leaveroom").on('click', function() {
        leaveRoomRequest();
        // var element = document.getElementById("ANYCHAT_VIDEO_LOCAL_0");
        // delete element.parentNode.removeChild(element);
    });

    //发送文本文字
    $("#SendMsg").on('click', function() {
        var msg = $("#MessageInput").val();
        if(msg != ""){
            sendMsg(msg);
        } else {
            ForSession('发送的消息不能为空！', true);
        }
    });

    //高级设置
    $('#advancedsetting').off().on('click', function() {
        $("#advanceset_div").show();
        $("#LOADING_GREY_DIV").show();
        $("#advanceset_div").append("<iframe frameborder=0 scrolling=no style=\"background-color:transparent; position: absolute; z-index: -1; width: 100%; height: 100%; top: 0;left:0;\"></iframe>");
        InitAdvanced();
    });

    $("#advanceset_div_close").on('click', function() {
        $("#advanceset_div").hide();
        $("#LOADING_GREY_DIV").hide();
    });

    if($("#clusterSelect").val() == "0"){
		$("#password").parent().show();
        $("#AppGuid").parent().hide();
	}

    getLoginInfo();
});

//在sdk初始化配置项中注册需要的房间管理相关事件
var roomOpt = {
    //用户进出房间通知事件
	onRoomUserInAndOut: onAnyChatUserAtRoom,

	//房间用户数变化通知事件
	onRoomUserChanged: onAnyChatRoomOnlineUser,

	onRoomUserMsgReceived: onAnyChatUserMsgAtRoom
};

// 摄像头设置，设置是否开启桌面共享虚拟摄像头
var cameraOpt = {
    openInventCamera: 1 //0为不开启，1为开启；虚拟摄像头用于桌面共享时捕获桌面画面
};

//用户状态标识
var stateKeyword = {
    camera: 1, // 用户摄像头状态（参数为dword型）
    holdmic: 2, // 用户音频设备状态（参数为dword型，返回值：0 音频采集关闭， 1 音频采集开启）
    speakVolume: 3, // 用户当前说话音量（参数为double类型（0.0 ~ 100.0））
    recording: 4, // 用户录像（音）状态（参数为dword型）
    level: 5, // 用户级别（参数为dword型）
    nickname: 6, // 用户昵称（参数为字符串tchar类型）
    localIp: 7, // 用户本地ip地址（内网，参数为字符串tchar类型）
    internetIp: 8, // 用户互联网ip地址（参数为字符串tchar类型）
    p2pConnect: 11, // 查询本地用户与指定用户的当前p2p连接状态（参数为dword类型，返回值：0 p2p不通， 1 p2p连接成功[tcp]，2 p2p连接成功[udp]，3 p2p连接成功[tcp、udp]）
    networkStatus: 12 // 查询指定用户的网络状态（参数为DWORD类型，返回值：0 优良，1 较好，2 一般，3 较差，4 非常差），注：查询间隔需要>1s
};

//获取用户摄像头状态
function getUserCameraState(userid) {
    var state = instance.getUserState({
        userId: userid,
        infoName: stateKeyword.camera
    });
    return state;
}

//获取本地内网地址
function getLocalIp() {
    var mLocalIp = instance.getUserState({
        userId: mSelfUserId,
        infoName: stateKeyword.localIp
    });
    return mLocalIp;
}

//获取用户级别
function getUserLevel(userid) {
    var userLevel = instance.getUserState({
        userId: userid,
        infoName: stateKeyword.level
    });
    return userLevel;
}

function getUserAudioVolume(userid) {
    var audioVolume = instance.getUserState({
        userId: userid,
        infoName: stateKeyword.speakVolume
    });
    return audioVolume;
}

// 请求进入指定的房间
function enterRoomRequest(roomId) {
    instance.enterRoom({
        roomId: roomId,
        done: onAnyChatEnterRoom
    });
    DisplayLoadingDiv(true);
}

// 获取当前房间人数
function getRoomUserNum() {
    var list = instance.getRoomUsers();
    console.log(list);
    return list;
}

// 退出当前房间
function leaveRoomRequest() {
    clearInterval(mRefreshVolumeTimer);
    var errorCode = instance.leaveRoom();
    if (errorCode == 0) {
        closeCamera(0);
        closeMicrophone(0);
        cancelRemoteVideo(mTargetUserId);
        cancelRemoteAudio(mTargetUserId);
        ShowRoomDiv(false); // 隐藏房间界面
        ShowHallDiv(true); // 显示大厅界面
        mTargetUserId = -1;
    }
}

//登出
function logout() {
    var errorCode = instance.logout();
    if (errorCode == 0) {
        clearInterval(mRefreshVolumeTimer);
        blnCheckUnload = false;
        ShowHallDiv(false);
        ShowLoginDiv(true);
    }
}

// 发送文字消息
function sendMsg(msg) {
    var targetList = Object.create(roomUserList);
    var params = {};
    params.msg = msg;
    if (targetList.length > 0) {
        // params.targetUsers = targetList; //接收者列表, 此参数不设置时,默认为群聊,房间中的所有人都能收到
    }

    instance.sendMsg(params);

    DisplayTextMessage(mSelfUserId, msg);
    $("#MessageInput").val("");
    $("#MessageInput").focus();
}

function getLocalMicrophones() {
    return instance.getMicrophones(); //返回麦克风对象列表
}

function getLocalSpeaks() {
    return instance.getSpeaks(); //返回扬声器对象列表
}

function openMicrophone(index) {
    var errorCode = microphones[index].open();
    if (errorCode == 0) {
        console.log("打开" + index + "号音频成功");
    }
}

function closeMicrophone(index) {
    var errorCode = microphones[index].close();
    if (errorCode == 0) {
        console.log("关闭" + index + "号音频成功");
    } else {
        console.log("关闭麦克风失败，错误码：" + errorCode);
    }
}

function settingMicrophone(index) {
    //麦克风属性设置
    microphones[index].config({
        vadctrl: 1, // 音频静音检测控制
        nsctrl: 1, // 音频噪音抑制控制
        echoctrl: 1, // 音频回音消除控制
        agcctrl: 1, // 音频自动增益控制
        capturemode: 0 // 音频采集模式设置（参数为：int型：0 发言模式，1 放歌模式，2 卡拉OK模式，3 线路输入模式）
    });
}

//获取本地摄像头
function getLocalCameras() {
    return instance.getCameras();
}

function openCamera(index) {
    if (cameras[index].isOpen) {
        alert("当前设备已经打开");
        return;
    }
    var errorCode = cameras[index].open({
        id: "AnyChatLocalVideoDiv", // 此id是视频div容器的id
        streamIndex: cameras[index].streamIndex
    });
    if (errorCode == 0) {
        console.log("打开" + index + "号摄像头成功");
    }
}

function closeCamera(index) {
    var errorCode = cameras[index].close();
    if (errorCode == 0) {
        console.log("关闭" + index + "号摄像头成功");
    }
}

function settingCamera(index) {
    //摄像头属性设置
    cameras[index].config({
        //                isSelect:xxxx,  // 选择摄像头
        bitRate: 300000, // 视频编码码率设置（参数为int型，单位bps，同服务器配置：VideoBitrate）
        quality: 3, // 视频编码质量因子控制（参数为int型，同服务器配置：VideoQuality）
        gop: 30, // 视频编码关键帧间隔控制（参数为int型，同服务器配置：VideoGOPSize）
        width: 640, // 设置本地视频采集分辨率(宽度)
        height: 480, // 设置本地视频采集分辨率(高度)
        fps: 15, // 设置本地视频编码的帧率
        preset: 3 // 设置视频编码预设参数（值越大，编码质量越高，占用CPU资源也会越高）
    });
}

//接收对方音频流
function getRemoteAudio(targetId) {
    var errorCode = instance.getRemoteAudioStream({
        remoteUserId: targetId
    });
    if (errorCode == 0) {
        console.log("接收对方音频流成功");
        $("#" + targetId + "_MicrophoneTag").attr('src',"./images/microphone_true.png"); 
    }
}


//终止对方音频流
function cancelRemoteAudio(targetId) {
    var errorCode = instance.cancelRemoteAudioStream({
        remoteUserId: targetId
    });
    if (errorCode == 0) {
        console.log("终止对方音频流成功");
        $("#" + targetId + "_MicrophoneTag").attr('src',"./images/microphone_false.png");
    }
}

//接收对方视频流，并在页面上显示
function getRemoteVideo(targetId) {
    var streamIndex = 0;

    var errorCode = instance.getRemoteVideoStream({
        remoteUserId: targetId,
        streamIndex: streamIndex,
        renderId: "AnyChatRemoteVideoDiv"
    });
    if (errorCode == 0) {
        console.log("接收" + targetId + "视频成功");
    } else {
        console.log("接收" + targetId + "视频失败，错误码：" + errorCode);
    }

}

//终止对方视频流
function cancelRemoteVideo(targetId) {
    var streamIndex = 0;
    var errorCode = instance.cancelRemoteVideoStream({
        remoteUserId: targetId,
        streamIndex: streamIndex
    });
    $("#AnyChatRemoteVideoDiv").html("");
    console.log("终止" + targetId + "视频");
}

function GetID(id) {
    if (document.getElementById) {
        return document.getElementById(id);
    } else if (window[id]) {
        return window[id];
    }
    return null;
}

//计算高度并设置界面位置
function SetDivTop(id, TheHeight) {
    var BodyHeight = document.documentElement.clientHeight; //获得浏览器可见区域高度
    if (TheHeight < BodyHeight) { //div高度小于可见区域高度
        GetID("margintop").style.height = (BodyHeight - TheHeight) / 4 + "px";
        $("#margintop").attr("height", (BodyHeight - TheHeight) / 4 + "px");
        $("#" + id).attr("marginTop", "0px");
    }
}

//刷新页面退出系统
window.onbeforeunload = function checkLeave(e) {
    if (blnCheckUnload) {
        blnCheckUnload = false;
        logout();
        ShowHallDiv(false);
        ShowRoomDiv(false);
        ShowLoginDiv(true);
    }
};

// 显示等待进度条，提示用户操作正在进行中
function DisplayLoadingDiv(bShow) {
    if (bShow) {
        $("#LOADING_DIV").show();
        $("#LOADING_GREY_DIV").show();
        var TheHeight = document.documentElement.clientHeight;
        var TheWidth = document.body.offsetWidth;
        $("#LOADING_DIV").css("marginTop", (TheHeight - 50) / 2 + "px");
        $("#LOADING_DIV").css("marginLeft", (TheWidth - 130) / 2 + "px");
    } else {
        $("#LOADING_DIV").hide();
        $("#LOADING_GREY_DIV").hide();
    }
}

// 显示登录界面
function ShowLoginDiv(bShow) {
    if (bShow) {
        $("#login_div").show(); //显示登录界面
        $("#username").focus();
        SetDivTop("login_div", 195); //登录界面垂直居中
        var serverIP = getCookie("ServerAddr");
        var serverPort = getCookie("ServerPort");
        $("#ServerAddr").val((typeof serverIP != "undefined" && serverIP != null) ? serverIP : mDefaultServerAddr);
        $("#ServerPort").val((typeof serverPort != "undefined" && serverPort != null) ? serverPort : mDefaultServerPort);
    } else {

    }
}

// 显示大厅界面
function ShowHallDiv(bShow) {
    if (bShow) {
        $("#room_div_userlist").html(""); //清空房间界面好友列表
        $("#login_div").hide(); //隐藏登录界面
        $("#hall_div").show(); //显示大厅界面
        $("#customroomid").val("");
        SetDivTop("hall_div", 400); //大厅界面垂直居中
        $("#customroomid").focus();
        $("#a_error_user").attr("color", "#FAFADD");

        $("#hall_div_td_name").html(instance.getUserName({userId:mSelfUserId}));
        $("#hall_div_td_id").html(mSelfUserId);
        $("#hall_div_td_level").html(getUserLevel(mSelfUserId));
        $("#hall_div_td_ip").html(getLocalIp());
    } else {
        $("#hall_div").hide();
    }
}

// 显示房间界面
function ShowRoomDiv(bShow) {
    if (bShow) {
        $("#hall_div").hide(); //隐藏大厅界面
        $("#room_div").show(); //显示房间界面
        SetDivTop("room_div", 540); //房间界面垂直居中
        $("#MessageInput").focus();
    } else {
        $("#advanceset_div").hide(); //隐藏高级设置界面
        $("#ReceiveMsgDiv").html(""); //清空房间界面信息接收框
        $("#room_div").hide(); //隐藏房间界面
    }
}

// 对列表中的用户进行添加、删除操作
function RoomUserListControl(userid, bInsert) {
    var userlist = $("#room_div_userlist")[0];
    if (bInsert) {
        var itemdiv = document.createElement("div");
        itemdiv.setAttribute("class", "UserListStyle");
        itemdiv.id = userid + "_UserDiv";


        // 判断当前ID是否为自己
        if (userid == mSelfUserId) {
            AddImage(itemdiv, userid + "_faceTag", "faceTag", "./images/icon_face.png", userid); // 添加用户头像<img>标签
            itemdiv.innerHTML += "<span class='longUserNameSpan'>" + instance.getUserName({userId:mSelfUserId}) + "(自己)</span>";
            AddImage(itemdiv, mSelfUserId + "_MicrophoneTag", "mSelfMicrophoneTag", "./images/microphone_true.png", userid); // 添加话筒图片<img>标签
        } else {
            AddImage(itemdiv, userid + "_faceTag", "faceTag", "./images/icon_face.png", userid); // 添加用户头像<img>标签
            // 添加用户姓名<a>标签
            var a = document.createElement("a");
            a.className = "longUserNameSpan";
            a.id = userid + "_UserTag";
            a.title = userid;
            a.innerHTML = instance.getUserName({userId: userid});
            //a.href = "javascript:RequestOtherUserVideo('" + userid + "')";
			a.setAttribute('onclick',"RequestOtherUserVideo('"+userid+"')");
            itemdiv.appendChild(a);
            AddImage(itemdiv, userid + "_MicrophoneTag", "MicrophoneTag", "./images/microphone_false.png", userid); // 添加话筒图片<img>标签
        }
        // 判断用户摄像头状态
        if (getUserCameraState(userid) == 0)
            AddImage(itemdiv, userid + "_CameraTag", "CameraTag", "./images/camera_false.png", userid); // 添加摄像头图片<img>标签
        if (getUserCameraState(userid) == 1)
            AddImage(itemdiv, userid + "_CameraTag", "CameraTag", "./images/camera_false.png", userid); // 添加摄像头图片<img>标签
        if (getUserCameraState(userid) == 2)
            AddImage(itemdiv, userid + "_CameraTag", "CameraTag", "./images/camera_true.png", userid); // 添加摄像头图片<img>标签

        userlist.appendChild(itemdiv);
        MicrophoneOnclick(userid);
    } else {
        var my = $("#" + userid + "_UserDiv")[0];
        userlist.removeChild(my);
    }
    DisplayScroll("room_div_userlist");
}

// 打开指定用户的音视频
function RequestOtherUserVideo(userid) {
    var userlist = document.getElementById("room_div_userlist");
	// $("#AnyChatRemoteVideoDiv").empty();
    // 获得用户列表中所有<a>标签
    var userdivobj = userlist.getElementsByTagName("div");
    for (var i = 0; i < userdivobj.length; i++) {
        userdivobj[i].style.backgroundColor = "White";
    }
    // 获取用户列表中所有<img>标签
    var userimgobj = userlist.getElementsByTagName("img");
    for (var j = 0; j < userimgobj.length; j++) {
        if (userimgobj[j].getAttribute("class") == "MicrophoneTag") { // 该图片为 话筒 图片
            userimgobj[j].src = "./images/microphone_false.png";
            userimgobj[j].onclick = ""; // 删除话筒按钮点击事件
            userimgobj[j].style.cursor = "";
        }
    }
    // 判断是否需要关闭之前已请求的用户音视频数据
    if (mTargetUserId != -1) {
        reVideoDivSize();
        cancelRemoteVideo(mTargetUserId);
        cancelRemoteAudio(mTargetUserId);
    }
    $("#" + userid + "_MicrophoneTag").attr('src',"./images/microphone_true.png") ; // 点亮话筒图片
    $("#" + userid + "_UserDiv").css('backgroundColor',"#E4F5FC"); //设置被点击<a>元素的字体颜色

    mTargetUserId = userid; //设置被点用户ID为全局变量
    getRemoteVideo(userid); //请求对方视频
    getRemoteAudio(userid); //请求对方语音
    MicrophoneOnclick(userid); // 为当前视频会话用户话筒按钮添加点击事件
}

//恢复显示视频div大小
function reVideoDivSize() {
    var divWidth = $("#AnyChatRemoteVideoDiv")[0].offsetWidth;
    var divHeight = $("#AnyChatRemoteVideoDiv")[0].offsetHeight;
    if (divWidth < divHeight) {
        $("#AnyChatRemoteVideoDiv").width(4.0 / 3 * divHeight);
        $("#AnyChatRemoteVideoDiv").height(divHeight);
    }
}

//好友 摄像头  话筒  图标
function AddImage(parent_id, img_id, img_class, fir_img, userid) {
    var imgs = document.createElement("img");
    imgs.id = img_id;
    imgs.className = img_class;
    imgs.src = fir_img;
    parent_id.appendChild(imgs);
}

// 为被点击用户话筒按钮添加点击事件
function MicrophoneOnclick(userid) {
    $("#" + userid + "_MicrophoneTag").css("cursor", "pointer"); //鼠标形状
    $("#" + userid + "_MicrophoneTag").off().on('click', function() {
        var ImgPath = $("#" + userid + "_MicrophoneTag")[0].src.split('/');
        if (ImgPath[ImgPath.length - 1] == "microphone_true.png") {
            $("#" + userid + "_MicrophoneTag").attr("src", "./images/microphone_false.png");
            if (userid == mSelfUserId) closeMicrophone(0);
            else cancelRemoteAudio(userid);
        } else {
            $("#" + userid + "_MicrophoneTag").attr("src", "./images/microphone_true.png");
            if (userid == mSelfUserId) openMicrophone(0);
            else getRemoteAudio(userid);
        }
    });
}

// 显示文字消息
function DisplayTextMessage(fromuserid, message) {
    var namestr = instance.getUserName({userId:fromuserid}) + "&nbsp" + GetTheTime() + "：&nbsp&nbsp";
    if (fromuserid == mSelfUserId)
		namestr = '<span class="msg-sender from-me">'+namestr +'</span>';
    else
        namestr = '<span class="msg-sender from-others">'+namestr +'</span>';
		
    message = '<span class="msg-content">'+ message +'</span>';

    var msgdiv = document.createElement("div");
    msgdiv.setAttribute("class", "TheMsgStyle");
    msgdiv.innerHTML = namestr +  message;
    $("#ReceiveMsgDiv")[0].appendChild(msgdiv);
    DisplayScroll("ReceiveMsgDiv");
}

//系统信息框滚动条显隐
function DisplayScroll(id) {
    var offset = $("#" + id)[0]; //需要检测的div
    if (offset.offsetHeight < offset.scrollHeight) { //div可见高度小于div滚动条高度
        offset.style.overflowY = "scroll"; //显示滚动条
        offset.scrollTop = offset.scrollHeight; //滚动条自动滚动到底部
    } else
        offset.style.overflowY = "hidden"; //隐藏滚动条
}

//获取当前时间  (00:00:00)
function GetTheTime() {
    var TheTime = new Date();
    return TheTime.toLocaleTimeString();
}

//设置登录信息，包括用户名、服务器IP、服务器端口、应用ID
function setLoginInfo() {
    setCookie('username', $("#username").val(), 30);
    setCookie('ServerAddr', $("#ServerAddr").val(), 30);
    setCookie('ServerPort', $("#ServerPort").val(), 30);
    setCookie('AppGuid', $("#AppGuid").val(), 30);
}

//设置cookie
function setCookie(c_name, value, expiredays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + expiredays);
    document.cookie = c_name + "=" + value + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
}

//获取登录信息
function getLoginInfo() {
    $("#username").val(getCookie("username"));
    var serverIP = getCookie("ServerAddr");
    if (serverIP != "")
        $("#ServerAddr").val(serverIP);
    else
        $("#ServerAddr").val(mDefaultServerAddr);
    var serverPort = getCookie("ServerPort");
    if (serverPort != "")
        $("#ServerPort").val(serverPort);
    else
        $("#ServerPort").val(mDefaultServerPort);

    var appID = getCookie("AppGuid");
    if (appID != "")
        $("#AppGuid").val(appID);
    else
        $("#AppGuid").val(mDefaultAppID);
}

//获取cookie项的cookie值
function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) c_end = document.cookie.length;
            return document.cookie.substring(c_start, c_end);
        }
    }
    return "";
}

//会话提示信息
function ForSession(message, status) {
    $.messager.popup(message);
}