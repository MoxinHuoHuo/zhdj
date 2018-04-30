<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="注册界面">
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
<body>
	<header data-am-widget="header"
          class="am-header am-header-default" style="background-color: #0e90d2">
      <div class="am-header-left am-header-nav">
          <a href="window.history.go(-1)"  >

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          <strong>注册</strong>
      </h1>
  </header>

  	<div style="margin-top: 20px;"><center><img style="width: 90px;" src="${pageContext.request.contextPath}/images/logo.png"></center></div>
  	<div style="margin-top: 6px;"><center><h5 style="color: #F72100;font-size: 25px;"><strong>智慧党建</strong></h5></center>
  	</div>


  	<div class="am-g" style="margin-top:30px;">
	  <div class="am-u-lg-8 am-u-sm-centered">
	    <form id="register" class="am-form" method="post" data-options="novalidate:true" enctype="multipart/form-data">
	      <fieldset class="am-form-set">
	      		<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">你的姓名</span>
				    <input type="text" name="flowUserName" class="am-form-field" placeholder="请输入你的姓名">
	      		</div>
	        	<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">身份证号</span>
				    <input type="text" name="information" onkeyup="value=value.replace(/[^\d]/g,'')" class="am-form-field" placeholder="请输入身份证">
	      		</div>
	      		<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">手机号码</span>
				    <input type="text" name="tel" onkeyup="value=value.replace(/[^\d]/g,'')" class="am-form-field" placeholder="请输入手机号码">
	      		</div>
	      		<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">登录密码</span>
				    <input type="password" id="pas1" name="password" class="am-form-field" placeholder="请输入登录密码">
	      		</div>
	      		<div class="am-input-group"  style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">确认密码</span>
				    <input type="password" id="pas2" name="" class="am-form-field" placeholder="请确认密码">
	      		</div>
	      </fieldset>
	      <button id="regt" type="button" class="am-btn-xl am-btn am-btn-default am-btn-block am-radius" style="background-color: #0e90d2"><span style="color:  #FFFFFF">注册</span></button>
	    </form>
	  </div>
	</div>
			<div class="am-modal" tabindex="-1" id="your-modal">
			  <div class="am-modal-dialog">
			    <div class="am-modal-hd">提示</div>
			    <div class="am-modal-bd">
			      密码不一致,请重新填写密码！
			    </div>
			    <div class="am-modal-footer">
			      <span class="am-modal-btn">确定</span>
			    </div>
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
			var $modal = $('#your-modal');
			var register=new FormData($('#register')[0]);
			if($('#pas1').val()!=$('#pas2').val()){
					$modal.modal();
			}
			else{
				$.ajax({
					url:'${pageContext.request.contextPath}/Flow/Insert',
					dataType:'json',
					type:'post',
					data:register,
					processData: false,  // 告诉jQuery不要去处理发送的数据
					contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
					success:function(data){
						if(data.status==-1){
							alert("该账号已存在");
						}
						
						else if(data.status==1){
						    alert("注册成功");
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/flowlogin";
						} 
					}
				})
			}
		})
	</script>
</body>
</html>