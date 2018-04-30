<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
<title>党员大会</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
	<title>智慧党建</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/easyui_animation.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/easyui_plus.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wu.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.insdep-extend.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
	<script type='text/javascript' src='/zhdj/dwr/engine.js'></script>
	<script type='text/javascript' src='/zhdj/dwr/interface/dwrDemo.js'></script>
<style type="text/css">
	#deleteWin p{
		margin-top:20px;
		text-align:center;
	}
	#deleteWin a{
		margin-left:20px;
		margin-top:40px;
	}
</style>
</head>
<body class="easyui-layout">
	<div id="content" region="center"style="width:1095px;height:800px">
		<table id="meetingComment" singleSelect="true"></table>
	</div>
	<div id="meetingTb" style="padding-top:0px">	
		<a class="easyui-linkbutton" onclick="meetingComment.deleteWin()" iconCls="icon-comment-delete" plain='true'>删除</a>
		<span style="margin-left:20px;margin-right:10px">查询</span>
		<span >根据会议标题查询：</span><input id="meetingTitle" type="text" style="width:150px"/>
		<a id="search" style="float: right;margin-right: 700px;" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	</div>
	
	<div id="deletewin" class="easyui-window" title="删除评论" modal="true" data-options="iconCls:'icon-save'" style="top:100px;width:300px;height:200px;padding:5px;" closed="true">
		<div style="margin-bottom:50px;margin-top:30px"><p style="margin:0 auto;width:160px;font-size:16px;">请问要删除此评论？</p></div>
		<div style="margin:0 auto;width:215px">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="meetingComment.deleteMeetingComment()">确认删除</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#deletewin').window('close')">取消删除</a>
		</div>
	</div>  
    <script type="text/javascript">
    	var TreeId='<%=session.getAttribute("loginTreeId")%>';
		$(function(){
		$("#meetingComment").datagrid({
			width:1195,
			url:"${proPath }" + '/zhdj/meeting/backGetComments?orgId='+TreeId,
			title:'评论列表',
			columns:[[
				{field:'id',title:'id',width:10},
				{field:'meetingTitle',title:'大会标题',width:35},
				{field:'commentator',title:'评论人',width:15},
				{field:'commentContent',title:'评论内容',width:55},
				{field:'commenttime',title:'评论时间',width:15}
			]],
			queryParams: {
			    	 meetingTitle:'%%'
				}, 
			pagination:true,
			fitColumns:true,
			toolbar:"#meetingTb",
		});
	});
	
	var meetingComment = {
		
		//打开删除窗口
		deleteWin:function(){
			if($(".datagrid-row-selected").size()==0){
				$.messager.alert('警告','请选择一项进行删除');
				return;
			}else if($(".datagrid-row-selected").size()>1){
				$.messager.alert('警告','请只选择一项进行删除');
				return;
			}
			$("#deletewin").window('open');
		},
		//删除会议
		deleteMeetingComment:function(){
			var id  = $(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text();
			$.ajax({
				   type: "POST",
				   url: "/zhdj/meeting/deleteComment",
				   data: {id:id},
				   success: function(data){
				   		if(data["status"] == 1){
						alert("操作成功");
						window.location.reload();
				   	}else{
						alert(data["message"]);
						window.location.reload();
				   	}
			   }
			});	
		}
	}
	
	//查询按钮的点击触发事件
	$("#search").click(function(){
		//var meetingId = $("#meetingId").val();
		var meetingTitle = $("#meetingTitle").val();
		$('#meetingComment').datagrid('load',{
					meetingTitle:'%'+ meetingTitle+'%'
				});
	})
  	</script>
</body>
</html>