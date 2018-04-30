<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
 <head>
<base href='<%=basePath%>'>
<title>发布会议</title>
<meta charset='utf-8'>
<meta http-equiv="description" content="会议发布">
<meta http-equiv='pragma' content='no-cache'>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='keywords' content='keyword1,keyword2,keyword3'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no'>
   <meta name='apple-mobile-web-app-capable' content='yes' />
   <meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta name='format-detection' content='telephone=no'>
<meta name='renderer' content='webkit'>
<meta http-equiv='Cache-Control' content='no-siteapp' />
<link rel='alternate icon' type='image/png' href='${pageContext.request.contextPath}assets/i/favicon.png'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/assets/css/amazeui.min.css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.datetimepicker-se.min.css" />
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/showMeetingList" class="">
              <img class="am-header-icon-custom" style="margin-top:15px;"
               src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

		<div class="am-header-right am-header-nav">
			<a href="${pageContext.request.contextPath}/base/goURL/weixin/main" class="">
				主页
			</a>
		</div>

      <h1 class="am-header-title">
          会议下达
      </h1>

  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        会议信息填写：
	    </h2>
	</div>

  <form id="sendmeet" class="am-form am-form-horizontal" style="margin-top: 10px;" method="post" data-options="novalidate:true" enctype="multipart/form-data">
	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/title.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>会议标题:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input type="text" name="meetingTitle" id="title" placeholder="输入会议标题" class="must">
	    </div>
	  </div>
	   <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/mt4.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>会议类型:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <select name="type" id="type" >
	      	<option value="1">党代会</option>
	      	<option value="2">党员大会</option>
	      	<option value="3">民主生活会</option>
	      	<option value="4">党课</option>
	      </select>
	    </div>
	  </div>
	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po3.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>开始签到:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input value="" name="starttime" class="am-form-field must" id='datetimepicker1' placeholder="请选择开始签到时间">
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po4.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>截止签到:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input value="" name="endtime" class="am-form-field must" id='datetimepicker2' placeholder="请选择截止签到时间">
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>开始时间:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input value="" name="signStarttime" class="am-form-field must" id='datetimepicker3' placeholder="请选择会议开始时间">
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>结束时间:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input value="" name="signEndtime" class="am-form-field must" id='datetimepicker4' placeholder="请选择会议结束时间">
	    </div>
 	  </div>

 	  <div class="am-form-group am-form-file">
	    <div class="am-u-sm-4" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/myuon.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>参与人员:</b>
		  	</div>
		</div>
		<div class="am-u-sm-5" style="padding-left: 0px;margin-top: 5px;position: relative;left: 10px;">
	      	<input class="am-form-field" id="people" disabled style="border:0;border-bottom:1px solid #ccc;">
	      	<input name="ids" type="hidden" class="am-form-field must" id="ids" style="border:0;border-bottom:1px solid #ccc;">
	    </div>
		<div class="am-u-sm-3" style="position: relative;right:5px;">
			<a id="chOrganization" class="am-btn am-btn-primary ">请选择</a>
		</div>
	    
 	  </div>
 	  
 	  <div class="am-form-group ">
	    <div class="am-u-sm-4" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/place.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>所在地区:</b>
		  	</div>
		</div>
		<div class="am-u-sm-5" style="padding-left: 0px;margin-top: 5px;position: relative;left: 10px;">
	      	<input type="hidden" name="lng" class="am-form-field" id="lng" >
	      	<input type="hidden" name="lat" class="am-form-field" id="lat" >
	      	<input name="" class="am-form-field must" id="location" disabled style="border:0;border-bottom:1px solid #ccc;">
	    </div>
		<div class="am-u-sm-3" style="position: relative;right:5px;">
			<a class="am-btn am-btn-primary" id="chLocation">请选择</a>
		</div>
	    
 	  </div>
 	  
 	  <div class="am-form-group ">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/pigai.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>详细地址:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      <input value="" name="dtLocation" class="am-form-field must" id='dtLocation' placeholder="请输入详细地址">
	    </div>
 	  </div>

	  <div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	    	<label for="doc-ta-1"><img src="${pageContext.request.contextPath}/images/po1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;">会议内容</label>
      		<textarea id="meetcont" name="meetingContent" class="must" rows="5" id="doc-ta-1"></textarea>
	  </div>
	  <div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	  		<a id="sendcfm" style="width: 100%;" class="am-btn am-btn-lg am-btn-primary am-radius">提交会议</a>
	  </div>
	 
