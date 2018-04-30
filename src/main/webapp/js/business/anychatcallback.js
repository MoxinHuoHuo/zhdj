// AnyChat for Web SDK

/********************************************
 *				事件回调部分				*
 *******************************************/

// 初始化配置--连接断开事件
function onDisConnect(result) {
    if (result.code == 0) {
        console.log("退出成功！");
    } else {
        // leaveRoomRequest(-1);
        logout();
        reVideoDivSize();
        ShowHallDiv(false);
        ShowRoomDiv(false);
        DisplayLoadingDiv(false);
        ShowLoginDiv(true);
        console.log("出错，错误码：" + result.code);
        $.messager.alert("提示","连接出错，"+result.msg);
    }
}

// 初始化配置--登录事件
function onLogin(data) {
    DisplayLoadingDiv(false);
    console.log("登录成功！用户Id为：" + data.userId);
    mSelfUserId = data.userId;
    ShowHallDiv(true);
    blnCheckUnload = true;
}

function onAnyChatUserAtRoom(data) {
    console.log("OnAnyChatUserAtRoom: ");
    console.log(data);
    RoomUserListControl(data.userId, data.action);
    if (data.action == 1) {
        if (mTargetUserId == -1) {
            mTargetUserId = data.userId;
            getRemoteVideo(mTargetUserId);
            getRemoteAudio(mTargetUserId);
        }
    } else {
        if (mTargetUserId == data.userId) {
            cancelRemoteAudio(data.userId);
            cancelRemoteVideo(data.userId);
            var list = getRoomUserNum();
            if (list && list.length > 1) {
                // getRemoteVideo(list.userList[0]);
                mTargetUserId = list[0];
                RequestOtherUserVideo(mTargetUserId);
                    // for (var i = 0; i < list.userList.length - 1; i++) {
                    //     RoomUserListControl(list.userList[i], true);
                    // }
            } else {
                $("#AnyChatRemoteVideoDiv").html("");
                mTargetUserId = -1;
            }
        }
    }

}

function onAnyChatRoomOnlineUser(data) {
    console.log("OnAnyChatRoomOnlineUser: ");
    console.log(data);
}

//进入房间结果通知
function onAnyChatEnterRoom(result, data) {
    DisplayLoadingDiv(false);
    if (result.code == 0) {
        mCurrentRoomId = data.roomId;
        ShowRoomDiv(true);
        cameras = getLocalCameras();
        microphones = getLocalMicrophones();
        speaks = getLocalSpeaks();
        openCamera(0);
        openMicrophone(0);
        RoomUserListControl(mSelfUserId, true);
        var list = getRoomUserNum();
        if (list && list.length > 1) {
            for (var i = 0; i < list.length - 1; i++) {
                RoomUserListControl(list[i], true);
            }
            mTargetUserId = list[0];
            getRemoteVideo(mTargetUserId);
            getRemoteAudio(mTargetUserId);
        }
        mRefreshVolumeTimer = setInterval(function() {
            var myVolume = $("#AnyChatLocalVideoDiv")[0].offsetHeight * getUserAudioVolume(mSelfUserId) / 100;
            $("#LocalAudioVolume").width(myVolume);
            if (mTargetUserId != -1) {
                var otherVolume = $("#AnyChatRemoteVideoDiv")[0].offsetHeight * getUserAudioVolume(mTargetUserId) / 100;
                $("#RemoteAudioVolume").width(otherVolume);
            } else
                $("#RemoteAudioVolume").width(0);
        }, 100);

    } else {
        console.log("进入房间失败，错误码：" + result.code);
    }
}

//退出房间结果通知
function onAnyChatLeaveRoom(result, data) {
    console.log("onAnyChatLeaveRoom result: ");
    console.log(result);
    console.log("onAnyChatLeaveRoom data: ");
    console.log(data);
    if (result.code == 0) {
        closeCamera(0);
        closeMicrophone(0);
        ShowRoomDiv(false); // 隐藏房间界面
        ShowHallDiv(true); // 显示大厅界面
        mTargetUserId = -1;
    }
}

//房间内文字消息通知事件
function onAnyChatUserMsgAtRoom(event) {
    console.log("userid: " + event.userId + " msg: " + event.msg);
    if (event.msg)
        DisplayTextMessage(event.userId, event.msg);
}