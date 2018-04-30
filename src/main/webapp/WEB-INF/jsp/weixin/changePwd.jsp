<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="找回密码">
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
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
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
          重置密码
      </h1>
  </header>

  	<div class="am-g" style="margin-top:30px;">
	  <div class="am-u-lg-8 am-u-sm-centered">
	    <form class="am-form" id="findpwd">
	      <fieldset class="am-form-set">
	      		<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">登录密码</span>
				    <input type="password" id="pas1" class="am-form-field" placeholder="请输入登录密码">
	      		</div>
	        	<div class="am-input-group" style="background-color:  #F4F4F4">
	      			<span class="am-input-group-label" style="font-size: 15px;">确认密码</span>
				    <input type="password" id="pas2" name="password" class="am-form-field" placeholder="请确认确认密码">
	      		</div>
	      		
	      </fieldset>
	      <button type="button" id="change" class="am-btn-xl am-btn am-btn-primary am-btn-block am-radius">确认</button>
	    </form>
	  </div>
	</div>
   			<div class="am-modal" tabindex="-1" id="modal1">
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
		$('#change').on('click',function(){
			var $modal = $('#modal1');
			
			if($('#pas1').val()!=$('#pas2').val()){
				$modal.modal();
		}else{
			(function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURI(r[2]); return null;
                }
            })(jQuery);
            var userId=$.getUrlParam('id');
            
				$.ajax({
					url:'${pageContext.request.contextPath}/User/ChangePassword',
					dataType:'json',
					type:'post',
					data:{password:$('#pas2').val(),userId:userId},
					success:function(data){
						if(data.status==-2){
							alert("尚未通过验证，请重新验证");
						}
						else if(data.status==-1){
							alert("信息错误，请重新填写个人信息，以便找回密码");
						}
						else if(data.status==1){
						    alert("修改成功");
						    location.href="${pageContext.request.contextPath}/base/goURL/weixin/main";
						}
					}
				})
		}
		})
	</script>
</body>
</html>