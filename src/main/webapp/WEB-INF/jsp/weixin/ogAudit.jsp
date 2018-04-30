<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
 <head>
<base href='<%=basePath%>'>
<title>组织审核</title>
<meta charset='utf-8'>
<meta http-equiv="description" content="组织审核">
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
<style>
ul,li{list-style-type: none}
ol, ul {
    padding-left: 0;
}
</style>
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/statistics" class="">
              <img class="am-header-icon-custom" style="margin-top:15px;"
               src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          组织审核
      </h1>

  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        审核条件填写：
	    </h2>
	</div>

  <form id="sendmeet" class="am-form am-form-horizontal" style="margin-top: 10px;" method="post" data-options="novalidate:true" enctype="multipart/form-data">

	   <div class="am-form-group am-form-file">
	    <div class="am-u-sm-4" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/met.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>选择组织:</b>
		  	</div>
		</div>
		<div class="am-u-sm-5" style="padding-left: 0px;margin-top: 5px;position: relative;left: 10px;">
	      	<input class="am-form-field must" id="ogName" disabled style="border:0;border-bottom:1px solid #ccc;">
	    </div>
		<div class="am-u-sm-3" >
			<a onclick="ogAudit.chooseOg()" style="margin-top:5px;" class="am-btn am-btn-primary ">请选择</a>
		</div>
	    
 	  </div>
	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po3.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>选择年份:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      	<div id="date">
				<select name="year" id="year" class="must">
					<option value="">选择年份</option>
				</select>
			</div>
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/stat3.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>党代会:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      	<div class="case">
	 			<select class="selSum must" id="partyMax">
					<option value="">选择次数</option>
				</select>
			</div>
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/stat5.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>党员大会:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      	<div class="case">
	 			<select class="selSum must" id="partAll">
					<option value="">选择次数</option>
				</select>
			</div>
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/stat6.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>民主生活会:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      	<div class="case">
	 			<select class="selSum must" id="partPeople">
					<option value="">选择次数</option>
				</select>
			</div>
	    </div>
 	  </div>
 	  <div class="am-form-group">
	    <div class="am-u-sm-5" style="padding-right: 0px;">
		  	<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/stat4.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>党课:</b>
		  	</div>
		  </div>
	    <div class="am-u-sm-7" style="padding-left: 0px;margin-top: 5px;position: relative;right: 25px;">
	      	<div class="case">
	 			<select class="selSum must" id="partClass">
					<option value="">选择次数</option>
				</select>
			</div>
	    </div>
 	  </div>
 	  
	  <div class="am-form-group" style="margin-left: 10px;margin-right: 12px;">
	  		<a onclick="ogAudit.submit()" style="width: 100%;" class="am-btn am-btn-lg am-btn-primary am-radius">提交条件</a>
	  </div>
	 
</form>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.datetimepicker-se.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/sider.jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/selectSum.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/validateDialog.js"></script> 
<script type="text/javascript">
var hasCookie=<%=request.getParameter("hasCookie")%>;	  
var ogAudit={
	set:function(){				//进入页面就调用的方法
		$("#date").selectDate();	//初始化年份选择插件
		selectSum();				//初始化数字选择插件
		if(!hasCookie){							//判断cookie里是否有内容
			$.cookie("timer","",{expires:-1});
			$.cookie("partyMax","",{expires:-1});
			$.cookie("partAll","",{expires:-1});
			$.cookie("partPeople","",{expires:-1});
			$.cookie("partClass","",{expires:-1});
			$.cookie("treeId","",{expires:-1});
			$.cookie("ogName","",{expires:-1});
		}else{
			$("#year").val($.cookie("timer"));
		  	$("#partyMax").val($.cookie("partyMax"));
		  	$("#partAll").val($.cookie("partAll"));
		  	$("#partPeople").val($.cookie("partPeople"));
		  	$("#partClass").val($.cookie("partClass"));
		  	$("#ogName").val($.cookie("ogName"));
		}
	},
	chooseOg:function(){			//跳转到选择组织页面
		$.cookie("timer",$("#year").val());			//将已填的信息保存到cookie里
		$.cookie("partyMax",$("#partyMax").val());
		$.cookie("partAll",$("#partAll").val());
		$.cookie("partPeople",$("#partPeople").val());
		$.cookie("partClass",$("#partClass").val());
	  	location.href="${pageContext.request.contextPath}/base/goURL/weixin/statOgList?og=true";
	},
	submit:function(){					//提交查询条件
		var must=true;
		$(".must").each(function(){
			if(!$(this).val())
				must=false;
		})
		if(!must){
			validateDialog.fadeDialog("请补充完所有查询条件");
		}else{
			$.ajax({
				dataType:"JSON",
				url:"/zhdj/Assess",
				type:"POST",
				data:{
					time1:$("#year").val(),
					treeId:$.cookie("treeId"),
					partyMax:$("#partyMax").val(),
					partAll:$("#partAll").val(),
					partPeople:$("#partPeople").val(),
					partClass:$("#partClass").val(),
				},
				success:function(data){
					if(data.status==1)
						validateDialog.fadeDialogWithColor(data.info,"#2ECC71")
					else
						validateDialog.fadeDialogWithColor(data.info,"#E74C3C")
					$.cookie("timer","",{expires:-1});
					$.cookie("partyMax","",{expires:-1});
					$.cookie("partAll","",{expires:-1});
					$.cookie("partPeople","",{expires:-1});
					$.cookie("partClass","",{expires:-1});
					$.cookie("treeId","",{expires:-1});
					$.cookie("ogName","",{expires:-1});
				}
			})
		}
	}
}
ogAudit.set();
</script>
</body>
</html>
