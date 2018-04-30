<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="忘记密码">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default">
      <div class="am-header-left am-header-nav">
          <a href="window.history.go(-1)" >

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          身份验证
      </h1>
  </header>

  	<div class="am-g" style="margin-top:30px;">
	  <div class="am-u-lg-8 am-u-sm-centered">
	     <form id="fogpwd" class="am-form" method="post" data-options="novalidate:true" enctype="multipart/form-data">
	      <fieldset class="am-form-set">
	      		<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">你的姓名</span>
				    <input type="text" name="flowUserName" class="am-form-field" placeholder="请输入你的姓名">
	      		</div>
	        	<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">身份证号</span>
				    <input type="text" name="information" onkeyup="value=value.replace(/[^\d]/g,'')" class="am-form-field" placeholder="请输入身份证号">
	      		</div>
	      		<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">手机号码</span>
				    <input type="text" name="tel" onkeyup="value=value.replace(/[^\d]/g,'')" class="am-form-field" placeholder="请输入手机号码">
	      		</div>
	      </fieldset>
	      <button type="button" id="regt" class="am-btn am-btn-primary am-btn-block am-radius">下一步</button>
	    </form>
	  </div>
	</div>

	<footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }" style="margin-top: 30px;">
	  	<div class="am-footer-miscs ">

	        <p>CopyRight©2018</p>
	        <p>Reserved huizhouxueyuan development team</p>
	    </div>
	</footer>


  <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
  <script type="text/javascript">
		$('#regt').on('click',function(){
			var fogpwd=new FormData($('#fogpwd')[0]);
				$.ajax({
					url:'${pageContext.request.contextPath}/Flow/Identification',
					dataType:'json',
					type:'post',
					data:fogpwd,
					processData: false,  // 告诉jQuery不要去处理发送的数据
					contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
					success:function(data){
						if(data.status==-1){
							alert("信息错误，请重新填写个人信息，以便找回密码");
						}
						
						else if(data.status==1){
						    alert("注册成功");
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/findpwd";
						} 
					}
				})
		})
	</script>
</body>
</html>
