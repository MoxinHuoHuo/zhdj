//视频参数界面下拉框
var videoDeviceName = "未获取到";
var audioDeviceName = "未获取到";
var speakerDeviceName = "未获取到";

var videoDeviceNameArray = [];

var code_rate_txt = ["质量模式", "40Kbps", "60Kbps", "100Kbps", "150Kbps", "200Kbps", "300Kbps", "400Kbps", "500Kbps", "600Kbps", "800Kbps", "1000Kbps", "1200Kbps", "1500Kbps"]; // 码率下拉框
var quality_txt = ["普通视频质量", "中等视频质量", "较好视频质量"]; // 质量下拉框
var resolution_txt = ["176x144", "320x240", "352x288", "640x480", "720x480", "720x576", "800x600", "960x720", "1024x576", "1280x720", "1280x1024", "1920x1080"]; // 分辨率下拉框
var frame_rate_txt = ["5 FPS", "8 FPS", "12 FPS", "15 FPS", "20 FPS", "25 FPS", "30 FPS"]; // 帧率下拉框
var preinstall_txt = ["1", "2", "3", "4", "5"]; // 预设下拉框
var speakmode_txt = ["发言模式(默认)", "放歌模式", "卡拉OK模式", "线路输入模式"]; // 音频模式下拉框
var videoshow_clipmode_txt = ["默认模式", "重叠模式", "缩小模式", "平铺模式", "动态模式"]; // 视频显示裁剪模式下拉框

var bitrate_combo_value = [0, 40000, 60000, 100000, 150000, 200000, 300000, 400000, 500000, 600000, 800000, 1000000, 1200000, 1500000]; // 码率值
var quality_combo_value = [2, 3, 4]; // 质量因子值
var framerate_combo_value = [5, 8, 12, 15, 20, 25, 30]; // 帧率值
var videopreset_combo_value = [1, 2, 3, 4, 5]; // 预设参数值
var speakmode_combo_value = [0, 1, 2, 3]; // 音频模式值
var videoshow_clipmode_value = [0, 1, 2, 3, 4]; // 视频显示裁剪模式值

var mVideoWidthValue = 320;
var mVideoHeightValue = 240;
var mBitRateValue = 90000;
var mFrameRateValue = 12;
var mVideoQualityValue = 3;
var mVideoPresetValue = 3;

//填充下拉框值
function filltheselect(id, txtArray, valueArray) {
    $("#" + id)[0].options.length = 0;
    for (var j = 0; j < txtArray.length; j++) {
        var option = document.createElement("option");
        option.value = valueArray[j];
        option.text = txtArray[j];
        $("#" + id)[0].appendChild(option);
    }
}

// 初始化高级设置界面所有控件 进行赋值
function InitAdvanced() {
    for(c in cameras){
        videoDeviceNameArray[c] = cameras[c].deviceName;
    }
    videoDeviceName = cameras[0].deviceName;
    audioDeviceName = microphones[0].deviceName;
    speakerDeviceName = speaks[0].deviceName;
    // $("#DeviceType_VideoCapture").val(videoDeviceName);
    $("#DeviceType_AudioCapture").val(audioDeviceName);
    $("#DeviceType_AudioPlayBack").val(speakerDeviceName);
    filltheselect("DeviceType_VideoCapture", videoDeviceNameArray, videoDeviceNameArray);
    filltheselect("code_rate", code_rate_txt, bitrate_combo_value); // 填充码率下拉框
    filltheselect("distinguishability", resolution_txt, resolution_txt); // 填充分辨率下拉框
    filltheselect("frame_rate", frame_rate_txt, framerate_combo_value); // 填充帧率下拉框
    filltheselect("Speak_Mode", speakmode_txt, speakmode_combo_value); // 发言模式下拉框
    filltheselect("videoshow_clipmode", videoshow_clipmode_txt, videoshow_clipmode_value); // 视频显示裁剪模式下拉框值
    SetThePos();
    initControlSelected();
}

