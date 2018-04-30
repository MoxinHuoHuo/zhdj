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
   		<div id="content" region="center"style="width:1060px;height:800px">
   			<table id="projectShowdg" title="已下达任务" rownumbers="true" pagination="true"  singleSelect="true"
   			data-options="iconCls:'icon-chart-organisation',
			toolbar: '#projectshowtb'">
				<thead>
    				<tr>
    					<th data-options="field:'ck',checkbox:true"></th>
    					<th data-options="field:'tastType',width:130">任务标号</th>
    					<th data-options="field:'tastTitle',width:150">任务标题</th>
    					<th data-options="field:'name',width:250,align:'center'">接受任务方</th>
    					<th data-options="field:'startTime',width:200,align:'center'">任务开始时间</th>
    					<th data-options="field:'finishTime',width:200,align:'center'">任务要求完成时间</th>
    				</tr>
    			</thead>
			</table>
			<div id="projectshowtb">
			
			<a href="#" class="easyui-linkbutton" iconCls="icon-search"  plain="true" onclick="doSearch()">统计条件</a>
			<input id="tastType1" type="text" style="line-height:20px;border:2px solid #ccc">
			<a href="#" class="easyui-linkbutton" iconCls="icon-application-view-tile"  plain="true" onclick="stateAnl()">完成情况</a>
			</div>
   		</div>
   		
   		<div id="stateAnalyze" class="easyui-dialog" title="完成情况" style="width:300px;height:200px;padding:20px 70px 20px 70px" closed="true">
   				<table>
   					<tr>
   						<td>已完成：</td>
   						<td><div id="havefinish"></div></td>
   					</tr>
   					<tr>
   						<td>未完成：</td>
   						<td><div id="notfinish"></div></td>
   					</tr>
   					<tr>
   						<td>超时完成：</td>
   						<td><div id="overfinish"></div></td>
   					</tr>
   				</table>
   				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%;margin-left:5px;margin-top:10px;" onclick="$('#stateAnalyze ').dialog('close')">确定</a>
   		</div>
   		<!-- <div id="checkProshow" class="easyui-dialog" title="计划内容" style="width:450px;padding:30px 70px 20px 70px" closed="true">
    			<div style="margin-bottom:10px;">
    				<div>附件:</div>
    				<input class="easyui-textbox" id="projectFileshow" style="width:223px;">
    				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:20%;margin-left:10px;" id="downloadshow">下载文件</a>
    			</div>
  				任务内容:
  				<br>
  				<textarea rows="5" id="testcteshow" data-options="multiline:true" style="width:300px;height:150px;"></textarea>
    			<div>
    			<br>
    			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%;margin-left:5px;" onclick="$('#checkProshow ').dialog('close')">确定</a>
    		</div>
    	</div> -->
    
   		
   		<script type="text/javascript">
   		var UserId='<%=session.getAttribute("loginUserId")%>';
		var TreeId='<%=session.getAttribute("loginTreeId")%>';
		
   		$('#projectShowdg').datagrid({
		url:"/zhdj/GetTaskByYourSelf?userId="+UserId+"&type="+0
	});
   		
   	function stateAnl(){
   		var row = $('#projectShowdg').datagrid('getSelected');
   		if(row){
   			$.ajax({
   				url:'/zhdj/Count',
   				dataType:'json',
   				type:'post',
   				data:{tastType:row.tastType,
   					receiveUnit:row.receiveUnit},
   				success:function(data){
   					$('#stateAnalyze').dialog('open');
   		   			$('#havefinish').html(data.data.Finish);
   		   			$('#notfinish').html(data.data.unFinish);
   		   			$('#overfinish').html(data.data.longFinish);
   				}
   			})
   			
   		}
   		
   	}
   	
   		$('#tastType1').on('keypress',function(){
   		var tastType=$('tastType1').val();
   		$('#projectShowdg').datagrid({
		url:"/zhdj/SelectByTastType?tastType="+tastType+"&type="+0
	});
		stateAnl();
	})
   		/* function checkprojectshow(){
   		var row = $('#projectShowdg').datagrid('getSelected');
   		if(row){
   			$('#checkProshow').dialog('open');
	   		$('#testcteshow').val(row.tastContent);
	   		$('#projectFileshow').textbox('setValue',row.urlName);
   		}  		
   	}
   	
   	$('#downloadshow').on('click',function(){
   		var row = $('#projectShowdg').datagrid('getSelected');
   		var fileurl=row.testUrl;
   		window.open("/zhdj/DownFile?fileName="+fileurl);
   	})
   		
   		$('#deleteproject').on('click',function(){
   		var row = $('#projectShowdg').datagrid('getSelected');
   		if(row){
	   		$.messager.confirm('提示','是否删除此计划',function(r){
	   			if(r){
	   				$.ajax({
	   					url:'/zhdj/delete',
	   					dataType:'json',
	   					type:'post',
	   					data:{tastId:row.tastId},
	   					success:function(){
	   						$('#projectShowdg').datagrid('reload');
	   						$.messager.alert('提示','此计划已删除成功');
	   					} 
	   				})
	   			}
	   		})
   		};
   	}) */
   		
   		
   		</script>
  </body>
</html>
