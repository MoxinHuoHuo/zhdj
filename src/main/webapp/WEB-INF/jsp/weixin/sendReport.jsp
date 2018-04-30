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
	<title>提交报告</title>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="提交报告">
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.back(-1)" class="">

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          提交报告
      </h1>

  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        报告信息填写：
	    </h2>
	</div>

	<form id="sentReport" class="am-form am-form-horizontal" style="margin-top: 10px;" method="post" data-options="novalidate:true" enctype="multipart/form-data">
		<div class="am-form-group am-form-file">
		    <div class="am-u-sm-3" style="padding-right: 0px;">
			  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>附件:</b>
			  	</div>
			</div>
			<div class="am-u-sm-5" style="padding-left: 0px;margin-top: 10px;">
		      	<div id="file-list"></div>
		    </div>
			<div class="am-u-sm-4">
			<button type="button" class="am-btn am-btn-danger am-btn-sm" style="margin-top: 7px;margin-right: 120px;">
			     选择文件</button>
			  	<input id="file2" type="file" name="files" multiple>
			</div>
 	  	</div>
 	  	<div class="am-g">
 	  		<div class="am-u-sm-12" style="padding-right: 0px;">
			  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/picture.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>图片:</b>
			  	</div>
			</div>
 	  	</div>
 	  	<div class="am-g" style="margin-top: 10px;">
	 	  	<div class="upload am-form-group am-form-file am-fr am-u-sm-4"
				style="width:30%;float: left;margin-left: 20px;">
				<div style="width: 80px;height: 80px;">
					<!-- <img style="width: 80px;" src="${pageContext.request.contextPath}/images/picAdd.png"> -->
					<input type="file"  name="files" class="imgUpload" id="img1"
					accept='image/*'>
					<img class="photoList am-thumbnail"
						src="${pageContext.request.contextPath}/images/z_add.png"
						 this.onerror=null/>
				</div>
			</div>
			<div class="upload am-form-group am-form-file am-fr am-u-sm-4 yin1"
				style="width:30%;float: left;">
				<div style="width: 80px;height: 80px;">
					<input type="file"  name="" class="imgUpload1" id="img2" accept='image/*'>
					<img class="photoList1 am-thumbnail"
						src="${pageContext.request.contextPath}/images/z_add.png"
						this.onerror=null/>
				</div>
			</div>
			<div class="upload am-form-group am-form-file am-fr am-u-sm-4 yin2"
				style="width:30%;float: left;">
				<div style="width: 80px;height: 80px;">
					<input type="file" name="" class="imgUpload2" id="img3" accept='image/*'>
					<img class="photoList2 am-thumbnail"
						src="${pageContext.request.contextPath}/images/z_add.png"
						 this.onerror=null/>
				</div>
			</div>
		</div>
		<div class="am-g">
			<div class="am-u-sm-12" style="padding-right: 0px;">
			  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/video.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>视屏:</b>
			  	</div>
			</div>
		</div>
		<div class="am-g">
			<!-- <div id="uploader-demo">
			    
			    <div id="fileList" class="uploader-list"></div>
			    <div id="filePicker">上传视屏</div>
			</div> -->
			<div class="upload am-form-group am-form-file am-fr"
				style="width:30%;margin-left: 30px;float: left;">
				<div style="width: 80px;height: 80px;">
					<img id="videoimg" src="${pageContext.request.contextPath}/images/z_add.png" style="width: 85px;height: 80px;">
					<input type="file" name="files" class="videoUpload" id="vdo" accept="video/*">
					
					<video class="video am-thumbnail" src='${pageContext.request.contextPath}/images/z_add.png' width="100px;" height="120px;" /></video>
				</div>
			</div>
		</div>
		
		<div class="am-g">
			<div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	    	<label for="doc-ta-1"><img src="${pageContext.request.contextPath}/images/po1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;">内容</label>
      		<textarea class="" rows="5" id="reportcont"></textarea>
	  		</div>
		</div>
		<div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
			<input type="hidden" id="tastId">
			<input type="hidden" id="userId">
	  		<button id="sent" style="width: 100%;" type="button" class="am-btn am-btn-lg am-btn-primary am-radius">提交</button>
	  </div>
	</form>

	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js/ajaxfileupload.js"></script>
	
	<script type="text/javascript">
	var userId=<%=session.getAttribute("RelUserLoginId")%>;
		    $('#file2').on('change', function() {
			      var fileNames = '';
			      $.each(this.files, function() {
			        fileNames += '<span class="am-badge">' + this.name + '</span> ';
			      });
			      $('#file-list').html(fileNames);
			    });
			$(function(){
				var uploaded=false;
				var fileSize;
				if($(".photoList").attr("src")!='${pageContext.request.contextPath}/images/z_add.png')
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
								/* alert(mythis.next().attr('src')); */
								/*mythis.next().css('width','100%');*/
							}
						}
					})
				})
			})
			
			$(function(){
				var uploaded=false;
				var fileSize;
				if($(".photoList1").attr("src")!='${pageContext.request.contextPath}/images/z_add.png')
					fileSize=true;
				else
					fileSize=false;
				
				$(".imgUpload1").each(function(){
					
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
								/* alert(mythis.next().attr('src')); */
								/*mythis.next().css('width','100%');*/
							}
						}
					})
				})
			})
			
			
			$(function(){
				var uploaded=false;
				var fileSize;
				if($(".photoList2").attr("src")!='${pageContext.request.contextPath}/images/z_add.png')
					fileSize=true;
				else
					fileSize=false;
				
				$(".imgUpload2").each(function(){
					
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
								/* alert(mythis.next().attr('src')); */
								/*mythis.next().css('width','100%');*/
							}
						}
					})
				})
			})
			
			$(function(){
				var uploaded=false;
				var fileSize;
				if($(".video").attr("src")!='${pageContext.request.contextPath}/images/picAdd.png')
					fileSize=true;
				else
					fileSize=false;
				
				$(".videoUpload").each(function(){
					$(this).change(function() {
						var fr = new FileReader();
						newfile = this.files[0];
						mythis = $(this);
						if(newfile.size/1024/1024>10){
							alert("请上传小于10M的视屏");
							fileSize=false;
						}
						else{
							fileSize=true;
							uploaded=true;
							fr.readAsDataURL(newfile);
							fr.onload = function(e) {
								$('#videoimg').hide();
								mythis.next().attr("src", this.result);
								
							}
						}
					})
				})
			})
			$(function(){
			(function($){
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURI(r[2]); return null;
                }
            })(jQuery);
				var tastId = $.getUrlParam('id');
				$('#tastId').val(tastId);
				
			function send(){
				var tastId=$('#tastId').val();
					var sentReport=new FormData($('#sentReport')[0]);
						sentReport.append('finishContent',$('#reportcont').val());
						sentReport.append('tastId',$('#tastId').val());
						sentReport.append('userId',userId);
					$.ajax({
						url:'${pageContext.request.contextPath}/ReferFinish',
						dataType:'json',
						type:'post',
						data:sentReport,
						processData: false,  // 告诉jQuery不要去处理发送的数据
						contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
						success:function(data){
							alert(data.message);
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/projectDetail?id="+tastId
						}
					})
			}	
			$('#sent').on('click',function(){
				if($('#file2').val()==""||$('#img1').val()==""||$('#reportcont').val()==""||$('#vdo').val()=="")
				{
					alert("请将报告信息填写完整");
				}
				else if($('#img1').val()!=""&&$('#img2').val()==""&&$('#img3').val()==""&&$('#file2').val()!=""&&$('#reportcont').val()!=""&&$('#vdo').val()!=""){
					send();
				}
				else if($('#img1').val()!=""&&$('#img2').val()!=""&&$('#img3').val()==""){
					$('#img2').attr('name','files');
					send();
				}
				else if($('#img1').val()!=""&&$('#img2').val()!=""&&$('#img3').val()!=""){
					$('#img2').attr('name','files');
					$('#img3').attr('name','files');
					send();
				}
			})
			})
	</script>
</body>
</html>