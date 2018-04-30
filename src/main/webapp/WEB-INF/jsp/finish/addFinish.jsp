<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

  </head>
  
  <body class="easyui-layout">
    	<div id="content" region="center"style="width:1095px;height:800px">
    		<table id="finishStatedg" title="计划提交" rownumbers="true" pagination="true"  singleSelect="true">
			</table>
			<div id="finishStatetb">
				<a href="#" class="easyui-linkbutton" iconCls="icon-comment-edit" plain="true" id="checkstate">完成情况提交</a>
	
			</div>
    	</div>
    	
    	<div id="checkSta" class="easyui-dialog" title="内容" style="width:450px;padding:30px 70px 20px 70px" closed="true">
    		<form id="finishState" method="post" data-options="novalidate:true" enctype="multipart/form-data">
    			<div style="margin-bottom:10px;">
    				<div>附件1:</div>
    				<input class="easyui-filebox files" name="files" style="width:320px;">
    			</div>
    			<div style="margin-bottom:10px;">
    				<div>附件2:</div>
    				<input class="easyui-filebox files" name="files" style="width:320px;">
    			</div>
    			<div style="margin-bottom:10px;">
    				<div>附件3:</div>
    				<input class="easyui-filebox files" name="files" style="width:320px;">
    			</div>
    			<div style="margin-bottom:10px;">
    				<div>完成情况描述：</div>
    				<textarea rows="5" id="finishContent" name="finishContent" data-options="multiline:true" style="width:320px;height:150px;"></textarea>
    			</div>
    			<br>
  				<div>
    			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%;margin-left:5px;" id="comfirmState">提交完成情况</a>
    			</div>
    		</form>	
    	</div>
    
    <script type="text/javascript">
    var UserId='<%=session.getAttribute("loginUserId")%>';
    var TreeId='<%=session.getAttribute("loginTreeId")%>';
    	$('#finishStatedg').datagrid({
		url:"/zhdj/PerReceiveTest?userId="+UserId+"&treeId="+TreeId,
		iconCls:'icon-layout-header',
		toolbar: '#finishStatetb',
		columns:[[
	    	{field:'ck',checkbox:true},
	    	{field:'tastTitle',title:'任务标题',width:200},
			{field:'name',title:'发送任务者',width:200},
			{field:'startTime',title:'任务要求开始时间',width:250},
			{field:'finishTime',title:'任务要求完成时间',width:250,align:'center'},
			
			
	    ]]
	});
    
    $('.files').filebox({
    	buttonText:"选择文件"
    })
    
    $('#checkstate').on('click',function(){
    	var row = $('#finishStatedg').datagrid('getSelected');
    	if(row){
    		$('#checkSta').dialog('open');
    	}
    })
    
    $('#comfirmState').on('click',function(){
    	var row = $('#finishStatedg').datagrid('getSelected');
    	var finishState = new FormData($("#finishState")[0]);
    	/* if($('#finishContent').val()==null||$('#finishContent').val()==""){
    		$.messager.alert('提示','请对完成情况进行描述');
    	} */
    	/* else{ */
    		$.ajax({
    		url:"/zhdj/warning/ReferFinish?tastId="+row.tastId+"&userId="+UserId,
    		dataType:'json',
    		type:'post',
    		data:finishState,
    		processData: false,  // 告诉jQuery不要去处理发送的数据
			contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
    		success:function(data){
    			if(data.status==-2){
				$.messager.alert('提示','尚未通过审核');
			}if(data.status==-5){
				$.messager.alert('提示','请不要重复提交');
			}
			if(data.status==1){
				
    			$.messager.alert('提示','计划提交成功');
    			$('#finishStatedg').datagrid('reload');
    			$('#checkSta').dialog('close');
    		}
    		}
    	})
    	
    	
    })
    
   
    </script>
  </body>
</html>