</form>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.datetimepicker-se.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script> 
<script type="text/javascript">
	var hasCookie=<%=request.getParameter("hasCookie")%>;
	var RelUserTreeId="<%=session.getAttribute("RelUserTreeId")%>";
	if(!hasCookie){
		$.cookie("title","",{expires:-1});
		$.cookie("dp1","",{expires:-1});
		$.cookie("dp2","",{expires:-1});
		$.cookie("dp3","",{expires:-1});
		$.cookie("dp4","",{expires:-1});
		$.cookie("location","",{expires:-1});
		$.cookie("dtLocation","",{expires:-1});
		$.cookie("meetcont","",{expires:-1});
		$.cookie("ogUsers","",{expires:-1});
		$.cookie("Ids","",{expires:-1});
		$.cookie("lng","",{expires:-1});
   		$.cookie("lat","",{expires:-1});
   		$.cookie("type","",{expires:-1});
	}else{
		$("#title").val($.cookie("title"));
	  	$("#datetimepicker1").val($.cookie("dp1"));
	  	$("#datetimepicker2").val($.cookie("dp2"));
	  	$("#datetimepicker3").val($.cookie("dp3"));
	  	$("#datetimepicker4").val($.cookie("dp4"));
	  	$("#location").val($.cookie("location"));
	  	$("#dtLocation").val($.cookie("dtLocation"));
	  	$("#meetcont").val($.cookie("meetcont"));
	  	$("#people").val($.cookie("ogUsers"));
	  	if($.cookie("Ids"))
	  	$("#ids").val($.cookie("Ids").replace(/、/g,',').substring(0,$.cookie("Ids").replace(/、/g,',').length-1));
	  	$("#lng").val($.cookie("lng"));
	  	$("#lat").val($.cookie("lat"));
	  	$("#type").val($.cookie("type"));
	}
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
      
      //日期选择
	 $(function() {
	    $('#datetimepicker1').datetimepicker();
	  });
	 $(function() {
	    $('#datetimepicker2').datetimepicker();
	  });
	 $(function() {
	    $('#datetimepicker3').datetimepicker();
	  });
	 $(function() {
	    $('#datetimepicker4').datetimepicker();
	  })
	 	  
	  $('#sendcfm').on('click',function(){
	  		var musted=true;
	  		$(".must").each(function(){
	  			if(!$(this).val())
	  				musted=false;
	  		})
	  		if(musted){
		  		var sendmeet=new FormData($('#sendmeet')[0]);
		  		var idArray=$("#ids").val().split(",");
		  		sendmeet.append('orgId',RelUserTreeId);
		  		sendmeet.append('arriveNumber',idArray.length);
		  		$.ajax({
		  			url:'/zhdj/meeting',
		  			dataType:'json',
		  			type:'post',
		  			data:sendmeet,
		  			processData:false,
		  			contentType:false,
		  			success:function(data){
		  				alert(data.message);
		  				if(data.status==1)
		  					location.href="${pageContext.request.contextPath}/base/goURL/weixin/showMeetingList";
		  			}
		  		})
	  		}else
	  			alert("请确认填完所有资料再进行添加");
	  });
	  
	 
	  $("#chLocation").click(function(){
	  	$.cookie("title",$("#title").val());
		$.cookie("dp1",$("#datetimepicker1").val());
		$.cookie("dp2",$("#datetimepicker2").val());
		$.cookie("dp3",$("#datetimepicker3").val());
		$.cookie("dp4",$("#datetimepicker4").val());
		$.cookie("dtLocation",$("#dtLocation").val());
		$.cookie("meetcont",$("#meetcont").val());
		$.cookie("type",$("#type").val());
	  	location.href="${pageContext.request.contextPath}/base/goURL/weixin/setMtLocation";
	  })
	  
	  $("#chOrganization").click(function(){
	  	$.cookie("title",$("#title").val());
		$.cookie("dp1",$("#datetimepicker1").val());
		$.cookie("dp2",$("#datetimepicker2").val());
		$.cookie("dp3",$("#datetimepicker3").val());
		$.cookie("dp4",$("#datetimepicker4").val());
		$.cookie("dtLocation",$("#dtLocation").val());
		$.cookie("meetcont",$("#meetcont").val());
		$.cookie("type",$("#type").val());
	  	location.href="${pageContext.request.contextPath}/base/goURL/weixin/ogList";
	  })
</script>

	<center><div>粤icp备09004280号</div></center>
</body>
</html>
