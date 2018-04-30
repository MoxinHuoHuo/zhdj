<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="description" content="组织任务下达">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.datetimepicker-se.min.css" />
	<style type="text/css">
		body{
			overflow:-Scroll;overflow-x:hidden;
		}
	</style>

  </head>
  
  <body>
    <header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.back(-1)" class="">

              <img style="margin-top:20px;" class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

		<div class="am-header-right am-header-nav">
			<a href="${pageContext.request.contextPath}/base/goURL/weixin/main" class="">
				主页
			</a>
		</div>

      <h1 class="am-header-title">
          任务下达
      </h1>

  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        任务信息填写：
	    </h2>
	</div>

  <form id="sentpro" class="am-form am-form-horizontal" method="post" data-options="novalidate:true" enctype="multipart/form-data" style="margin-top: 10px;">
  		<div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po6.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>选择组织:</b>
		  	</div>
		  </div>
	    <div id="select1" class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input type="text" name="" id="uon" placeholder="请选择组织">
	      <input type="hidden" id="uid" name="uid">
	    </div>
 	  </div>
	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/title.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>任务标题:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input type="text" id="title" name="tastTitle" placeholder="输入任务标题">
	    </div>
	  </div>
	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>开始时间:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input value="" name="startTime" class="am-form-field" id='datetimepicker1' placeholder="请选择开始时间">
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>截止时间:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input value="" name="finishTime" class="am-form-field" id='datetimepicker2' placeholder="请选择结束时间">
	    </div>
 	  </div>
 	  
 	  
	
 	  <div class="am-form-group am-form-file">
	    <div class="am-u-sm-3" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>附件:</b>
		  	</div>
		</div>
		<div class="am-u-sm-5" style="padding-left: 0px;margin-top: 15px;">
	      	<div id="file-list"></div>
	    </div>
		<div class="am-u-sm-4">
		<button type="button" class="am-btn am-btn-danger am-btn-sm" style="margin-top: 8px;">
		    <i class="am-icon-cloud-upload"></i> 选择文件</button>
		  	<input name="Mrequest" id="doc-form-file" type="file" multiple>
		</div>
	    
 	  </div>

	  <div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	    	<label for="doc-ta-1"><img src="${pageContext.request.contextPath}/images/po1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;">任务内容</label>
      		<textarea id="proContent"  class="" rows="5" id="doc-ta-1"></textarea>
	  </div>
	  <div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	  		<button id="sentcofirm" style="width: 100%;" type="button" class="am-btn am-btn-lg am-btn-primary am-radius">确认下达</button>
	  </div>
	 
</form>
	<center><div>粤icp备09004280号</div></center>

	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/moment-with-locales.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.datetimepicker-se.min.js"></script>
	<script type="text/javascript">
	var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>; 
	var loginUserId=<%=session.getAttribute("RelUserLoginId")%>; 
		var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/388;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=388, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=388, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=388, user-scalable=no, target-densitydpi=device-dpi">');
       }
		 $(function() {
		    $('#datetimepicker1').datetimepicker({
		      format: 'YYYY-MM-DD',
    		});
		  });
		 $(function() {
		    $('#datetimepicker2').datetimepicker({
		      format: 'YYYY-MM-DD',
    		});
		  });
		  $(function() {
		    $('#doc-form-file').on('change', function() {
			      var fileNames = '';
			      $.each(this.files, function() {
			        fileNames += '<span class="am-badge">' + this.name + '</span> ';
			      });
			      $('#file-list').html(fileNames);
			    });
		 });
		
		$('#select1').on('click',function(){
			location.href="${pageContext.request.contextPath}/base/goURL/weixin/SelectUon"
			
		})
		//获取url中的参数
		//但是在使用的过程中，发现其在获取中文参数的时候，获取到的值是乱码的
 		//解决办法:将解码方式unscape换为decodeURI
 		//原因:浏览器会将url中的中文参数进行encodeURI编码，所以要通过js使用decodeURI进行解码
		$(function () {
		 (function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURI(r[2]); return null;
                }
            })(jQuery);
          
          	var xx = $.getUrlParam('name');
          	$('#uon').val(xx);
          	var uid= $.getUrlParam('id');
          	$('#uid').val(uid);
          })
          
		$('#sentcofirm').on('click',function(){
			var t=$('#proContent').val();
			var sentpro=new FormData($('#sentpro')[0]);
				sentpro.append('tastContent',t);
				sentpro.append('userId',loginUserId);
				$.ajax({
					url:'${pageContext.request.contextPath}/SentTast',
					dataType:'json',
					data:sentpro,
					type:'post',
					processData:false,
					contentType:false,
					success:function(data){
						alert(data.message);
						location.href="${pageContext.request.contextPath}/base/goURL/weixin/Havetask"
					}
				})
		})

	</script>
  </body>
</html>
