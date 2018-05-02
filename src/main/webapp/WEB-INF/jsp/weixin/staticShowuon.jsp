<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>组织会议统计</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/lib/weui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-weui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/demos/css/demos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/core.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/menu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/typography.css" />
  </head>

  <body ontouchstart>
    <div class="weui-tab">
      <div class="weui-tab__bd">
            <div style="background-color: #0e90d2;height: 3em;">
                <a href="${pageContext.request.contextPath}/base/goURL/weixin/statistics"><span style="position: relative;top: 10px;left: 10px;"><img width="25" src="${pageContext.request.contextPath}/images/jian.png"></span></a>
                <center><span style="font-size: 20px;position:relative;bottom: 23px;color: #F4F4F4;font-weight: bold;">数据统计</span>&nbsp;&nbsp;&nbsp;<span style="font-size: 20px;position:relative;bottom: 23px;color: #F4F4F4;font-weight: bold;">粤icp备09004280号</span></center>
          </div>
          <a id="uon" class="weui-tabbar__item  weui-btn" style="margin-top: 0px;">
              <p class="weui-tabbar__label" style="margin-top: 8px;">
                  <b style="color: #82C12F;font-size: 15px;">请选择</b>
              </p>
              <p class="weui-tabbar__label" style="margin-top: 3px;color: #000000;font-size: 16px;">组织</p>
              <input id="hid" type="hidden">
          </a>
          <a id="time-format" class="weui-tabbar__item  weui-btn weui-btn" style="margin-top: 0px;">
              <p class="weui-tabbar__label" style="margin-top: 8px;">
                  <b style="color: #0B9BA9;font-size: 15px;">请选择</b>
              </p>
              <p class="weui-tabbar__label" style="margin-top: 3px;color: #000000;font-size: 16px;">
                   <%--    <select id="agesye">
                       <option value="0">会议年份</option>
                   </select>--%>
              </p>
              <input id="hid1" type="hidden">
          </a>

          <select id="agesye" style="border: none;width:100%;text-align: center;font-size: 16px;padding-left: 44%;height: 40px">
              <option value="0">年份</option>
          </select>
          <center><div  id="pie1" style="width: 100%;height: 300px;position: fixed;top: 30px;"></div></center>
          <a class="weui-btn weui-btn_primary" id="sure" href="javascript:;"style="background:#0e90d2;">确定</a>
          <form  id="forms" method="post" action="${pageContext.request.contextPath}/lydStatistics/showMeetStatistics" style="display: none">
              <input type="text" name="startTime" id="input1">
              <input type="text" name="unit"id="input2">
          </form>
      </div>



    </div>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js"></script>
    <script src="${pageContext.request.contextPath}/dist/lib/fastclick.js"></script>
    <script>
      $(function() {
        FastClick.attach(document.body);
      });
    </script>
    <script src="${pageContext.request.contextPath}/dist/js/jquery-weui.js"></script>
    <script src="${pageContext.request.contextPath}/dist/js/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/js/city-picker.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/pieChart.js"></script>
    

    <script type="text/javascript">
    	<%-- var orgId=<%=session.getAttribute("RelUserTreeId")%>; --%>
        var pie1 = echarts.init(document.getElementById("pie1"));
            pie1.showLoading();


        //年份下拉列表
        $(function(){
            var start = 1990; // 指定开始年份
            var end = new Date().getFullYear(); // 获取当前年份
            for(i=start;i<=end;i++)
                $("#agesye").append("<option value="+i+">"+i+"</option>")
        })
     //跳转选择组织页面
     $("#uon").on('click',function(){
     location.href="${pageContext.request.contextPath}/base/goURL/weixin/SelectUonMet"
     });
   //提交请求
      $("#sure").click(function () {
          var year=$("#agesye").find("option:selected").text();
          // 获取组织编号
          var unit="<%=request.getParameter("unit")%>";
          console.log(year);
          console.log(unit);
          $('#input1').val(year);
          $('#input2').val(unit);
          $('#forms').submit();

      })



    </script>
  </body>
</html>
