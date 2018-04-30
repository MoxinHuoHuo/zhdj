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
<link rel='stylesheet' href='${pageContext.request.contextPath}/dist/css/pagination.css' />
<style type="text/css">
#ctInput{
	width: 96%;
	margin: 12px 2%;
	height: 45px;
	border-radius: 8px;
	border: 1px solid #d6d6d6;
	background-color: rgba(153,153,153,0.3);
	padding-left: 5%;
}
.ctContent{
	width: 90%;
	margin: 5px 5%;
	border:1px solid #666;
	border-top:5px solid #3498DB;
	padding: 3% 5%;
}
.am-footer{
	width: 100%;
	height: 70px;
	position: fixed;
	bottom: 0;
	padding: 0;
	border-top: 1px solid #666;
}
.stName{
	font-size:16px;
}
.stTime{
	position: absolute;
	right: 15%;
	font-size:15px;
}
.stCt{
	margin-top: 5px;
	margin-bottom: 5px;
	font-size:14px;
	color:#888;
}
</style>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default" style="height: 50px;">
	<div class="am-header-left am-header-nav" >
		<a href="javascript:history.go(-1)"><img class="am-header-icon-custom"
			src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
			alt="" style="margin-top:17px;">
		</a>
	</div>

	<h1 class="am-header-title" style="font-size: 23px;">会议评论</h1>
	</header>

	<div class="am-g" style="margin-top:20px;">
	  <div class="am-u-lg-8 am-u-sm-centered mainDiv">
	  </div>
	  <div class="m-style pageDiv" style="margin-bottom:80px;"></div>
	</div>
	
	<footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }" style="">
	  	<input type="text" name="" id="ctInput" placeholder="我来说两句.." onclick="comment.showCommentModal()">
	</footer>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="commentModal">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">说两句</div>
	    <div class="am-modal-bd">
	      <textarea id="view" rows="2" style="font-size:18px;width:100%;padding:3px;"></textarea>
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
	    </div>
	  </div>
	</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script>
<script src='${pageContext.request.contextPath}/dist/js/jquery.pagination.js'></script>
<script type="text/javascript">
var mtId=<%=request.getParameter("mtId")%>;
var relUserLoginName="<%=session.getAttribute("RelUserLoginName")%>";
var currentPage=<%=request.getParameter("currentPage")%>;
var comment={
	getCommentList:function(){							//从后台获得会议数据，并调用createMTNode方法创建会议列表				
		if(!currentPage)
			currentPage=1;
		$.ajax({
			url:'meeting/getComment',
			dataType:'JSON',
			type:'GET',
			data:{
				meetingId:mtId,
				start:currentPage
			},
			success:function(data){
				for(i in data.rows)
					comment.createMTNode(data.rows[i]);
				var	total=total%10==0?Math.floor(data.total/10):Math.floor(data.total/10)+1;
				$('.pageDiv').pagination({					//初始化分页组件
					mode: 'fixed',
				    pageCount: total,
				    current:currentPage,
				    showData:10,
				    isHide:true,
				    callback: function (api) {
				    	location.href="${pageContext.request.contextPath}/base/goURL/weixin/mtComment?mtId="+mtId+"&currentPage="+api.getCurrent();
				    }
				});
			}
		})
	},
	createMTNode:function(data){						//根据数据创建每一条评论列表
		
		var $newImg=$("<img src='images/ct1.png' width='22px' height='22px;'>&nbsp;<span class='stName'><b>"+data.commentator+"</b></span>");
		var $newSpan=$("<span class='stTime' >"+data.commenttime+"</span>");
		var $newP=$("<p class='stCt'>"+data.commentContent+"</p>");
		var $newDiv=$("<div class='ctContent' style='margin-bottom: 20px;'></div>");
		$newDiv.append($newImg);
		$newDiv.append($newSpan);
		$newDiv.append($newP);
		$(".mainDiv").append($newDiv);
	},
	showCommentModal:function(){						//展示评论模态框
		$("#commentModal").modal({
			relatedTarget: this,
	        onConfirm: function() {
	          $.ajax({
	          	url:'/zhdj/meeting/comment',
				dataType:'JSON',
				type:'POST',
				data:{
					meetingId:mtId,
					commentContent:$("#view").val(),
					commentator:relUserLoginName
				},
				success:function(data){
					alert(data.message);
					if(data.status==1)
						location.reload();
				}
	          })
	        },
		});
	}
}
comment.getCommentList();	
  </script>
	<center>粤icp备09004280号</center>
</body>
</html>
