<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>未通过审核报告</title>
<meta charset="utf-8">
<meta http-equiv="description" content="查看报告">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/web/js/webuploader.css" />
<link rel="stylesheet" href="http://xwh511.cc:8090/wechat/wechat-icon/iconfont.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.videojs.css" />
<style type="text/css">
html,body {
	overflow: hidden;
	overflow-y: auto;
}
/* 视频播放区按钮部分样式覆盖重写 */
.vjs-amazeui .vjs-big-play-button:before {
	font-size: 50px;
	margin-top: -7%;
	margin-left: -5%;
}
/* 视频区音量条一栏样式重写覆盖 */
.vjs-amazeui .vjs-mute-control, .vjs-amazeui .vjs-volume-menu-button {
	bottom: 60px;
	right: 95px;
}
.vjs-amazeui .vjs-control {
	top: 6px;
}
.vjs-amazeui .vjs-progress-control {
	top: 0px;
}
.vjs-amazeui .vjs-mute-control, .vjs-amazeui .vjs-volume-menu-button {
	top: -54px;
}
.vjs-time-divider {
	line-height: 6em;
}
</style>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default"
		style="height: 50px;">
		<div class="am-header-left am-header-nav">
			<a href="#left-link" class=""> <img class="am-header-icon-custom"
				src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
				alt="" />
			</a>
		</div>

		<h1 class="am-header-title">报告详情</h1>

	</header>

	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default"
		style="margin-top: 10px;">
		<h2 class="am-titlebar-title ">报告信息：</h2>
	</div>
	<div class="am-g">
		<div class="am-u-sm-5">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/titime.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>提交时间:</b>
			</div>
		</div>
		<div class="am-u-sm-7" style="margin-top: 10px;" id="sendtime">${data.finishTime}</div>
	</div>
	<div class="am-g">
		<div class="am-u-sm-4">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/po2.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>附件:</b>
			</div>
		</div>
		<!-- <div class="am-u-sm-5" style="margin-top: 10px;">214153156</div> -->
		<div class="am-u-sm-3" style="margin-top: 10px;margin-right: 30px;">
			<a href="${pageContext.request.contextPath}/News/DownFile?fileName=${dataText}"><button type="button"
					class="am-btn am-btn-sm am-btn-success am-radius">下载</button></a>
		</div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-12" style="padding-right: 0px;">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/picture.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>图片:</b>
			</div>
		</div>
	</div>
	<div class="am-g" style="margin-top: 10px;">
		<ul data-am-widget="gallery"
			class="am-gallery am-avg-sm-2
  			am-avg-md-3 am-avg-lg-4 am-gallery-imgbordered"
			data-am-gallery="{pureview:true}">
			<center>
				<li>
					<div class="am-gallery-item "
						style="float: left;margin-left: 10px;">
						<a href="/zhdj/News/listUI/pid/${dataPicture[0]}"><img
							id="img1" src="/zhdj/News/listUI/pid/${dataPicture[0]}"
							alt="" style="width: 100px;height: 63px;" /></a>
					</div>
				</li>
				<li>
					<div class="am-gallery-item" style="float: left;margin-left: 20px;">
						<a href="/zhdj/News/listUI/pid/${dataPicture[1]}"><img
							id="img2" src="/zhdj/News/listUI/pid/${dataPicture[1]}"
							alt="" style="width: 100px;height: 63px;" /></a>
					</div>
				</li>
				<li>
					<div class="am-gallery-item" style="float: left;margin-left: 20px;">
						<a href="/zhdj/News/listUI/pid/${dataPicture[2]}"><img
							id="img3" src="/zhdj/News/listUI/pid/${dataPicture[2]}"
							alt="" style="width: 100px;height: 63px;" /></a>
					</div>
				</li>
			</center>
		</ul>
	</div>
	<div class="am-g" style="margin-top: 10px;">
		<div class="am-u-sm-12" style="padding-right: 0px;">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/video.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>视屏:</b>
			</div>
		</div>
	</div>
	<div class="am-g">

		<div class="upload am-form-group am-form-file am-fr"
			style="width:100%;margin-left: 30px;float: left;">
			<div style="width:100%;">
				<video id="example_video_1" class="video-js vjs-amazeui" controls
					preload="none" width="100%" height="264"
					 data-setup="{}">
					<source id="example_video_source" src="${pageContext.request.contextPath}/News/listUI/pid/${dataVideo}" type='video/mp4' />
				  <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' /> -->
					<track kind="captions" src="${pageContext.request.contextPath}/video.js/demo.captions.vtt" srclang="en" label="English"></track>
					Tracks need an ending tag thanks to IE9
					<track kind="subtitles" src="${pageContext.request.contextPath}/video.js/demo.captions.vtt" srclang="en" label="English"></track>
					Tracks need an ending tag thanks to IE9
					<p class="vjs-no-js">
						To view this video please enable JavaScript, and consider
						upgrading to a web browser that 
						<a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
					</p>
				</video>
			</div>
		</div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-8">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/po1.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 6px;margin-right: 5px;"><b>内容:</b>
			</div>
		</div>
		<div class="am-u-sm-4" style="margin-top: 10px;float: right;">
			<button type="button" class="am-btn am-btn-sm am-btn-success"
				data-am-modal="{target: '#my-alert'}">查看</button>
			</a>
		</div>
	</div>

	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">报告内容</div>
			<div class="am-modal-bd" id="content">${data.finishOpinion}</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn">确定</span>
			</div>
		</div>
	</div>


	<div class="am-g" style="">
		<div class="am-u-sm-5">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/pigai2.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>批改意见:</b>
			</div>
		</div>
		<div class="am-u-sm-7" style="margin-top: 10px;" id="objection">${data.finishCheckOpinion}</div>
	</div>
	<div class="am-g" style="margin-top: 20px;">
		<center>
			<button id="del" type="button" class="am-btn am-btn-danger am-radius"
				style="width: 75%;margin-right: 20px;">删除该报告并重新提交</button>
		</center>
	</div>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="http://xwh511.cc:8090/js/dist/amazeui.dialog.min.js"
	charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/assets/js/video.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/ajaxfileupload.js"></script>
	<script>
	var finishId=${data.finishId}
	var tastId=${data.tastId}
	videojs.options.flash.swf = "http://xwh511.cc:8090/video.js/video-js.swf";
	$(function() {
		
<%-- 		(function($) {
			$.getUrlParam = function(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return decodeURI(r[2]);
				return null;
			}
		})(jQuery);
		var tastId =<%=request.getParameter("tastId")%>;
		$.getJSON(
				"${pageContext.request.contextPath}/ReadFinishCondition?tastId="
						+ tastId, function(data) {
					$('#sendtime').html(data.data.finishTime);
					$('#content').html(data.data.finishOpinion);
					$('#objection').html(data.data.finishCheckOpinion);
					$('#img1').attr('src',"/zhdj/News/listUI/pid/"+ data.data.finishUrlList[1]);
					$('#img2').attr('src',"/zhdj/News/listUI/pid/"+ data.data.finishUrlList[2]);
					$('#img2').prev().attr('href',"/zhdj/News/listUI/pid/"+ data.data.finishUrlList[2]);
					$('#img3').attr('src', data.data[2]);
					$('#img3').prev().attr('href', data.data[2]);
					$('#example_video_source').attr('src',"/zhdj/News/listUI/pid/"+ data.data.finishUrlList[0])
					
					$('#downlo').on('click', function() {
						var url = data.tast;
						window.open('');
					})
					
				}) --%>
		$('#del').on('click', function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/DeleteFinish',
				dataType : 'json',
				type : 'post',
				data : {
					finshId : finishId
				},
				success : function() {
					location.href = "${pageContext.request.contextPath}/base/goURL/weixin/projectDetail?id="+tastId
				}
			})
		})
	})
	</script>
	<script type="text/javascript">
		$("body").on("touchmove", function(event) {
			event.preventDefault;
		}, false);
		$("body").off("touchmove");
		
		
	</script>
</body>
</html>