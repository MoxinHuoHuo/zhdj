<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="计划下达">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
	<link rel="stylesheet" href="assets/css/amazeui.min.css" />
	<link rel="stylesheet" href="assets/css/amazeui.datetimepicker-se.min.css" />
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="#left-link" class="">

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          计划提交
      </h1>
  </header>

  <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        计划信息填写：
	    </h2>
	</div>

	<form id="sentpro" class="am-form am-form-horizontal" class="am-form am-form-horizontal" method="post" data-options="novalidate:true" enctype="multipart/form-data" style="margin-top: 10px;">
		<div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
			<div style="margin-top: 10px;"><img src="imgs/time1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>开始时间:</b>
			</div>
			  </div>
		    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;">
		      <input value="" name="" class="am-form-field" id='datetimepicker1'>
		    </div>
 	  	</div>

 	  	<div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="imgs/time2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>截止时间:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;">
	      <input value="" name="" class="am-form-field" id='datetimepicker2'>
	    </div>
 	  </div>

 	  	

 	   <div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	    	<label for="doc-ta-1"><img src="imgs/po1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;">计划内容</label>
      		<textarea class="" rows="7" id="doc-ta-1" id="projectcont"></textarea>
	  </div>

	  <div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	  		<button id="sentcofirm" style="width: 100%;" type="button" class="am-btn am-btn-lg am-btn-primary am-radius">确认提交</button>
	  </div>
	</form>

	<script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script src="assets/js/moment-with-locales.min.js"></script>
	<script src="assets/js/amazeui.datetimepicker-se.min.js"></script>
	<script type="text/javascript">
		var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/418;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=418, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=418, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=418, user-scalable=no, target-densitydpi=device-dpi">');
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

		 $('#sentcofirm').on('click',function(){
			var t=$('#projectcont').val();
			var sentpro=new FormData($('#sentpro')[0]);
				sentpro.append('',t);
				$.ajax({
					url:'',
					dataType:'json',
					type:'post',
					processData:false,
					contentType:false,
					success:function(){

					}
				})
		})
	</script>
</body>
</html>