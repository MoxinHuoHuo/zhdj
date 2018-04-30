<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="组织成员">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
  	<meta content="telephone=no" name="format-detection" />
  	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/lib/weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-weui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/demos/css/demos.css">
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<style type="text/css">
		 table{  
            table-layout: fixed;/*只有定义表格的算法为fixed,th才有效果*/  
            border-collapse: collapse;/*边框合并模式*/  
        }  
        table tr td{  
            overflow:hidden;/*超出的文字隐藏*/  
            text-overflow:ellipsis;/*文字超出后,显示省略号*/  
            width:100%;
            white-space:nowrap;/*文字不换行*/  
            word-break:keep-all;/*文字不换行*/  
        }  
	</style>
</head>
<body ontouchstart>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.back(-1)" class="">
          <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

		<div class="am-header-right am-header-nav">
			<a href="${pageContext.request.contextPath}/base/goURL/weixin/main" class="">
				主页
			</a>
		</div>

      <h1 class="am-header-title" style="font-size: 1.2em">
          组织成员
      </h1>
  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title " style="font-size: 1.1em">
	        成员列表
	    </h2>
<shiro:hasAnyRoles  name="superAdmin,admin,secretary">
	    <nav class="am-titlebar-nav">
	        <button id="add" style="margin-bottom: 0.3em;width: 55%" type="button" class="am-btn am-btn-sm am-btn-primary am-radius">
	               <i class="am-icon-plus-square"></i>&nbsp;添加成员</button>
	    </nav>
	    </shiro:hasAnyRoles>
   </div>

   <div data-am-widget="tabs"
       class="am-tabs am-tabs-default"
        >
      <ul class="am-tabs-nav am-cf">
          <li class="am-active" id="tab1">
          <a href="javascript:void(0)" >当前成员</a>
          </li>
          <li class="" id="tab2"><a href="[data-tab-panel-1]">历史成员</a></li>
          
          
         
      </ul>
      <div class="am-tabs-bd">
          <div data-tab-panel-0 class="am-tab-panel panel1 am-active">
          		<div class="am-g" style="margin-left: 10px;">
          			<div class="am-u-sm-2" style="padding-left: 0px;padding-right: 0px;">
          				<img src="${pageContext.request.contextPath}/images/shuji.png" width="15"><span style="font-size: 1px;position: relative;">书记</span>
          			</div>
          			<div class="am-u-sm-4" style="padding-left: 0px;position: relative;right: 0px;">
          				<img src="${pageContext.request.contextPath}/images/mg3.png" width="11"><span style="font-size: 2px;">流动党员管理员</span>
          			</div>
          			<div class="am-u-sm-3" style="padding-left: 0px;position: relative;left: 7px;">
          				<img src="${pageContext.request.contextPath}/images/gl.png" width="11"><span style="font-size: 4px;">管理员</span>
          			</div>
          			<div class="am-u-sm-3" style="padding-left: 0px;">
          				<img src="${pageContext.request.contextPath}/images/mg4.png" width="12"><span style="font-size: 5px;">普通党员</span>
          			</div>
          		</div>
            	<table class="am-table  am-table-hover table-main">
	  				<thead>
	  					<tr>
	  						<td align="center">姓名</td>
	  						<td align="center">手机号码</td>
	  						<td align="center">操作</td>
	  					</tr>
	  				</thead>
	  				<tbody id="tbody1">
	  					
	  				</tbody>
  				</table>
  				<div id="pagenow"></div>

          </div>
          <div data-tab-panel-1 class="am-tab-panel panel2">
          		<div class="am-g" style="margin-left: 10px;">
          			<div class="am-u-sm-2" style="padding-left: 0px;padding-right: 0px;">
          				<img src="${pageContext.request.contextPath}/images/shuji.png" width="15"><span style="font-size: 1px;position: relative;">书记</span>
          			</div>
          			<div class="am-u-sm-4" style="padding-left: 0px;position: relative;right: 0px;">
          				<img src="${pageContext.request.contextPath}/images/mg3.png" width="11"><span style="font-size: 2px;">流动党员管理员</span>
          			</div>
          			<div class="am-u-sm-3" style="padding-left: 0px;position: relative;left: 7px;">
          				<img src="${pageContext.request.contextPath}/images/gl.png" width="11"><span style="font-size: 4px;">管理员</span>
          			</div>
          			<div class="am-u-sm-3" style="padding-left: 0px;">
          				<img src="${pageContext.request.contextPath}/images/mg4.png" width="12"><span style="font-size: 5px;">普通党员</span>
          			</div>
          		</div>
            	<table class="am-table  am-table-hover table-main">
	  				<thead>
	  					<tr>
	  						<td align="center">姓名</td>
	  						<td align="center">手机号码</td>
	  						<td align="center">操作</td>
	  					</tr>
	  				</thead>
	  				<tbody id="tbody2">
	  					
	  					
	  				</tbody>
  				</table>
  				<div id="pagehit"></div>

          </div>
		  <center><div>粤icp备09004280号</div></center>
      </div>
  </div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="prompt">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd"><lable>添加成员</lable></div>
		    <div class="am-modal-bd">
		      	<form id="addCY" class="am-form" method="post" data-options="novalidate:true" enctype="multipart/form-data">
		      		<div class="am-form-group">
				      <label style="float: left">姓名:</label>
				      <input type="text" class="" name="" placeholder="请输入姓名" id="userName1">
				    </div>
				    <div class="am-form-group">
				      <label style="float: left">电话号码:</label>
				      <input type="text"  onkeyup="value=value.replace(/[^\d]/g,'')" name="" placeholder="请输入电话号码" id="tel1">
				    </div>
				    <div class="am-g">
				    	<label style="float: left;">身份:</label>
				    	<select data-am-selected="{btnWidth: '100%'}" id="shenfen1">
				    	  <option value=""></option>
						  <option value="1">书记</option>
						  <option value="2">管理员</option>
						  <option value="3">普通党员</option>
						  <option value="5">流动党员管理员(最高级使用)</option>
						</select>
					</div>
		      	</form>
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确认</span>
		    </div>
		  </div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="prompt2">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd"><lable>修改成员</lable></div>
		    <div class="am-modal-bd">
		      	<form id="editCY" class="am-form" method="post" data-options="novalidate:true" enctype="multipart/form-data">
		      		<div class="am-form-group">
				      <label style="float: left">姓名:</label>
				      <input type="text" class="" name="" placeholder="请输入姓名" id="userName2">
				    </div>
				    <div class="am-form-group">
				      <label style="float: left">电话号码:</label>
				      <input type="text"  onkeyup="value=value.replace(/[^\d]/g,'')" name="" placeholder="请输入电话号码" id="tel2">
				    </div>
				    <div class="am-g">
				    	<label style="float: left;">身份:</label>
				    	<select data-am-selected="{btnWidth: '100%'}" id="shenfen2">
				    	  <option value=""></option>
						  <option value="1">书记</option>
						  <option value="2">管理员</option>
						  <option value="3">普通党员</option>
						  <option value="5">流动党员管理员(最高级使用)</option>
						</select>
					</div>
		      	</form>
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确认</span>
		    </div>
		  </div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="xiugaiMM">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否将密码重置为12345678
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="hist">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否转为历史人员？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>
	
	<div class="am-modal am-modal-prompt" tabindex="-1" id="hist1">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否将其恢复为当前党员？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="delet">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否删除该人员？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="delet2">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否删除该人员？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>

  	<script src="${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/dist/lib/fastclick.js"></script>
	<script>

	var treeId=<%=request.getParameter("id")%>;
	var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>; 
	var loginUserId=<%=session.getAttribute("RelUserLoginId")%>; 
	
	$('#tab2').on('click',function(){	
		$('#add').hide();
	})
		
	$('#tab1').on('click',function(){
		$(document.getElementById("add")).show();
	})
	
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  //解决自适应问题
       var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/365;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=365, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=365, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=365, user-scalable=no, target-densitydpi=device-dpi">');
       }
	</script>
	<script src="${pageContext.request.contextPath}/dist/js/jquery-weui.js"></script>
		<script type="text/javascript">
		//上滑选择菜单
		$(document).on("click", "#show-actions", function() {
		var id=$(this).next().val();
        $.actions({
          title: "选择操作",
          onClose: function() {
            console.log("close");
          },
          actions: [
            {
              text: "修改信息",
              className: "color-primary",
              onClick: function() {
                	 $('#prompt2').modal({
			         relatedTarget: this,
			         onConfirm: function(e) {
			         	if(!$("#userName2").val())
		      				alert("请输入姓名");
		      			if(!$("#tel2").val())
		      				alert("请输入电话号码");
		      			if($('#shenfen2>option:selected').val()=="")
		      				alert("请选择身份");
		      			if($("#userName2").val()&&$("#tel2").val()&&$('#shenfen2>option:selected').val()!=""){
		      		 var editCY=new FormData($('#editCY')[0]);
		      			editCY.append('',$('#shenfen').val());
		      		$.ajax({
		      			url:'${pageContext.request.contextPath}/User/UpdateUser',
		      			dataType:'json',
		      			type:'post',
		      			data:{
		      				LoginId: loginUserId,
		      				tel:$("#tel2").val(),
		      				userName:$("#userName2").val(),
		      				roleId:$('#shenfen2>option:selected').val(),
		      				userId:id
		      			},
		      			success:function(data){
		      				alert(data.message);
		      				location.reload();
		      			}
		      		})
		      		}
		      },
		      
		      onCancel: function(e) {
		      	$('#prompt2').modal('close');
		      }
		    });
             } 
            },
            {
              text: "重置密码",
              className: "color-warning",
              onClick: function() {
	              $('#xiugaiMM').modal({
			      relatedTarget: this,
			      onConfirm: function(e) {
			      	$.ajax({
			      		url:'${pageContext.request.contextPath}/User/ChangePassword',
			      		dataType:'json',
			      		type:'post',
			      		data:{
			      			userId:id
			      		},
			      		success:function(data){
			      			alert(data.message);
			      		}
			      	})
			      },
			      onCancel: function(e) {
			      	$('#xiugaiMM').modal('close');
			      }
		    	});
              }
            },
            {
              text: "转为历史人员",
              className: 'color-danger',
              onClick: function() {
                $('#hist').modal({
			      relatedTarget: this,
			      onConfirm: function(e) {
			      	$.ajax({
			      		url:'${pageContext.request.contextPath}/User/MakeHistory',
			      		dataType:'json',
			      		type:'post',
			      		data:{
			      			history:1,
			      			userId:id,
			      			loginId:loginUserId,
			      		},
			      		success:function(data){
			      			alert(data.message);
			      			location.reload();
			      		}
			      	})
			      },
			      onCancel: function(e) {
			      	$('#hist').modal('close');
			      }
		    	});
              }
            },
             {
              text: "删除该人员",
              className: 'color-danger',
              onClick: function() {
                $('#delet').modal({
			      relatedTarget: this,
			      onConfirm: function(e) {
			      	$.ajax({
			      		url:'${pageContext.request.contextPath}/User/DeleteUser',
			      		dataType:'json',
			      		type:'post',
			      		data:{
			      			userId:id,
			      			loginId:loginUserId,
			      		},
			      		success:function(data){
			      			alert(data.message);
			      			location.reload();
			      		}
			      	})
			      },
			      onCancel: function(e) {
			      	$('#delet').modal('close');
			      }
		    	});
              }
            }
          ]
        });
      });
      
      $(document).on("click", "#show-actions1", function() {
		var id=$(this).next().val();
        $.actions({
          title: "选择操作",
          onClose: function() {
            console.log("close");
          },
          actions: [
            {
              text: "恢复为当前党员",
              className: 'color-primary',
              onClick: function() {
                $('#hist1').modal({
			      relatedTarget: this,
			      onConfirm: function(e) {
			      	$.ajax({
			      		url:'${pageContext.request.contextPath}/User/MakeHistory',
			      		dataType:'json',
			      		type:'post',
			      		data:{
			      			history:0,
			      			userId:id,
			      			loginId:loginUserId,
			      		},
			      		success:function(data){
			      			if(data.status==1)
			      				alert("恢复为当前党员成功。");
			      			location.reload();
			      		}
			      	})
			      },
			      onCancel: function(e) {
			      	$('#hist1').modal('close');
			      }
		    	});
              }
            },
             {
              text: "删除该人员",
              className: 'color-danger',
              onClick: function() {
                $('#delet').modal({
			      relatedTarget: this,
			      onConfirm: function(e) {
			      	$.ajax({
			      		url:'${pageContext.request.contextPath}/User/DeleteUser',
			      		dataType:'json',
			      		type:'post',
			      		data:{
			      			userId:id,
			      			loginId:loginUserId,
			      		},
			      		success:function(data){
			      			alert(data.message);
			      			location.reload();
			      		}
			      	})
			      },
			      onCancel: function(e) {
			      	$('#delet').modal('close');
			      }
		    	});
              }
            }
          ]
        });
      });

	//人员添加弹窗
	$(function() {
	  $('#add').on('click', function() {
		    $('#prompt').modal({
		      relatedTarget: this,
		      onConfirm: function(e) {
		      		if(!$("#userName1").val())
		      			alert("请输入姓名");
		      		if(!$("#tel1").val())
		      			alert("请输入电话号码");
		      		if($('#shenfen1>option:selected').val()=="")
		      			alert("请选择身份")
		      		if($("#userName1").val()&&$("#tel1").val()&&$('#shenfen1>option:selected').val()!=""){
		      		var addCY=new FormData($('#addCY')[0]);
		      			addCY.append('',$('#shenfen').val());
		      		$.ajax({
		      			url:'${pageContext.request.contextPath}/User/AddUser',
		      			dataType:'json',
		      			type:'post',
		      			data:{
		      				treeId:treeId,
		      				userId: loginUserId,
		      				userName:$("#userName1").val(),
		      				tel:$("#tel1").val(),
		      				roleId:$('#shenfen1>option:selected').val()
		      			},
		      			success:function(data){
		      				alert(data.message);
		      				location.reload();
		      			}
		      		})
		      		}
		      },
		      onCancel: function(e) {
		      	$('#prompt').modal('close');
		      }
		    });
		  });
	});

	$('#del').on('click',function(){
		$('#delet2').modal({
		      relatedTarget: this,
		      onConfirm: function(e) {
		      		$.ajax({
		      			url:'',
		      			dataType:'json',
		      			type:'post',
		      			data:{},
		      			success:function(){
		      				alert("删除成功");
		      				$('#delet2').modal('close');
		      			}
		      		})
		      },
		      onCancel: function(e) {
		      	$('#delet2').modal('close');
		      }
		    });
	})
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
	<script type="text/javascript">
	
	var page1=<%=request.getParameter("page1")%>;
	var page2=<%=request.getParameter("page2")%>;
	var pages1;
	var pages2;
	if(page2>=1&&page1==null){
		page1=1;
		$(".panel1").removeClass("am-active");
		$("#tab1").removeClass("am-active");
		$(".panel2").addClass("am-active");
		$("#tab2").addClass("am-active");
		showUser();
	}else if(page1>=1&&page2==null){
		page2=1;
		$(".panel2").removeClass("am-active");
		$("#tab2").removeClass("am-active");
		$(".panel1").addClass("am-active");
		$("#tab1").addClass("am-active");
		showUser();
	}else{
		page1=1;
		page2=1;
		showUser();
	}
	
	
	
	function createNode1(nodeData){
		var $newTr=$("<tr></tr>");
		var $newTd1=$("<td align='center' style='padding-bottom: 0px;'></td>");
		var $newTd2=$("<td align='center'></td>");
		var $newTd3=$("<td align='center'></td>");
		var $newImg;
		if(nodeData.roleId==1)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/shuji.png' style='margin-bottom: 5px;'>");
		else if(nodeData.roleId==2)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/gl.png' style='margin-bottom: 5px;'>");
		else if(nodeData.roleId==3)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/mg4.png' style='margin-bottom: 5px;'>");
		else if(nodeData.roleId==5)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/mg3.png' style='margin-bottom: 5px;'>");
		var $newSpan=$("<span>"+nodeData.userName+"</span>");
		var $newH3=$("<h3>"+nodeData.tel+"</h3>");
		var $newId=$("<input type='hidden' value='"+nodeData.userId+"'>");
		var $newButton=$("<shiro:hasAnyRoles  name="superAdmin,admin,secretary"><a href='javascript:;' id='show-actions' class='weui-btn weui-btn_mini weui-btn_primary' style='width:80px;height: 32px;'>选择</a> </shiro:hasAnyRoles>");
		$newTd1.append($newImg);
		$newTd1.append($newSpan);
		$newTd2.append($newH3);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTr.append($newTd1);
		$newTr.append($newTd2);
		$newTr.append($newTd3);
		$("#tbody1").append($newTr);
	}
	
	function createNode2(nodeData){
		var $newTr=$("<tr></tr>");
		var $newTd1=$("<td align='center' style='padding-bottom: 0px;'></td>");
		var $newTd2=$("<td align='center'></td>");
		var $newTd3=$("<td align='center'></td>");
		if(nodeData.roleId==1)
		var $newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/shuji.png' style='margin-bottom: 5px;'>");
		if(nodeData.roleId==2)
		var $newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/gl.png' style='margin-bottom: 5px;'>");
		if(nodeData.roleId==3)
		var $newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/mg4.png' style='margin-bottom: 5px;'>");
		if(nodeData.roleId==5)
		var $newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/mg3.png' style='margin-bottom: 5px;'>");
		var $newSpan=$("<span>"+nodeData.userName+"</span>");
		var $newH3=$("<h3>"+nodeData.tel+"</h3>");
		var $newButton=$("<a href='javascript:;' id='show-actions1' class='weui-btn weui-btn_mini weui-btn_primary' style='width:80px;height: 32px;'>选择</a>");
		var $newId=$("<input type='hidden' value='"+nodeData.userId+"'>");
		$newTd1.append($newImg);
		$newTd1.append($newSpan);
		$newTd2.append($newH3);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTr.append($newTd1);
		$newTr.append($newTd2);
		$newTr.append($newTd3);
		$("#tbody2").append($newTr);
	}
	function showUser(){
		$.ajax({
		url:"${pageContext.request.contextPath}/User/SelectByPage",
		dataType:"JSON",
		type:"POST",
		data:{
			
			treeId:treeId,
			page:page1,
			rows:10
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				createNode1(data.rows[i]); 
			}
			if(page1==null){
				page1=1;
			}
			pages1=data.total/10+1;
			$("#pagenow").page({
			pages:pages1,
			curr:page1,
			theme:'secondary',
			first:"首页",
			prev:"<",
			next:">",
			groups:3,
			jump:function(context,first){
				if(!first){
					location.href="${pageContext.request.contextPath}/base/goURL/weixin/uonList?id="+treeId+"&page1="+context.option.curr;
				}
			}
			})
			
		}
	})
	$.ajax({
		url:"${pageContext.request.contextPath}/User/SelectByPage",
		dataType:"JSON",
		type:"POST",
		data:{
			treeId:treeId,
			loginTreeId:loginTreeId,
			history:1,
			page:page2,
			rows:10
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				createNode2(data.rows[i]); 
			}
			pages2=data.total/10+1;
			if(page1==null){
				page1=1;
			}
			$("#pagehit").page({
			pages:pages2,
			curr:page2,
			theme:'secondary',
			first:"首页",
			prev:"<",
			next:">",
			groups:3,
			jump:function(context,first){
				if(!first){
					location.href="${pageContext.request.contextPath}/base/goURL/weixin/uonList?id="+treeId+"&page2="+context.option.curr;
				}
			}
		})
			
		}
	})
	}
	
	
	//翻页
	var page1=<%=request.getParameter("page") %>
	if(page1==null){
		page1=1;
	}
	$("#pagenow").page({
		pages:pages1,
		curr:1,
		theme:'secondary',
		first:"首页",
		last: "尾页",
		prev:"<",
		next:">",
		groups:3,
		jump:function(context,first){
			if(!first){
				location.href="${pageContext.request.contextPath}/base/goURL/weixin/uonList?id="+treeId+"&page1="+context.option.curr;
			}
		}
	})

		
	</script>
</body>
</html>