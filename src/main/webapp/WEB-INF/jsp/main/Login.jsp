<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>欢迎登录智慧党建</title>
	<meta http-equiv="description" content="后台点击显示代理个人信息">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" href="/zhdj/css/amazeui.min.css" />
	<style>
	.copyright{
	  	text-align: center;
	}
	.am-g{
		margin-top:165px;
	}
	body{
		background-color:#FFFAF0;
	}
	</style>
</head>
<body>

<div class="am-g">
	<div class="am-u-lg-4 am-u-md-8 am-u-sm-centered">
		<legend><strong><i class="am-icon-cloud am-icon-md"></i>&nbsp;&nbsp;智慧党建</strong></legend>
	    <form method="post" class="am-form">
	        <div class="am-form-group ">
		        <div class="am-input-group am-input-group-primary">
				    <span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
				    <input id="account" type="text" class="am-form-field" placeholder="手机号码">
			    </div>
	        </div>
	        
		    <div class="am-form-group">
			    <div class="am-input-group am-input-group-primary">
				    <span class="am-input-group-label"><i class="am-icon-lock am-icon-fw"></i></span>
				    <input id="password" type="password" class="am-form-field" placeholder="密码">
			    </div>
	        </div>
	        
	        <div class="am-cf">
		        <input id="lg" type="button" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl am-u-sm-12">
	        </div>
	    </form>
	    <hr>
	    <p class="am-padding-left copyright">&copy;Copyright 2017 All Rights  <br/> Reserved huizhouxueyuan development team</p>
	</div>
</div>
		<div class="am-modal am-modal-confirm" tabindex="2" id="my-confirm1">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">请填写：</div>
		    <div class="am-modal-bd">
		      	手机号码不能为空&nbsp;!
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
		</div>
		<div class="am-modal am-modal-confirm" tabindex="2" id="my-confirm2">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">请填写：</div>
		    <div class="am-modal-bd">
		      	密码不能为空 &nbsp;!
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
		</div>
</body>
<script src="/zhdj/js/jquery.min.js"></script>
<script src="/zhdj/js/amazeui.min.js"></script>
<script type="text/javascript">
if (top.location != self.location){
    top.location=self.location;     
}
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
						location.href="${pageContext.request.contextPath}/base/goURL/main/index";
					} 
				}
			});
    	}
    });
});
</script>
</html>
