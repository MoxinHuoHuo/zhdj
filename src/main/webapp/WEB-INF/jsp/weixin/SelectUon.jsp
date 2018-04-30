<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="description" content="会议详情">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
<style type="text/css">
a {
	font-size: 20px;
}

.og, .ogTitle {
	background: none;
	border: 0;
	width: 100%;
	list-style-type: none;
	text-align: left;
	padding: 0;
	display: flex;
	display: -webkit-flex;
	align-items: stretch;
	margin-bottom: 2px;
}

.imgSpan {
	display: flex;
	display: -webkit-flex;
	align-items: center;
}

.ogName {
	padding: 0px 0 0 5px;
	font-size: 16px;
	float: right;
	display: flex;
	display: -webkit-flex;
	align-items: center;
}

.ogImg1 {
	width: 15px;
	height: 15px;
}

.ogImg2 {
	width: 28px;
	height: 30px;
	padding: 5px 2px;
}

ol>li>ol, ol>li>ul, ul>li>ol, ul>li>ul {
	margin: 0;
}

.indent {
	padding-left: 15px;
}

.last {
	background: none;
	border: 0;
	width: 100%;
	list-style-type: none;
	text-align: left;
	display: flex;
	display: -webkit-flex;
	align-items: stretch;
	margin: 3px 0 3px 0;
}

.ogSelect {
	display: flex;
	display: -webkit-flex;
	align-items: center;
	width: 16%;
	margin-left: 5px;
}

.ogSelect option {
	width: 15%;
}

.ogBtn {
	position: absolute;
	padding: 4px 9px;
}

