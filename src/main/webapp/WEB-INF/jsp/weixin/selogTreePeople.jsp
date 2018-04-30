<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
        .selbtn{
        	z-index:9999;
        }  
	</style>
</head>
<body ontouchstart>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/statOgList?og=false" class="">

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
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

	    <nav class="am-titlebar-nav">
	        <input type="hidden" id="selPeo">
	        <input type="hidden" id="ids">
	    </nav>
   </div>

   <div data-am-widget="tabs"
       class="am-tabs am-tabs-default">
      <ul class="am-tabs-nav am-cf">
          <li class="am-active" id="tab1">
          <a href="javascript:void(0)" >成员列表</a>
          </li>
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
          
          
      </div>
  </div>
	
	<div class="am-modal am-modal-prompt" tabindex="-1" id="confirm">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否选择该人员？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel >取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm >确定</span>
		    </div>
		  </div>
	</div>

	

<script src="${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/dist/lib/fastclick.js"></script>
<script>
	
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
</script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script>
<script type="text/javascript">
var page=<%=request.getParameter("page")%>
var treeId=<%=request.getParameter("treeId")%>
var loginTreeId=<%=session.getAttribute("RelUserTreeId")%> 	
var selPeo={
	set:function(){
		selPeo.showUser();
	},
	showUser:function(){
		if(page==null||page=="")
			page=1;
		$.ajax({
			url:"${pageContext.request.contextPath}/User/SelectByPage",
			dataType:"JSON",
			type:"POST",
			data:{
				treeId:treeId,
				rows:10,
				page:page
			},
			success:function(data){
				for(var i=0;i<data.rows.length;i++){
					selPeo.createNode(data.rows[i]);
				}
				if(data.total%10==0)
					pages=data.total/10;
				else
					pages=parseInt(data.total/10)+1;
				$("#pagenow").page({
				pages:pages,
				curr:page,
				theme:'secondary',
				first:"首页",
				prev:"<",
				next:">",
				groups:3,
				jump:function(context,first){
					if(!first){
						var has=false;
						location.href="${pageContext.request.contextPath}/base/goURL/weixin/statSelectPeople?treeId="+treeId+"&page="+context.option.curr;
					}
				}
			})
		}
	})
	},
	createNode:function(nodeData){
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
		var $newName=$("<input type='hidden' value='"+nodeData.userName+"'>");
		var $newButton=$("<button type='button' onclick=selPeo.select("+nodeData.tel+",'"+nodeData.userName+"') class='am-btn am-btn-primary am-radius selbtn' style='width:80px;height: 32px;line-height:0px;'>选择</button>");
		$newTd1.append($newImg);
		$newTd1.append($newSpan);
		$newTd2.append($newH3);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTd3.append($newName);
		$newTr.append($newTd1);
		$newTr.append($newTd2);
		$newTr.append($newTd3);
		$("#tbody1").append($newTr);
	},
	select:function(tel,name){
		 $('#confirm').modal({
	        relatedTarget: this,
	        onConfirm: function(options) {
				location.href=encodeURI("${pageContext.request.contextPath}/base/goURL/weixin/staticShowper?tel="+tel);
	        },
	      });
		
	}
}
selPeo.set();				
</script>
</body>
</html>