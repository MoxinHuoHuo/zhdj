<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
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
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.insdep-extend.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
		body { font:12px/1.2em Microsoft YaHei;}
	
		a,
		a:link { color:#000; text-decoration:none; outline:none;}
		a:hover,
		a:focus { text-decoration:none; color:#39f;}
		
		.pd3 { padding:3px;}
		.pd5 { padding:5px;}
		.pd10 { padding:10px;}
		
		label,
		button,
		input,
		select,
		textarea { font-size:12px; vertical-align: middle;}
		
		input,
		button,
		select,
		textarea { font:12px/1.2em Microsoft YaHei;}
		
		select,
		button,
		input[type="button"],
		input[type="reset"],
		input[type="submit"],
		input[type="radio"],
		input[type="checkbox"] { cursor: pointer;}
		
		.tabs-tool { border-top:0;}
		.wu-text,
		.wu-textarea { padding:3px; border:1px #95b8e7 solid; width:260px;}
		.wu-text { height:14px; line-height:14px; }
		
		.wu-header { height:55px; position:relative; z-index:0; overflow:hidden; border-bottom:1px #95b8e7 solid; background:url(/zhdj/images/304173773636600583.jpg) bottom repeat-x;}
		.wu-header-left { position:absolute; z-index:2; left:35px; top:10px;}
		.wu-header-left h1 { font:27px/27px Verdana; color:#fff;}
		.wu-header-right { font:12px/12px Verdana; position:absolute; z-index:1; right:40px; top:10px; color:#fff; text-align:right;}
		.wu-header-right p { line-height:10px;margin-bottom:10px;}
		.wu-header-right a { color:#fff;}
		
		.wu-sidebar { width:160px;}
		.wu-side-tree .tree-node { padding:3px 0px; }
		.wu-side-tree a { display:block;}
		.wu-side-tree .tree-node-selected { padding:2px 0; border:1px #fade23 solid;}
		
		.wu-toolbar-button,
		.wu-toolbar-search { padding:3px 5px;}
		
		.wu-footer { height:20px; padding:5px; text-align:center; overflow:hidden; background-color:#F2F2F2;}
	</style>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header" data-options="region:'north',border:false,split:true">
    	<div class="wu-header-left">
        	<h1><strong>智慧党建</strong></h1>
        </div>
        <div class="wu-header-right">
        	<p><strong class="easyui-tooltip" title="2条未读消息"><%=session.getAttribute("loginUserName")%></strong>，欢迎您！</p>
            <p><a id="loginout" href="#">安全退出</a></p>
        </div>
    </div>

	<div class="wu-sidebar" style="width:210px;font-size:15px;" data-options="region:'west',split:true,border:true,title:'导航菜单'"> 
    	<div class="easyui-accordion" data-options="border:false,fit:true"> 
        	<div title="基础资料" data-options="iconCls:'icon-application-cascade'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">         
                    <li data-options="iconCls:'icon-group'"><a href="javascript:void(0)" data-icon="icon-group" data-link="${pageContext.request.contextPath}/base/goURL/function/tree" iframe="true">组织与机构</a></li>
                    <li iconCls="icon-user-business-boss"><a href="javascript:void(0)" data-icon="icon-user-business-boss" data-link="${pageContext.request.contextPath}/base/goURL/function/history">历史人员</a></li>  
                   
                </ul>
            </div>
            <div title="任务管理" data-options="iconCls:'icon-application-form-edit'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-table-cell"><a href="javascript:void(0)" data-icon="icon-table-cell" data-link="${pageContext.request.contextPath}/base/goURL/task/tastsent" iframe="1">任务发布</a></li>
                	 <li iconCls="icon-application-cascade"><a href="javascript:void(0)" data-icon="icon-application-cascade" data-link="${pageContext.request.contextPath}/base/goURL/task/projectShow" iframe="0">已下达任务</a></li>
                    <li iconCls="icon-book-next"><a href="javascript:void(0)" data-icon="icon-book-next" data-link="${pageContext.request.contextPath}/base/goURL/task/prijectsent" iframe="0">计划提交</a></li>
                    <li iconCls="icon-layout-edit"><a href="javascript:void(0)" data-icon="icon-layout-edit" data-link="${pageContext.request.contextPath}/base/goURL/task/projectSubmit" iframe="0">计划审核</a></li>
                    <li iconCls="icon-layout-header"><a href="javascript:void(0)" data-icon="icon-layout-header" data-link="${pageContext.request.contextPath}/base/goURL/finish/addFinish" iframe="0">任务完成情况</a></li>
                    <li iconCls="icon-layout-lightning"><a href="javascript:void(0)" data-icon="icon-layout-lightning" data-link="${pageContext.request.contextPath}/base/goURL/finish/finishSubmit" iframe="0">情况审核</a></li>
                </ul>
            </div>
            <div title="党员大会" data-options="iconCls:'icon-creditcards'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="${pageContext.request.contextPath}/base/goURL/meeting/meeting" iframe="1">会议召开</a></li>
                    <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="${pageContext.request.contextPath}/base/goURL/meeting/meeting_comment" iframe="1">会议评论</a></li>
                    <li iconCls="icon-user-edit"><a href="javascript:void(0)" data-icon="icon-user-edit" data-link="${pageContext.request.contextPath}/base/goURL/meeting/meeting_sign" iframe="1">签到情况</a></li>
                    <!-- <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="temp/layout-3.html" iframe="0">会议日志</a></li> -->                                 
                </ul>
            </div>
            <div title="预警提醒" data-options="iconCls:'icon-cart'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                    <li iconCls="icon-lightbulb"><a href="javascript:void(0)" data-icon="icon-lightbulb" data-link="${pageContext.request.contextPath}/base/goURL/warning/getWarning" iframe="1">预警查看</a></li>
                    <li iconCls="icon-lightbulb-off"><a href="javascript:void(0)" data-icon="icon-lightbulb-off" data-link="${pageContext.request.contextPath}/base/goURL/warning/handleWarning" iframe="1">处理预警</a></li>
                
                </ul>
            </div>
            <div title="数据分析" data-options="iconCls:'icon-bricks'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="${pageContext.request.contextPath}/base/goURL/count/stateAnalyze" iframe="1">任务情况</a></li>
                  
                </ul>
            </div>
            <div title="新闻中心" data-options="iconCls:'icon-chart-curve'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
    			
                	<li iconCls="icon-layout"><a href="javascript:void(0)" data-icon="icon-layout" data-link="${pageContext.request.contextPath}/base/goURL/news/news" iframe="0">新闻</a></li>
                	
                   
                   
                </ul>
            </div>
            
        </div>
    </div>	
    <!-- end of sidebar -->    
    <!-- begin of main -->
    <div class="wu-main" data-options="region:'center'">
        <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">  
            <div title="首页" data-options="href:'temp/layout-1.html',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
        </div>
    </div>
    <!-- end of main --> 
    <!-- begin of footer -->
	<div class="wu-footer" style="background:#F2F2F2" data-options="region:'south',border:true,split:true">
    	&copy; 2017 Wu All Rights Reserved
    </div>
    <!-- end of footer -->  
    <script type="text/javascript">
		$(function(){
			$('.wu-side-tree a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe')==1?true:false;
				addTab(title,url,iconCls,iframe);
			});	
		})
		
		/**
		* Name 载入树形菜单 
		*/
		$('#wu-side-tree').tree({
			url:'temp/menu.php',
			cache:false,
			onClick:function(node){
				var url = node.attributes['url'];
				if(url==null || url == ""){
					return false;
				}
				else{
					addTab(node.text, url, '', node.attributes['iframe']);
				}
			}
		});
		
		/**
		* Name 选项卡初始化
		*/
		$('#wu-tabs').tabs({
			tools:[{
				iconCls:'icon-reload',
				border:false,
				handler:function(){
					$('#wu-datagrid').datagrid('reload');
				}
			}]
		});
			
		/**
		* Name 添加菜单选项
		* Param title 名称
		* Param href 链接
		* Param iconCls 图标样式
		* Param iframe 链接跳转方式（true为iframe，false为href）
		*/	
		function addTab(title, href, iconCls, iframe){
			var tabPanel = $('#wu-tabs');
			if(!tabPanel.tabs('exists',title)){
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
				if(iframe){
					tabPanel.tabs('add',{
						title:title,
						content:content,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
				else{
					tabPanel.tabs('add',{
						title:title,
						href:href,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
			}
			else
			{
				tabPanel.tabs('select',title);
			}
		}
		/**
		* Name 移除菜单选项
		*/
		function removeTab(){
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab){
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
		
		$('#loginout').on('click',function(){
			$.messager.confirm('提示','是否退出？',function(r){
				if(r){
					$.ajax({
						url:'/zhdj/logout',
						dataType:'json',
						type:'post',
						success:function(){
							$.messager.alert('提示','退出登录成功')
							
						}
					})
					location.href="/zhdj/base/goURL/main/Login"
					
				}
			})
			
		})
	</script>
</body>
</html>
