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
    		<table id="projectsentdg" title="计划提交" rownumbers="true" pagination="true"  singleSelect="true">
			</table>
			<div id="projectsenttb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-control-blank" plain="true" onclick="checkproject()">查看任务内容</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-application-edit" plain="true" id="submitproject">编辑计划</a>
			
			</div>
    	</div>
    	
    	<div id="checkPro" class="easyui-dialog" title="计划内容" style="width:520px;padding:30px 70px 20px 110px" closed="true">
    			<div style="margin-bottom:10px;">
    				<div>附件:</div>
    				<input class="easyui-textbox" id="projectFile" style="width:223px;">
    				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:22%;margin-left:8px;" id="download">下载文件</a>
    			</div>
  				任务内容:
  				<br>
  				<textarea rows="5" id="testcte" readonly="readonly" data-options="multiline:true" style="width:300px;height:150px;"></textarea>
    			<div>
    			<br>
    			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:90%;margin-left:3px;" onclick="$('#checkPro').dialog('close')">确定</a>
    		</div>
    	</div>
    	
    	<div id="Editpro" class="easyui-dialog" title="编辑新闻" style="width:400px;padding:30px 70px 20px 70px" closed="true">
			<form id="editpro" method="post" data-options="novalidate:true" enctype="multipart/form-data">
				<div style="margin-bottom:20px">
					<div>计划内容:</div>
					<textarea rows="5" name="taskName" id="testcontentpro" data-options="multiline:true" style="width:280px;height:150px;"></textarea>
				</div>
				<div style="margin-bottom:20px">
					<div>计划开始时间:</div>
					<input class="easyui-datetimebox" name="doStartTime" id="doStartTime"  style="width:100%">
				</div>
				<div style="margin-bottom:20px">
					<div>计划完成时间:</div>
					<input class="easyui-datetimebox" name="doFinishTime" id="doFinishTime"  style="width:100%">
				</div>
				<div style="margin-bottom:20px">
					<div>任务执行地点:</div>
					<input class="easyui-textbox" name="doWhere" id="doWhere"  style="width:100%">
				</div>
				<div>
					<a href="javaScript:sub()" id="submitpro" class="easyui-linkbutton" style="width:100%;">提交计划</a>
				</div>
			</form>
	</div>
    	
   	<script type="text/javascript">
   		var UserId='<%=session.getAttribute("loginUserId")%>';
		var TreeId='<%=session.getAttribute("loginTreeId")%>';
		
   		$('#projectsentdg').datagrid({
		url:"/zhdj/PerReceiveTest?userId="+UserId+"&treeId="+TreeId,
		iconCls:'icon-book-next',
		toolbar: '#projectsenttb',
		columns:[[
	    	{field:'ck',checkbox:true},
			{field:'tastTitle',title:'任务标题',width:200},
			{field:'name',title:'发送任务者',width:200},
			{field:'startTime',title:'任务要求开始时间',width:250},
			{field:'finishTime',title:'任务要求完成时间',width:250,align:'center'},
			
	    ]]
	});
   	
   	function checkproject(){
   		var row = $('#projectsentdg').datagrid('getSelected');
   		if(row){
   			$('#checkPro').dialog('open');
	   		$('#testcte').val(row.tastContent);
	   		$('#projectFile').textbox('setValue',row.urlName);
   		}  		
   	}
   	
   	$('#download').on('click',function(){
   		var row = $('#projectsentdg').datagrid('getSelected');
   		var fileurl=row.testUrl;
   		window.open("/zhdj/DownFile?fileName="+fileurl);
   	})
   	
   	$('#submitproject').on('click',function(){
   		var row = $('#projectsentdg').datagrid('getSelected');
   		if(row){
   			$('#Editpro').dialog('open');
   			$('#tastTitle1').val(row.tastTitle);
   			/* $('#doStartTime').datetimebox('setValue',row.startTime);
   			$('#doFinishTime').datetimebox('setValue',row.finishTime); */
   			/* $('#testcontentpro').val(row.tastContent); */
   			
   		};
   	})
   	
   	function sub(){ 
 		var row = $('#projectsentdg').datagrid('getSelected');
		var editpro = new FormData($("#editpro")[0]);//如果把数据加到对象里面，需要加上processData:false,
		editpro.append('submitUserId',UserId);
			editpro.append('tastId',row.tastId);
  			$.messager.confirm('提示','是否提交此计划',function(r){
  				
  				if(r){
  					
  					$.ajax({
		   				url:'/zhdj/submit/add',
		   				dataType:'json',
		   				type:'post',
		   				processData:false,
		   				contentType:false,
		   				data:editpro,
	   					success:function(data){
	   						if(data.status==-1){
	   							$.messager.alert('提示','改任务对应的计划已经提交，请不要重复提交');
	   						}
	   						else{
	   							$('#projectsentdg').datagrid('reload');
			   					$.messager.alert('提示','计划已提交成功，等待审核');
			   					$('#Editpro').dialog('close');
	   						};
		   				}
	  			    })
  				}
  			});
 		}
 		
 		
   	/* $('#submitpro').on('click',function(){ 
   				var row = $('#projectsentdg').datagrid('getSelected');
				var editpro = new FormData($("#editpro")[0]);
					editpro.append('tastId',row.tastId);
	   			$.messager.confirm('提示','是否提交此计划',function(r){
	   				if(r){
	   					$.ajax({
		   				url:'/zhdj/submit/add',
		   				dataType:'json',
		   				type:'post',
		   				data:editpro,
		   				success:function(){
		   					$('#projectsentdg').datagrid('reload');
		   					$.messager.alert('提示','计划已提交成功，等待审核');
		   					$('#Editpro').dialog('close');
		   				}
	   			    })
	   				}
	   			});
   			});
  */
   	</script>
  </body>
</html>
