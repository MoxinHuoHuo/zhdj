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
    		<table id="finishSubmitdg" title="完成情况审核" rownumbers="true" pagination="true"  singleSelect="true"
    		data-options="iconCls:'icon-layout-lightning',
			toolbar: '#finishSubmitTb'">
			<thead>
    				<tr>
    					<th data-options="field:'tastTitle',width:250">任务标题</th>
    					<th data-options="field:'submitName',width:250,align:'center'">提交者</th>
    					<th data-options="field:'finishTime',width:250,align:'center'">任务情况提交时间</th>
    					<th data-options="field:'finishReadOk',width:250,align:'center'">是否通过</th>
    				</tr>
    			</thead>
			</table>
			<div id="finishSubmitTb">
				<a href="#" class="easyui-linkbutton" iconCls="icon-report" plain="true" id="personfsh">本人完成情况</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-report" plain="true" id="myUnoprofsh">组织成员完成情况</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-report" plain="true" id="Unoprofsh">下级管理员完成情况</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-report plain="true" id="mypersonalfshste">查看私人完成情况</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-table-delete" plain="true" id="deleteStatesh">删除完成情况</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-table-go" plain="true" id="downfile">完成情况描述及附件下载</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-table-cell" plain="true" id="chaeckfinishSub">审核完成情况</a>
			</div>
    	</div>
    
    	<div id="finishSublog" class="easyui-dialog" title="计划内容" style="width:520px;padding:30px 70px 20px 120px" closed="true">
    			<div style="margin-bottom:10px;">
    				<div>完成情况描述：</div>
    				<textarea rows="5" id="finishContent" data-options="multiline:true" style="width:315px;height:150px;"></textarea>
    			</div>
    			<div style="margin-bottom:10px;">
    				<div>附件1:</div>
    				<input class="easyui-textbox" id="finishFile1" style="width:223px;">
    				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:25%; margin-left:10px;" id="fshdownload1">下载文件</a>
    			</div>
    			<div style="margin-bottom:10px;">
    				<div>附件2:</div>
    				<input class="easyui-textbox" id="finishFile2" style="width:223px;">
    				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:25%;margin-left:10px;" id="fshdownload2">下载文件</a>
    			</div>
    			<div style="margin-bottom:10px;">
    				<div>附件3:</div>
    				<input class="easyui-textbox" id="finishFile3" style="width:223px;">
    				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:25%;margin-left:10px;" id="fshdownload3">下载文件</a>
    			</div>
	    		<div>
	    			<br>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:95%;margin-left:5px;" onclick="$('#finishSublog').dialog('close')">确定</a>
	    		</div>
    	</div>
    	
    	<div id="finishSublog1" class="easyui-dialog" title="审核内容" style="width:480px;padding:30px 70px 45px 70px" closed="true">
    			<form id="finishSub" method="post" data-options="novalidate:true" enctype="multipart/form-data">
    			<div>
    			<div style="margin-bottom:20px">
					<div>审核意见:</div>
					<input class="easyui-textbox" name="finishContent" id="finishContent"  style="width:100%">
				</div>
					
	    			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:45%;margin-left:5px;" id="submitFsh">通过审核</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:45%;margin-left:15px;" id="submitFshno">不通过审核</a>
    			</div>
    			</form>
    	</div>
    
    <script type="text/javascript">
    var UserId='<%=session.getAttribute("loginUserId")%>';
	var TreeId='<%=session.getAttribute("loginTreeId")%>';
	
		$('#finishSubmitdg').datagrid({
			url:"/zhdj/ReadFinishCondition?userId="+UserId+"&distinction=1"
		});
  	
  		$('#personfsh').on('click',function(){
  			$('#finishSubmitdg').datagrid({
			url:"/zhdj/ReadFinishCondition?userId="+UserId+"&distinction=1"
		    });
  		})
  	
  		$('#Unoprofsh').on('click',function(){
  			$('#finishSubmitdg').datagrid({
			url:"/zhdj/ReadFinishCondition?userId="+UserId+"&distinction=Unit"
		    });
  		})
  		
  		$('#myUnoprofsh').on('click',function(){
  			$('#finishSubmitdg').datagrid({
			url:"/zhdj/ReadFinishCondition?userId="+UserId+"&distinction=Per"
		    });
  		})
  		$('#mypersonalfshste').on('click',function(){
  			$('#finishSubmitdg').datagrid({
  				url:"/zhdj/PerFinishRead?userId="+UserId,
  			 });
  			
  		})
  		
  		$('#downfile').on('click',function(){
  			var row = $('#finishSubmitdg').datagrid('getSelected');
  			
  			if(row){
  			$('#finishSublog').dialog('open');
  			$('#finishContent').val(row.finishOpinion);
  			$('#finishFile1').textbox('setValue',row.urlName[0]);
  			$('#finishFile2').textbox('setValue',row.urlName[1]);
  			$('#finishFile3').textbox('setValue',row.urlName[2]);
  			}
  		})
  		
  		$('#fshdownload1').on('click',function(){
  			var row = $('#finishSubmitdg').datagrid('getSelected');
  			var fileurlone=row.url[0];
  			window.open("/zhdj/DownFile?fileName="+fileurlone);
  		})
  		
  		$('#fshdownload2').on('click',function(){
  			var row = $('#finishSubmitdg').datagrid('getSelected');
  			var fileurltwo=row.url[1];
  			window.open("/zhdj/DownFile?fileName="+fileurltwo);
  		})
  		
  		$('#fshdownload3').on('click',function(){
  			var row = $('#finishSubmitdg').datagrid('getSelected');
  			var fileurlthree=row.url[2];
  			window.open("/zhdj/DownFile?fileName="+fileurlthree);
  		})
  		
  		$('#chaeckfinishSub').on('click',function(){
  			var row = $('#finishSubmitdg').datagrid('getSelected');
  			if(row){
  				$('#finishSublog1').dialog('open');
  			}
  		})
  		
  		$('#submitFsh').on('click',function(){
  			var row = $('#finishSubmitdg').datagrid('getSelected');
   			var finishSub = new FormData($("#finishSub")[0]);
   				finishSub.append('receiveUserId',UserId);
   				finishSub.append('finishId',row.finishId);
   				finishSub.append('finishReadOk',1);
   				finishSub.append('tastId',row.tastId);
   			if(row){
   				$.messager.confirm('提示','是否通过此完成情况？',function(r){
   					if(r){
   						$.ajax({
   							url:'/zhdj/CheckFinish',
   							dataType:'json',
   							type:'post',
   							data:finishSub,
   							processData: false,  // 告诉jQuery不要去处理发送的数据
    						contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
   							success:function(data){
   								if(data.status==-1){
   									alert("你无权对自己的计划进行审核");
   								}
   								else{
   								$('#finishSubmitdg').datagrid('reload');
   								alert("此完成情况已通过");
   								$('#finishSublog1').dialog('close');
   								}
   							}
   						})
   					}
   				})
   			}
  		})
  		
  		$('#submitFshno').on('click',function(){
  			var row = $('#finishSubmitdg').datagrid('getSelected');
   			var finishSub = new FormData($("#finishSub")[0]);
   				finishSub.append('receiveUserId',UserId);
   				finishSub.append('finishId',row.finishId);
   				finishSub.append('finishReadOk',0);
   				finishSub.append('tastId',row.tastId);
   			if(row){
   				$.messager.confirm('提示','是否不通过此完成情况？',function(r){
   					if(r){
   						$.ajax({
   							url:'/zhdj/CheckFinish',
   							dataType:'json',
   							type:'post',
   							data:finishSub,
   							processData: false,  // 告诉jQuery不要去处理发送的数据
    						contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
   							success:function(data){
   								if(data.status==-1){
   									alert("你无权对自己的计划进行审核");
   								}
   								else{
   								$('#finishSubmitdg').datagrid('reload');
   								alert("此完成情况已被拒绝通过");
   								$('#finishSublog1').dialog('close');
   								}
   							}
   						})
   					}
   				})
   			}
  		})
  		
  		$('#deleteStatesh').on('click',function(){
	    	var row=$('#finishSubmitdg').datagrid('getSelected');
	    	if(row){
	    		$.messager.confirm('提示','是否删除此完成情况？',function(r){
	    			if(r){
	    				$.ajax({
	    					url:"/zhdj/DeleteFinish",
	    					dataType:'json',
	    					type:'post',
	    					data:{userId:UserId,finshId:row.finishId},
	    					processData: false,  // 告诉jQuery不要去处理发送的数据
	    					contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
	    					success:function(){
	    						alert('此完成情况已删除');
	    						$('#finishSubmitdg').datagrid('reload');
	    					}
	    				})
	    			}
	    		})
	    	}
    })	
    </script>
  </body>
</html>