// 音视频设备 按钮划入效果
function selectSettingMenu(id, dd) {
    // 隐藏所有参数界面
    $("#Device_Interface").hide();
    $("#Video_Parameter_Interface").hide();
    $("#Sound_Parameter_Interface").hide();
    $("#Other_Parameter_Interface").hide();

    // 获得四个按钮  重新初始化
    var btn = $("#advanceset_div_Div_Btn")[0].getElementsByTagName("a");
    for (var i = 0; i < btn.length; i++) {
        btn[i].className = "Btn_Div";; // 设置按钮颜色
        btn[i].setAttribute("clickstate", "false"); // 设置按钮点击状态为未点击
    }
    $("#" + dd).attr("clickstate", "true"); // 设置被点击的按钮状态为被点击
    $("#" + dd)[0].className = "Btn_sel"; // 设置按钮背景色
    $("#" + id).show(); // 显示按钮对应的参数界面
}

// 设置 高级设置界面 x坐标
function SetThePos() {
    var TheBodyWidth = document.body.offsetWidth;
    $("#advanceset_div").css("marginLeft", (TheBodyWidth - 540) / 2 + "px");
}

// 获取当前参数值
function initControlSelected() {
    mVideoWidthValue = instance.getSDKOptionInt(BRAC_SO_LOCALVIDEO_WIDTHCTRL);
    mVideoHeightValue = instance.getSDKOptionInt(BRAC_SO_LOCALVIDEO_HEIGHTCTRL);
    mBitRateValue = instance.getSDKOptionInt(BRAC_SO_LOCALVIDEO_BITRATECTRL);
    mFrameRateValue = instance.getSDKOptionInt(BRAC_SO_LOCALVIDEO_FPSCTRL);
    GetIndex("code_rate", bitrate_combo_value, mBitRateValue, "combobox"); // 当前使用的码率参数
    GetIndex("distinguishability", resolution_txt, mVideoWidthValue + "x" + mVideoHeightValue, "combobox"); // 当前使用的的分辨率
    GetIndex("frame_rate", framerate_combo_value, mFrameRateValue, "combobox"); // 当前使用的的帧率参数
    GetIndex("Speak_Mode", speakmode_combo_value, instance.getSDKOptionInt(BRAC_SO_AUDIO_CAPTUREMODE), "combobox"); // 当前使用的音频播放模式
    GetIndex("videoshow_clipmode", videoshow_clipmode_value, instance.getSDKOptionInt(BRAC_SO_VIDEOSHOW_CLIPMODE), "combobox"); // 当前使用的视频显示裁剪模式

    GetIndex("audio_vadctrl", null, instance.getSDKOptionInt(BRAC_SO_AUDIO_VADCTRL), "checkbox"); // 当前使用的静音检测
    GetIndex("audio_echoctrl", null, instance.getSDKOptionInt(BRAC_SO_AUDIO_ECHOCTRL), "checkbox"); // 当前使用的回音消除
    GetIndex("audio_nsctrl", null, instance.getSDKOptionInt(BRAC_SO_AUDIO_NSCTRL), "checkbox"); // 当前使用的噪音抑制
    GetIndex("audio_agcctrl", null, instance.getSDKOptionInt(BRAC_SO_AUDIO_AGCCTRL), "checkbox"); // 当前使用的自动增益
    GetIndex("Checkbox_P2P", null, instance.getSDKOptionInt(BRAC_SO_NETWORK_P2PPOLITIC), "checkbox"); // P2P
    $("#current_resolution").html(instance.getSDKOptionInt(BRAC_SO_LOCALVIDEO_WIDTHCTRL) + "x" + instance.getSDKOptionInt(BRAC_SO_LOCALVIDEO_HEIGHTCTRL));
}

