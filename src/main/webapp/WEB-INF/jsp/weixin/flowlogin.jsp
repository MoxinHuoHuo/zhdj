<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="登录界面">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<style type="text/css">
		#sp1{background:  #F4F4F4;}
	</style>
</head>
<body>
<header data-am-widget="header"
          class="am-header am-header-default" style="background-color: #0e90d2">
      <div class="am-header-left am-header-nav">
          <a href="window.history.go(-1)"  >

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          <strong>流动党员登录</strong>
      </h1>
  </header>
	<div  data-am-widget="intro"
       class="am-intro am-cf am-intro-default">
     
  	</div>
  	<div style="margin-top: 20px;"><center><img style="width: 90px;" src="${pageContext.request.contextPath}/images/main.png"></center></div>
  	<div style="margin-top: 6px;"><center><h5 style="color: #F72100;font-size: 25px;"><strong>智慧党建</strong></h5></center></div>

  	<div class="am-g">
  		<div class="am-u-lg-4 am-u-md-8 am-u-sm-centered" style="margin-top: 30px;">
  			<form method="post" class="am-form">
	        <div class="am-form-group">
		        <div class="am-input-group">
				    <span id="sp1" class="am-input-group-label"><center><img style="width: 28px;padding-bottom:3px;" src="${pageContext.request.contextPath}/images/tel.png" class="am-icon-fw"></center></span>
				    <input id="account" type="text" onkeyup="value=value.replace(/[^\d]/g,'')" class="am-form-field" placeholder="请输入手机号码">
			    </div>
	        </div>
	        
		    <div class="am-form-group">
			    <div class="am-input-group">
				    <span id="sp1" class="am-input-group-label"><center><img style="width: 29px;padding-bottom:3px;" src="${pageContext.request.contextPath}/images/pas.png" class="am-icon-fw"></center></span>
				    <input id="password" type="password" class="am-form-field" placeholder="登录密码">
			    </div>
	        </div>
	        
	        <div class="am-cf">
		        <input style="background:#3080ee;font: #F4F4F4;" id="lg" type="button" name="" value="登 录"  class="am-btn  am-btn-xl am-fl am-u-sm-12 am-radius am-btn-primary">
	        </div>
	    </form>
  		</div>
  	</div>

  	<div class="am-g">
  		<div class="am-u-lg-4 am-u-md-8 am-u-sm-centered" style="margin-top: 20px;">
  			<a href="${pageContext.request.contextPath}/base/goURL/weixin/register"><i style="color: #C54A2A">未注册？请注册</i></a>
  			<div style="float: right;margin-right: 10px;"><a href="${pageContext.request.contextPath}/base/goURL/weixin/fogpwd"><i style="color: #C54A2A">忘记密码</i></a></div>
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
	/*f (top.location != self.location){
    top.location=self.location;     
	}*/
	$(function() {
    	$('#lg').on('click', function() {
    	if($("#account").val()==null||$("#account").val()==""){
    		/* $("#inner-text").text("账号不能为空!") */
    		$('#my-confirm1').modal({
    			relatedTarget: this
    		})
    		}
    	else if($("#password").val()==null||$("#password").val()==""){
    		/* $("#inner-text").text("密码不能为空！"); */
    		$('#my-confirm2').modal({
    			relatedTarget: this
    		})
    	}else{
    		$.ajax({
				url:"${pageContext.request.contextPath}/FlowUserLogin",
				type:'post',
				data:{tel:$('#account').val(),
					  password:$('#password').val()
					  },
				dataType:'json',
				success:function(data){
					if(data.status==0){
						alert("用户不存在");
					}
					else if(data.status==-1){
						alert("您的密码错误");
					}
					else if(data.status==1){
					    alert("登录成功");
						location.href="${pageContext.request.contextPath}/base/goURL/weixin/main";
					} 
				}
			});
    	}
    	});
	});
</script>
</body>
</html>
