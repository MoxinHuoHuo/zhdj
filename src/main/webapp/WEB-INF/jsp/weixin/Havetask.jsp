<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="已下达任务">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
  	<meta content="telephone=no" name="format-detection" />
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
          已下达任务
      </h1>
  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title " style="font-size: 1.1em">
	        已下达任务列表
	    </h2>

	    <nav class="am-titlebar-nav">
	        <button id="xiada" style="margin-bottom: 0.3em;width: 55%" type="button" class="am-btn am-btn-sm am-btn-primary am-radius">
	               <i class="am-icon-arrow-down"></i>&nbsp;下达任务</button>
	    </nav>
   </div>

   <div data-am-widget="tabs"
       class="am-tabs am-tabs-default"
        >
      <ul class="am-tabs-nav am-cf">
          <li class="am-active"><a href="javascript:void(0)">近期任务</a></li>
          <li class=""><a href="[data-tab-panel-1]">历史任务</a></li>
          
      </ul>
      <div class="am-tabs-bd">
          <div data-tab-panel-0 class="am-tab-panel panel1 am-active">
            	<table class="am-table  am-table-hover table-main">
	  				<thead>
	  					<tr>
	  						<td align="center">任务标题</td>
	  						<td align="center">下达时间</td>
	  						<td align="center">操作</td>
	  					</tr>
	  				</thead>
	  				<tbody id="tbody1">
	  					<!-- <tr>
	  						<td align="center" style="padding-bottom: 0px;"><h5>萨首发身份的根深蒂固所发生的根都是个色鬼色鬼的事</h5></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><a href="javascript:;" id='show-actions' class="weui-btn weui-btn_mini weui-btn_primary" style="width:80px;height: 32px;">选择</a></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asfilak</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><a href="javascript:;" id='show-actions' class="weui-btn weui-btn_mini weui-btn_primary" style="width:80px;height: 32px;">选择</a></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asfilak</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><a href="javascript:;" id='show-actions' class="weui-btn weui-btn_mini weui-btn_primary" style="width:80px;height: 32px;">选择</a></td>
	  					</tr> -->
	  				</tbody>
  				</table>
  				<div id="pagehas"></div>
          </div>
          <div data-tab-panel-1 class="am-tab-panel panel2">
            	<table class="am-table  am-table-hover table-main">
	  				<thead>
	  					<tr>
	  						<td align="center">任务标题</td>
	  						<td align="center">下达时间</td>
	  						<td align="center">操作</td>
	  					</tr>
	  				</thead>
	  				<tbody id="tbody2">
	  					<!-- <tr>
	  						<td align="center" style="padding-bottom: 0px;"><h5>萨首发身份的根深蒂固所发生的根都是个色鬼色鬼的事</h5></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><a href="javascript:;" id='show-actions' class="weui-btn weui-btn_mini weui-btn_primary" style="width:80px;height: 32px;">选择</a></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asf</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><a href="javascript:;" id='show-actions' class="weui-btn weui-btn_mini weui-btn_primary" style="width:80px;height: 32px;">选择</a></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asfilak</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><a href="javascript:;" id='show-actions' class="weui-btn weui-btn_mini weui-btn_primary" style="width:80px;height: 32px;">选择</a></td>
	  					</tr> -->
	  				</tbody>
  				</table>
  				<div id="pagehit"></div>
          </div>
          
      </div>
	   <center><div>粤icp备09004280号</div></center>
  </div>
	<div class="am-modal am-modal-prompt" tabindex="-1" id="prompt">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">任务下达</div>
		    <div class="am-modal-bd">
		      请选择所要下达的任务
		    </div>
		    <div class="am-modal-footer">
		    <shiro:hasAnyRoles  name="superAdmin,admin,secretary">
		      <span class="am-modal-btn" data-am-modal-cancel>组织任务下达</span>
		     </shiro:hasAnyRoles>
		      <span class="am-modal-btn" data-am-modal-confirm>个人任务下达</span>
		    </div>
		  </div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="history">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否要转为历史任务？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>

	<div class="am-modal am-modal-prompt" tabindex="-1" id="del">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否删除任务？
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
		var name=$(this).nextAll().eq(1).val();
		var receiveUnit=$(this).nextAll().eq(2).val();
		var tastType=$(this).nextAll().eq(3).val();
        $.actions({
          title: "选择操作",
          onClose: function() {
            console.log("close");
          },
          actions: [
            {
              text: "任务详情",
              className: "color-primary",
              onClick: function() {
                location.href="${pageContext.request.contextPath}/base/goURL/weixin/taskDetail?id="+id+"&name="+name+"&receiveUnit"+receiveUnit+"&uuid="+tastType
              }
            },
            {
              text: "下达预警",
              className: "color-danger",
              onClick: function() {
                location.href="${pageContext.request.contextPath}/base/goURL/weixin/receiveWarn?id="+id
              }
            },
            {
              text: "转为历史任务",
              className: "color-warning",
              onClick: function() {
	              $('#history').modal({
			      relatedTarget: this,
			      onConfirm: function(e) {
			      	$.ajax({
			      		url:"${pageContext.request.contextPath}/MakeHistory",
			      		dataType:'json',
			      		type:'post',
			      		data:{tastId:id},
			      		success:function(data){
							if(data.status==1)
							alert("成功转为历史任务")
							else{
								alert("转为历史任务失败")
							}
			      		}
			      	})
			      },
			      onCancel: function(e) {
			      	$('#history').modal('close');
			      }
		    	});
              }
            },
            {
              text: "删除",
              className: 'color-danger',
              onClick: function() {
                $('#del').modal({
			      relatedTarget: this,
			      onConfirm: function(e) {
			      	$.ajax({
			      		url:'${pageContext.request.contextPath}/delete',
			      		dataType:'json',
			      		type:'post',
			      		data:{tastId:id},
			      		success:function(data){
			      			if(data.status==1)
								alert("删除成功")
								else{
									alert("删除失败")
								}
			      		}
			      	})
			      },
			      onCancel: function(e) {
			      	$('#del').modal('close');
			      }
		    	});
              }
            }
          ]
        });
      });
	
		$(document).on("click", "#show-actions2", function() {
			var id=$(this).next().val();
	        $.actions({
	          title: "选择操作",
	          onClose: function() {
	            console.log("close");
	          },
	          actions: [
	            {
	              text: "任务详情",
	              className: "color-primary",
	              onClick: function() {
	                location.href="${pageContext.request.contextPath}/base/goURL/weixin/taskDetail?id="+id
	              }
	            },
	            {
	              text: "删除",
	              className: 'color-danger',
	              onClick: function() {
	                $('#del').modal({
				      relatedTarget: this,
				      onConfirm: function(e) {
				      	$.ajax({
				      		url:'${pageContext.request.contextPath}/delete',
				      		dataType:'json',
				      		type:'post',
				      		data:{tastId:id},
				      		success:function(data){
				      			if(data.status==1)
									alert("删除成功")
									else{
										alert("删除失败")
									}
				      		}
				      	})
				      },
				      onCancel: function(e) {
				      	$('#del').modal('close');
				      }
			    	});
	              }
	            }
	          ]
	        });
	      });

	//任务下达弹窗
	$(function() {
	  $('#xiada').on('click', function() {
		    $('#prompt').modal({
		      relatedTarget: this,
		      onConfirm: function(e) {
		      	//个人
		        location.href="${pageContext.request.contextPath}/base/goURL/weixin/sendPerproject"
		      },
		      onCancel: function(e) {
		      	//组织
		        location.href="${pageContext.request.contextPath}/base/goURL/weixin/sendUonproject"
		      }
		    });
		  });
	});
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
		showtask();
	}else if(page1>=1&&page2==null){
		page2=1;
		$(".panel2").removeClass("am-active");
		$("#tab2").removeClass("am-active");
		$(".panel1").addClass("am-active");
		$("#tab1").addClass("am-active");
		showtask();
	}else{
		page1=1;
		page2=1;
		showtask();
	}


	function createNode1(nodeData){
		var $newTr=$("<tr></tr>");
		var $newTd1=$("<td align='center' style='padding-bottom: 0px;'></td>");
		var $newTd2=$("<td align='center'></td>");
		var $newTd3=$("<td align='center'></td>");
		var $newSpan=$("<span>"+nodeData.tastTitle+"</span>");
		var $newSpan2=$("<span>"+nodeData.creatTastTime+"</span>");
		var $newId=$("<input type='hidden' value='"+nodeData.tastId+"'>");
		var $newName=$("<input type='hidden' value='"+nodeData.name+"'>");
		var $newre=$("<input type='hidden' value='"+nodeData.receiveUnit+"'>");
		var $tastType=$("<input type='hidden' value='"+nodeData.tastType+"'>");
		var $newButton=$("<a href='javascript:;' id='show-actions' class='weui-btn weui-btn_mini weui-btn_primary' style='width:80px;height: 32px;'>选择</a>");
		$newTd1.append($newSpan);
		$newTd2.append($newSpan2);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTd3.append($newName);
		$newTd3.append($newre);
		$newTd3.append($tastType);
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
		var $newSpan=$("<span>"+nodeData.tastTitle+"</span>");
		var $newSpan2=$("<span>"+nodeData.creatTastTime+"</span>");
		var $newId=$("<input type='hidden' value='"+nodeData.tastId+"'>");
		var $newName=$("<input type='hidden' value='"+nodeData.name+"'>");
		var $newre=$("<input type='hidden' value='"+nodeData.receiveUnit+"'>");
		var $newButton=$("<a href='javascript:;' id='show-actions2' class='weui-btn weui-btn_mini weui-btn_primary' style='width:80px;height: 32px;'>选择</a>");
		$newTd1.append($newSpan);
		$newTd2.append($newSpan2);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTd3.append($newName);
		$newTd3.append($newre);
		$newTr.append($newTd1);
		$newTr.append($newTd2);
		$newTr.append($newTd3);
		$("#tbody2").append($newTr);
	}


	function showtask(){
		
		$.ajax({
		url:"${pageContext.request.contextPath}/PerReceiveTast",
		dataType:"JSON",
		type:"POST",
		data:{
			sentId:loginUserId,
			history:0,
			page:page1
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				createNode1(data.rows[i]); 
			}
			if(page1==null){
				page1=1;
			}
			pages1=data.total/10+1;
			$("#pagehas").page({
			pages:pages1,
			curr:page1,
			theme:'secondary',
			first:"首页",
			prev:"<",
			next:">",
			groups:3,
			jump:function(context,first){
				if(!first){
					location.href="${pageContext.request.contextPath}/base/goURL/weixin/Havetask?id="+treeId+"&page1="+context.option.curr;
				}
			}
			})
			
		}
	})
	$.ajax({
		url:"${pageContext.request.contextPath}/PerReceiveTast",
		dataType:"JSON",
		type:"POST",
		data:{
			sentId:loginUserId,
			history:1,
			page:page2
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				createNode2(data.rows[i]); 
			}
			pages2=data.total/10+1;
			if(page2==null){
				page2=1;
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
					location.href="${pageContext.request.contextPath}/base/goURL/weixin/Havetask?id="+treeId+"&page2="+context.option.curr;
				}
			}
		})
			
		}
	})
	}
	</script>
</body>
</html>