.select {
	background-color: rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default">
	<div class="am-header-left am-header-nav" style="height:100%">
		<a href="javascript:window.history.go(-1)"><img class="am-header-icon-custom"
			src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
			alt="" style="margin-top:17px;">
		</a>
	</div>

	<h1 class="am-header-title">选择组织</h1>
	</header>

	<div class="am-g am-u-sm-centered" style="margin: 10px 0 0 5px;">
		<!-- <a href="javascript:void(0)" class="am-btn am-btn-secondary ogBtn"
			style="right: 48%;" onclick="organ.showAddModal()">增加</a> 
		<a href="javascript:void(0)" class="am-btn am-btn-success ogBtn"
			style="right: 33%;" onclick="organ.showUser()">查看</a> 
		<a href="javascript:void(0)" class="am-btn am-btn-warning ogBtn" style="right: 18%;"
			onclick="organ.showUpdateModal()">修改</a> 
		<a href="javascript:void(0)"class="am-btn am-btn-danger ogBtn" style="right: 3%;"
			onclick="organ.showRemoveModal()">删除</a> -->
		<label style="font-size:15px;margin-top:5px;">已选组织:</label>
		<a href="javascript:void(0)" onclick="organ.see()" class="am-btn am-btn-success am-radius ogBtn" style="right:20%">查看已选择</a>
		<a href="javascript:void(0)" onclick="organ.clear()" class="am-btn am-btn-danger am-radius ogBtn" style="right:3%">清空</a>
		<div class="am-form am-form-group" style="margin-top:8px;">
		<input type="text" id="Hseluon">
		<input type="hidden" id="hasId">
		</div>
		<a href="javascript:void(0)" onclick="organ.addName()" class="am-btn am-btn-primary am-radius" style="float:right">选择</a>
	</div>
	<div class="am-g" style="margin-top:10px;">
		<div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;">
			<ul class="mainUl">
				<div class="ogTitle" style="padding-left:5px;">
					<input type="hidden" value='0' /> <span class="imgSpan"><img
						src="${pageContext.request.contextPath}/images/og2.png" style="width:15px;height:15px;"></span>
					<span class="imgSpan"><img src="${pageContext.request.contextPath}/images/og5.png"
						style="width:25px;height:25px;"></span>
					<div class="ogName"></div>
				</div>
				<!-- <li class="indent">
				<div class="og ">
					<input style='display:hidden;' value=''/>
					<span class="imgSpan"><img src="${pageContext.request.contextPath}/images/og1.png" class="ogImg1"></span>
					<span class="imgSpan"><img src="${pageContext.request.contextPath}/images/og3.png" class="ogImg2"></span>
					<div class="ogName">组织1组织1组织1组织1组织0.9</div>
				</div>
				<ul >
					<li class="indent">
						<div class="last select">
							<span class="imgSpan"><img src="${pageContext.request.contextPath}/images/og4.png" class="ogImg2"></span>
							<div class="ogName">组织3组织3组织3组织3组织3组织3</div>
						</div>
					</li>
				</ul>
			</li>
			 -->
			</ul>
		</div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="seeModal">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">已选择组织：</div>
			<div style="font-size:16px" class="am-modal-bd">
				<form class="am-form">
					<div class="am-form-group">
						<textarea id="uName" class="" rows="5" id="doc-ta-1"></textarea>
					</div>
				</form>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm onclick="organ.confirmSel()">确认选择</span>
			</div>
		</div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="clearModal">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">提示
			<br><br>
			是否清空已选择组织?
			</div>
			
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm onclick="organ.clearAll()">确定</span>
			</div>
		</div>
	</div>

	<footer data-am-widget="footer" class="am-footer am-footer-default"
		data-am-footer="{  }" style="margin-top: 30px;">
	<div class="am-footer-miscs ">

		<p>CopyRight©2018</p>
		<p>Reserved huizhouxueyuan development team</p>
	</div>
	</footer>


	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
	var id="";
	var RelUserLoginPowerId=<%=session.getAttribute("RelUserLoginPowerId")%>;
	
	var organ={
		createNode:function(data,$ul){
			for(var i=0;i<data.length;i++){
				if(data[i].children!=undefined){					//不是叶节点创建节点
					var $newLi=$("<li class='indent'></li>");
					var $newOg=$("<div class='og'></div>");
					var $newInput=$("<input type='hidden' value='"+data[i].id+"'/>");
					var $newimgSpan1=$("<span class='imgSpan'></span>");
					var $newimgSpan2=$("<span class='imgSpan'></span>");
					var $newogImg1=$("<img src='${pageContext.request.contextPath}/images/og1.png' class='ogImg1'>");
					var $newogImg3=$("<img src='${pageContext.request.contextPath}/images/og3.png' class='ogImg2'>");
					var $newUl=$("<ul></ul>");
					var $newogName=$("<div class='ogName'>"+data[i].text+"</div>");
					$newimgSpan1.append($newogImg1);
					$newimgSpan2.append($newogImg3);
					$newOg.append($newInput);
					$newOg.append($newimgSpan1);
					$newOg.append($newimgSpan2);
					$newOg.append($newogName);
					$newLi.append($newOg);
					$newLi.append($newUl);
					$ul.append($newLi);
					organ.createNode(data[i].children,$newUl);
				}else{												//叶节点创建节点
					var $newLi=$("<li class='indent'></li>");
					var $newLast=$("<div class='last'></div>");
					var $newInput=$("<input type='hidden' value='"+data[i].id+"'/>");
					var $newimgSpan1=$("<span class='imgSpan'></span>");
					var $newogImg1=$("<img src='${pageContext.request.contextPath}/images/og4.png' class='ogImg2'>");
					var $newogName=$("<div class='ogName'>"+data[i].text+"</div>");
					$newimgSpan1.append($newogImg1);
					$newLast.append($newInput);
					$newLast.append($newimgSpan1);
					$newLast.append($newogName);
					$newLi.append($newLast);
					$ul.append($newLi);
				}
			}
		},
		show:function($ul){  
						//通过访问后台获得组织树list动态创建组织节点
			$.ajax({
				dataType:"JSON",
				url:"/zhdj/tree/recursiveTree",
				type:"POST",
				data:{RelUserLoginPowerId:RelUserLoginPowerId},
				success:function(data){
					organ.createNode(data,$ul);
					organ.set();
				}
			})
		},
		
		addName:function(){
			var uonName=$(".select").children().last().html();
			var id=$(".select").children().eq(0).val();
			
			var Hseluon=$("#Hseluon").val();
			var hasId=$("#hasId").val();
			if(!$("div").hasClass("select")){
				alert("请选择组织");
			}
			else{
				$("#Hseluon").val(Hseluon+uonName+',');
				$("#hasId").val(hasId+id+',');
			}
		},
		
		see:function(){
			var str=$('#Hseluon').val();
			var str=str.substring(0,str.length-1); //去掉后面的逗号
			/* var t=s.ToString().RTrim(','); */
			$('#uName').val(str);
			var str1=$('#hasId').val();
			var str1=str1.substring(0,str1.length-1); //去掉后面的逗号
			/* var t=s.ToString().RTrim(','); */
			$('#hasId').val(str1);
			$('#seeModal').modal();
			
			
		},
		
		confirmSel:function(){
			var uName=$('#uName').val();
			var uid=$('#hasId').val();
			location.href="${pageContext.request.contextPath}/base/goURL/weixin/sendUonproject?name="+uName+"&id="+uid
		},
		
		clear:function(){
			
			$('#clearModal').modal();
		},
		
		clearAll:function(){
			$("#Hseluon").val("");
			$("#hasId").val("");
		},
						
		set:function(){                      			//为节点设置事件
			$(".ogImg1").click(function(){  						//点击箭头图标让下级组织上滑下滑
				var og=$(this).parent().parent();
				if(!og.hasClass("active")){
					$(this).attr("src","${pageContext.request.contextPath}/images/og2.png");
					og.addClass("active");
					og.next().slideDown();
				}else{
					$(this).attr("src","${pageContext.request.contextPath}/images/og1.png");
					og.removeClass("active");
					og.next().slideUp();
				}
			})
			$(".og").each(function(){								//让所有下级上滑
				if(!$(this).hasClass("active")){
					$(this).next().slideUp();
				}
			})
			$(".og").click(function(){								//让组织点击时出现背景色	
				$(".og").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				$(".last").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				$(".ogTitle").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				
				$(this).addClass("select");
				
				
			})
			$(".last").click(function(){
				
				$(".og").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				$(".last").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				$(".ogTitle").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				$(this).addClass("select");
			})
			$(".ogTitle").click(function(){
				
				$(".og").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				$(".last").each(function(){
					if($(this).hasClass("select"))
						$(this).removeClass("select");
				})
				$(this).addClass("select");
			})
		}
	}
	organ.show($(".mainUl"));
	
  </script>
</body>
</html>
