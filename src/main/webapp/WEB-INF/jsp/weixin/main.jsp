<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="description" content="主界面">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link rel="alternate icon" type="${pageContext.request.contextPath}/images/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.swiper.min.css">
    <style type="text/css">
        body{background-image:url("${pageContext.request.contextPath}/images/bg1.jpg");background-repeat: repeat-x;background-size:850px;}
        #logo{width: 95px;}
        #text{color: #EFEBD9;font-size: 29px;margin-top: 10px;margin-bottom: 0xp;}
        input{
			width: 230px;
			height: 35px;
			font-size: 1.8rem;
			border-left-width:0px;
			border-top-width:0px;
			border-right-width:0px;
			border-bottom: 1px solid #0e90d2;
			outline:medium;
			outline: none;
			background:transparent;
    </style>
</head>
<body>
  <div class="am-g">
  <div class="am-u-lg-12 am-u-md-12 am-u-centered">
      <div>
        <center><img id="logo" src="${pageContext.request.contextPath}/images/logo.png"></center>
      </div>
      <div>
        <center><h2 id="text">智慧党建</h2></center>
      </div>
      <div style="margin:0px 15px 5px 15px;">
      	<div class="am-slider am-slider-c4" >
          <ul class="am-slides">
              <li>
                  <a href="#" class="href"><img class="img" src="${pageContext.request.contextPath}/images/bka.png"></a>
                  <!-- <div class="am-slider-desc">远方 有一个地方 那里种有我们的梦想</div> -->
                 
              </li>
              <li>
                  <a href="#" class="href"><img class="img" src="${pageContext.request.contextPath}/images/bkb.png"></a>
                  <!-- <div class="am-slider-desc">某天 也许会相遇 相遇在这个好地方</div> -->
                 
              </li>
              <li>
                  <a href="#" class="href"><img class="img" src="${pageContext.request.contextPath}/images/bkc.jpg"></a>
                  <!-- <div class="am-slider-desc">不要太担心 只因为我相信 终会走过这条遥远的道路</div> -->
              </li>
              <li>
                  <a href="#" class="href"><img class="img" src="${pageContext.request.contextPath}/images/bka.png"></a>
                  <!-- <div class="am-slider-desc">远方 有一个地方 那里种有我们的梦想</div> -->
                 
              </li>
              <li>
                  <a href="#" class="href"><img class="img" src="${pageContext.request.contextPath}/images/bka.png"></a>
                  <!-- <div class="am-slider-desc">远方 有一个地方 那里种有我们的梦想</div> -->
                 
              </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
    <center>
    <div style="margin-top: 0px;" class="am-g am-u-centered">
            <div class="am-u-sm-4 am-u-lg-4" style="padding-right: 0px;">
              <a href="${pageContext.request.contextPath}/base/goURL/weixin/ogTree">
              <div style="width: 100px;height: 100px;background-color: #C54A2A;margin-left: 0px;margin-top: 12px;">
                <center><i><img style="width: 35px;margin-top: 28px;" src="${pageContext.request.contextPath}/images/sgl3.png"></i></center>
                <center><h5 style="color:  #EFEBD9;font-size: 13px;margin-top: 6px;">组织</h5></center>
              </div>
              </a>
            </div>

            <div class="am-u-sm-4 am-u-lg-4" style="padding-left: 0px;padding-right:0px;">
              <a href="${pageContext.request.contextPath}/base/goURL/weixin/showProject">
              <div style="width: 100px;height: 100px;background-color: #0B9BA9;margin-left: 4px;margin-top: 12px;">
                <center><i><img style="width: 35px;margin-top: 28px;" src="${pageContext.request.contextPath}/images/sgl1.png"></i></center>
                <center><h5 style="color:  #EFEBD9;font-size: 13px;margin-top: 6px;">任务</h5></center>
              </div>
              </a>
            </div>

            <div class="am-u-sm-4 am-u-lg-4" style="padding-left: 0px;margin-left: 0px;">
              <a href="${pageContext.request.contextPath}/base/goURL/weixin/showMeetingList">
              <div style="width: 100px;height: 100px;background-color: #D6B572;margin-left: 6px;margin-top: 12px;margin-right: 20px;">
                <center><i><img style="width: 35px;margin-top: 28px;" src="${pageContext.request.contextPath}/images/sgl4.png"></i></center>
                <center><h5 style="color:  #EFEBD9;font-size: 13px;margin-top: 6px;">会议</h5></center>
              </div>
              </a>
            </div>
        </div>
      </center>
      
      <center>
      <div style="margin-top: 4px;" class="am-g am-u-centered">
            <div class="am-u-sm-4 am-u-lg-4" style="padding-right: 0px;">
              <a href="${pageContext.request.contextPath}/base/goURL/weixin/statistics">
              <div style="width: 100px;height: 100px;background-color: #F46D78;margin-left: 0px;margin-top: 12px;">
                <center><i><img style="width: 35px;margin-top: 28px;" src="${pageContext.request.contextPath}/images/sgl2.png"></i></center>
                <center><h5 style="color:  #EFEBD9;font-size: 13px;margin-top: 6px;">统计</h5></center>
              </div>
              </a>
            </div>

            <div class="am-u-sm-4 am-u-lg-4" style="padding-left: 0px;padding-right:0px;">
              <a href="${pageContext.request.contextPath}/base/goURL/weixin/archiveSelect">
              <div style="width: 100px;height: 100px;background-color: #B1B336;margin-left: 4px;margin-top: 12px;">
                <center><i><img style="width: 35px;margin-top: 28px;" src="${pageContext.request.contextPath}/images/sgl5.png"></i></center>
                <center><h5 style="color:  #EFEBD9;font-size: 13px;margin-top: 6px;">归档</h5></center>
              </div>
              </a>
            </div>

            <div class="am-u-sm-4 am-u-lg-4" style="padding-left: 0px;margin-left: 0px;">
              <a href="${pageContext.request.contextPath}/base/goURL/weixin/myBaseData">
              <div style="width: 100px;height: 100px;background-color: #38925E;margin-left: 6px;margin-top: 12px;margin-right: 20px;">
                <center><i><img style="width: 35px;margin-top: 28px;" src="${pageContext.request.contextPath}/images/sgl6.png"></i></center>
                <center><h5 style="color:  #EFEBD9;font-size: 13px;margin-top: 6px;">我的</h5></center>
              </div>
              </a>
            </div>
      </div>
      </center>
        <center><div>粤icp备09004280号</div></center>
      
      <div class="am-modal am-modal-prompt" tabindex="-1" id="prompt">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd" style="float: left;margin-left: 10px;font-weight: bold;font-size: 20px;">提示</div>
		    <div class="am-modal-bd" style="float: left;margin-left: 10px;margin-top: 7px;">
		      
		      	有预警需要处理，请前往处理！
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
		</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.swiper.min.js"></script>
<script type="text/javascript">
	var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>;
	var loginUserId=<%=session.getAttribute("RelUserLoginId")%>;
	
	$.ajax({
		dataType:"JSON",
		type:"POST",
		url:"${pageContext.request.contextPath}/News/ListUI",
		data:{
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				if(data.rows[i].imgs!=null){
					/* if(i==0)
						$(".clone").eq(1).children().children().attr("src","/zhdj/News/listUI/pic/"+data.rows[i].imgs);
					if(i==2)
						$(".clone").eq(0).children().children().attr("src","/zhdj/News/listUI/pic/"+data.rows[i].imgs); */
					$(".img").eq(i).attr("src","/zhdj/News/listUI/pic/"+data.rows[i].imgs);					
				}
				if(data.rows[i].newHref!=null)
					$(".href").eq(i).attr("href",data.rows[i].newHref);
			}
			$('.am-slider').flexslider();
		}
	})
	
	$.ajax({
		url:'${pageContext.request.contextPath}/warning/getWarningInTime',
		dataType:'json',
		type:'post',
		data:{orgId:loginTreeId,userId:loginUserId},
		success:function(data){
			if(data.status==1){
			$('#prompt').modal({
		      relatedTarget: this,
		      onConfirm: function(e) {
		      	location.href="${pageContext.request.contextPath}/base/goURL/weixin/myWarning"
		      		
		      },
		      onCancel: function(e) {
		      	/*$('#xiada').modal("close")*/
		      }
		    });
		    }
		}
	})
</script>
</body>
</html>