<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="description" content="上传记录">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
<style type="text/css">
</style>
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.go(-1)" class="">
              <img class="am-header-icon-custom" style="margin-top:17px;" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          记录提交
      </h1>

  </header>

	  <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
		    <h2 class="am-titlebar-title ">
		        记录信息填写：
		    </h2>
	  </div>
	  <form id="sentrd" class="am-form" method="post" data-options="novalidate:true" enctype="multipart/form-data">
		  <div class="am-form-group am-form-file" style="margin-top: 0.7em;">
		    <div class="am-u-sm-3" style="padding-right: 0px;">
			  	<div style="margin-top: 10px;"><img src="images/po2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>附件:</b>
			  	</div>
			</div>
			<div class="am-u-sm-5" style="padding-left: 0px;margin-top: 5px;">
		      	<div id="file-list"></div>
		    </div>
			<div class="am-u-sm-4">
			<button type="button" class="am-btn am-btn-danger am-btn-sm" style="margin-top: 5px;position: relative;right:16px;">
			    <i class="am-icon-cloud-upload"></i> 选择文件</button>
			  	<input id="doc-form-file" type="file" name="files" multiple>
			</div>
		    
	 	  </div>
	 	  <!-- <div class="am-g">
	 	  		<label for="doc-ta-1"><img src="images/picture.png" width="23" style="margin-left: 20px;margin-bottom: 8px;margin-right: 8px;">图片：</label>
	 	  </div>

	 	  <div class="am-g" style="margin-top: 10px;">
	 	  		<div class="upload am-form-group am-form-file am-fr am-u-sm-4"
				style="width:30%;float: left;margin-left: 10px;">
				<div style="width: 80px;height: 80px;">
					<img style="width: 80px;" src="imgs/picAdd.png">
					<input type="file" name="imgs"  class="imgUpload" id="comImg" accept='image/*'>
					<img class="photoList am-thumbnail"
						src="images/z_add.png"
						 this.onerror=null/>
				</div>
			</div>
	 	  </div> -->

	 	  <div class="am-g" style="margin-top: 1.5em">
	 	  		<center><a class="am-btn am-btn-primary am-btn-md" style="width: 90%" id="sentRo">提交</a></center>
	 	  </div>

 	  </form>
	<center>粤icp备09004280号</center>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script>
<script type="text/javascript">
var meetingId=<%=request.getParameter("mtId")%>;
var relUserLoginName="<%=session.getAttribute("RelUserLoginName")%>";
var relUserLoginId="<%=session.getAttribute("RelUserLoginId")%>";
var phoneWidth = parseInt(window.screen.width);
var phoneScale = phoneWidth/360;
var ua = navigator.userAgent;
if (/Android (\d+\.\d+)/.test(ua)){
  var version = parseFloat(RegExp.$1);
  if(version>2.3){
    document.write('<meta name="viewport" content="width=360, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
  }else{
    document.write('<meta name="viewport" content="width=360, target-densitydpi=device-dpi">');
  }
} else {
  document.write('<meta name="viewport" content="width=360, user-scalable=no, target-densitydpi=device-dpi">');
}
$(function() {
    $('#doc-form-file').on('change', function() {
      var fileNames = '';
      $.each(this.files, function() {
        fileNames += '<span class="am-badge">' + this.name + '</span> ';
      });
      $('#file-list').html(fileNames);
    });
 });
$(function(){
	var uploaded=false;
	var fileSize;
	if($(".photoList").attr("src")!='imgs/z_add.png')
		fileSize=true;
	else
		fileSize=false;
	
	$(".imgUpload").each(function(){
		$(this).change(function() {
			var fr = new FileReader();
			newfile = this.files[0];
			mythis = $(this);
			if(newfile.size/1024/1024>4){
				alert("该图片大小应在4M以内");
				fileSize=false;
			}
			else{
				fileSize=true;
				uploaded=true;
				fr.readAsDataURL(newfile);
				fr.onload = function(e) {
					mythis.next().attr("src", this.result);
					/*mythis.next().css('width','100%');*/
				}
			}
		})
	})
})

$('#sentRo').on('click',function(){
		var sentrd=new FormData($('#sentrd')[0]);
		sentrd.append("meetingId",meetingId);
		sentrd.append("userName",relUserLoginName);
		sentrd.append("userId",relUserLoginId);
		$.ajax({
			url:'${pageContext.request.contextPath}/meeting/upload',
			dataType:'json',
			type:'post',
			data:sentrd,
			processData:false,
			contentType:false,
			success:function(data){
				alert(data.message);
				if(data.status==1)
					location.reload();
			}
		})
})
</script>

</body>
</html>
