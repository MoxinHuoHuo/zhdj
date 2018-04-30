<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
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
	<style type="text/css">
		
	</style>
</head>
  
  	<body>
  	<div id="content" region="center"style="width:1090px;height:600px;">
	  	<table id="historydg" title="历史人员" rownumbers="true" pagination="true"  singleSelect="true">
		</table>
		<div id="historytb" style="display:none;">
			<a href="javascript:void(0)" id="remagain" class="easyui-linkbutton" data-options="iconCls:'icon-delete',plain:true">彻底删除</a>
			<a href="javascript:void(0)" id="change" class="easyui-linkbutton" data-options="iconCls:'icon-user-go',plain:true">转为人员</a>
		</div>
	</div>
	<script type="text/javascript">
	var UserId='<%=session.getAttribute("loginUserId")%>';
	var treeId='<%=session.getAttribute("loginTreeId")%>';
	$('#historydg').datagrid({
		url:"/zhdj/user/selectByHistory?history="+1+"&treeId="+treeId,
		iconCls:'icon-user-business-boss',
		toolbar: '#historytb',
		columns:[[
	    	{field:'ck',checkbox:true},
	    	/* {field:'userId',title:'ID',width:25}, */
			{field:'userName',title:'姓名',width:300,align:'center'},
			{field:'tel',title:'手机号码',width:300,align:'center'},
			{field:'text',title:'原所在组织',width:300,align:'center'}
	    ]]
	})
	//click是点击事件，datagrid展示列表，getSelected，所选的哪一行
$('#remagain').on('click',function(){
	var row = $('#historydg').datagrid('getSelected');
	if(row){
		$.messager.confirm('提示','是否彻底删除该人员？',function(r){
			if(r){
				$.ajax({
					url:"/zhdj/user/DeleteUser?userId="+row.userId,
					dataType:'json',
					type:'post',
					data:{
						history:'',
						LoginId:UserId
					},
					success:function(){
						alert("该人员已彻底删除！");
						$('#historydg').datagrid('reload');
						
					}
				})
			}
		});
	}
})


$('#change').on('click',function(){
	var row = $('#historydg').datagrid('getSelected');
	if(row){
		$.messager.confirm('提示','是否转为人员?',function(r){
			if(r){
				$.ajax({
					url:"/zhdj/user/makeHistory",
					dataType:'json',
					type:'post',
					data:{userId:row.userId,
						  LoginId:UserId
						 				
					},
					success:function(data){
						if(data.status==-1){
							$.messager.alert('提示','你可能无权修改非自己组织人员信息，如不是，请再尝试');
						}else{
						alert("已成功转为人员!");
						$('#historydg').datagrid('reload');
						
					} 
					}
				})
			}
		});
	}
})
	</script>
	</body>
</html>