// 下拉框事件
function GetTheValue(id) {
    var value = GetID(id).options[GetID(id).selectedIndex].value;
    var mSelectIndex = GetID(id).selectedIndex;
    switch (id) {
        case "DeviceType_VideoCapture":
            // BRAC_SelectVideoCapture(BRAC_DEVICE_VIDEOCAPTURE, value);
            instance.selectVideoCapture({
                deviceName: cameras[mSelectIndex].deviceName
            });
            break;
        case "quality": // 质量
            mVideoQualityValue = parseInt(value);
            break;
        case "code_rate": // 码率
            mBitRateValue = parseInt(value);
            break;
        case "distinguishability": // 分辨率
            var resolution = value.split('x');
            mVideoWidthValue = parseInt(resolution[0]);
            mVideoHeightValue = parseInt(resolution[1]);
            break;
        case "frame_rate": // 帧率
            mFrameRateValue = parseInt(value);
            break;
        case "preinstall": // 预设
            mVideoPresetValue = parseInt(value);
            break;
        case "Speak_Mode": // 音频播放模式
            microphones[0].config({ capturemode: parseInt(value) });
            break;
        case "videoshow_clipmode": //视频显示裁剪模式
            instance.setSDKOption({ remoteVideoMode: parseInt(value) });
            break;
    }
}

// 设置控件初始值
function GetIndex(control_id, valueArray, value, type) {
    if (type == "combobox") { // 下拉框
        var valueIndex = 0;
        for (var i = 0; i < valueArray.length; i++) {
            if (value == valueArray[i]) {
                valueIndex = i;
                break;
            }
        }
        GetID(control_id).selectedIndex = valueIndex;
    } else { // 复选框
        if (value == 1) // 1为打开 
            GetID(control_id).checked = true;
        else
            GetID(control_id).checked = false;
    }
}

//  复选框事件
function ChangeTheResult(id) {
    switch (id) {
        case "ServerSetting": // 服务器配置参数按钮
            var GetAControl = GetID("advanceset_div_Tab").getElementsByTagName("label");
            var SelectTag = GetID("Video_Parameter_Interface").getElementsByTagName("select"); // 取得 音频参数设置 界面 所有select标签
            if (GetID("ServerSetting").checked == true) { // 标签点击事件
                // instance.setSDKOption({applyParam: 0});
                for (var i = 0; i < SelectTag.length; i++) { // 循环标签
                    SelectTag[i].disabled = "disabled";
                }
                for (var j = 0; j < GetAControl.length; j++) {
                    GetAControl[j].style.color = "#999999";
                }
                // initControlSelected();
            } else {
                for (var i = 0; i < SelectTag.length; i++)
                    SelectTag[i].disabled = "";
                for (var j = 0; j < GetAControl.length; j++)
                    GetAControl[j].style.color = "Black";
            }
            break;
        case "Checkbox_P2P":
            if (GetID(id).checked == true)
                instance.setSDKOption({ P2PPolitic: 1 });
            else
                instance.setSDKOption({ P2PPolitic: 0 });
            break;
        case "audio_vadctrl": // 静音检测
            if (GetID(id).checked == true)
                microphones[0].config({ vadctrl: 1 });
            else
                microphones[0].config({ vadctrl: 0 });
            break;
        case "audio_echoctrl": // 回音消除
            if (GetID(id).checked == true)
                microphones[0].config({ echoctrl: 1 });
            else
                microphones[0].config({ echoctrl: 0 });
            break;
        case "audio_nsctrl": // 噪音抑制
            if (GetID(id).checked == true)
                microphones[0].config({ nsctrl: 1 });
            else
                microphones[0].config({ nsctrl: 0 });
            break;
        case "audio_agcctrl": // 自动增益
            if (GetID(id).checked == true)
                microphones[0].config({ agcctrl: 1 });
            else
                microphones[0].config({ agcctrl: 0 });
            break;
    }
}

// 应用设置
function BtnApply() {
    cameras[0].config({
        bitRate: mBitRateValue, // 视频编码码率设置（参数为int型，单位bps，同服务器配置：VideoBitrate）
        gop: mFrameRateValue * 4, // 视频编码关键帧间隔控制（参数为int型，同服务器配置：VideoGOPSize）
        width: mVideoWidthValue, // 设置本地视频采集分辨率(宽度)
        height: mVideoHeightValue, // 设置本地视频采集分辨率(高度)
        fps: mFrameRateValue, // 设置本地视频编码的帧率
    });
    setTimeout(initControlSelected, 500);
}