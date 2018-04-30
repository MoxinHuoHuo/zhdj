<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>基础质料</title>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="基础资料">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<style type="text/css">
		.am-list li{
		width: 90%;
		margin-left: 5%;
		margin-right: 5%;
		border:0;
		}
		.am-list img{
		position: relative;
		top:-3px;
		}
		html,body{overflow:hidden;overflow-y:auto;}
	</style>
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.back(-1)" class="">
              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          我的
      </h1>
  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        基础资料
	    </h2>
	</div>

	<div class="am-g" >
	  <div class="am-u-lg-12 am-u-sm-centered" style="padding: 0;height: 130px">
	    <ul class="am-list am-list-static " id="am-list2">
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/me.png" width="24px" height="24px">
		  &nbsp;姓名&nbsp;:&nbsp;&nbsp;&nbsp;<span id="name"></span>
		  </li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/card.png" width="24px" height="24px">
		  &nbsp;身份&nbsp;:&nbsp;&nbsp;&nbsp;<span id="ID"></span>
		  </li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/tel.png" width="24px" height="24px">
		  &nbsp;电话号码&nbsp;:&nbsp;&nbsp;&nbsp;<span id="tel"></span>
		  </li>
		</ul>
	  </div>
	</div>

	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 0px;">
	    <h2 class="am-titlebar-title ">
	        组织信息
	    </h2>
	</div>
	<div class="am-g" style="margin-bottom: 0px;">
	  <div class="am-u-lg-12 am-u-sm-centered" style="padding: 0;margin-bottom: 0px;height: 130px;">
	    <ul class="am-list am-list-static " id="am-list2">
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/mg4.png" width="24px" height="24px">
		  &nbsp;书记&nbsp;:&nbsp;&nbsp;&nbsp;<span id="mga"></span>
		  </li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/mg3.png" width="24px" height="24px">
		  &nbsp;管理员&nbsp;:&nbsp;&nbsp;&nbsp;<span id="mag1"></span>
		  </li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/tel.png" width="24px" height="24px">
		  &nbsp;电话号码&nbsp;:&nbsp;&nbsp;&nbsp;<span id="tel1"></span>
		  </li>
		</ul>
	  </div>
	</div>
	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/uon.png" width="24" height="24" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><span style="margin-left: 8px;">所在组织:</span></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 13px;position: relative;right: 25px;" id="uon"></div>
	 </div>

	 <div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 13px;"><img src="${pageContext.request.contextPath}/images/myuon.png" width="24" height="24" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><span>组织成员:</span></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;position: relative;left: 73px;"><button class="am-btn am-btn-success am-btn-sm" id="viewuon">查看成员</button></div>
	 </div>

	 <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        设置
	    </h2>
	</div>

	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 13px;"><img src="${pageContext.request.contextPath}/images/reset.png" width="24" height="24" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><span>修改密码:</span></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;position: relative;left: 98px;"><button class="am-btn am-btn-success am-btn-sm" id="reset">修改</button></div>
	 </div>
	 <div class="am-g" style="margin-top: 30px;">
	 		<center><button class="am-btn am-btn-danger am-btn-lg" style="width: 90%" id="back">退出登录</button></center>
	 </div>

	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
  	<script type="text/javascript">
  	var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>;
	var loginUserId=<%=session.getAttribute("RelUserLoginId")%>;
  		var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/395;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=395, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=395, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=395, user-scalable=no, target-densitydpi=device-dpi">');
       }
//获取json数据，即一条链接里面的json数据
       $.getJSON("${pageContext.request.contextPath}/User/GetMsgById?loginTreeId="+loginTreeId+"&loginUserId="+loginUserId,function(data){
    	   $('#name').html(data.user.userName);
    	   $('#tel').html(data.user.tel);
    	   $('#mga').html(data.userSecretary.userName);
    	   $('#mag1').html(data.userAdmin.userName);
    	   $('#tel1').html(data.userAdmin.tel);
    	   $('#uon').html(data.user.node.text);
    	   if(data.user.role.roleName=="secretary"){
    	   	$('#ID').html("书记");
    	   }
    	   else if(data.user.role.roleName=="admin"){
    	   	$('#ID').html("管理员");
    	   }
    	   else if(data.user.role.roleName=="user"){
    	   	$('#ID').html("党员");
    	   }
    	   else if(data.user.role.roleName=="flowUser"){
    	   	$('#ID').html("流动党员");
    	   }
    	   else if(data.user.role.roleName=="flowAdmin"){
    	   	$('#ID').html("流动党员管理员");
    	   }
    	   else if(data.user.role.roleName=="superAdmin"){
    	   	$('#ID').html("管理员");
    	   }
    	   
       })
  		$('#viewuon').on('click',function(){
  			
  				location.href="${pageContext.request.contextPath}/base/goURL/weixin/uonList?id="+loginTreeId
  		})
  		$('#reset').on('click',function(){	
  					location.href="${pageContext.request.contextPath}/base/goURL/weixin/changePwd?id="+loginUserId
  		})
  		$('#back').on('click',function(){
  				$.ajax({
  				url:'${pageContext.request.contextPath}/logout',
  				dataType:'json',
  				type:'post',
  				success:function(){
  					location.href="${pageContext.request.contextPath}/base/goURL/weixin/login"
  				}
  			})
  		})
  	</script>
</body>
<center>粤icp备09004280号</center>
</html>
			