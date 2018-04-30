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
          <center><div  id="pie1" style="width: 100%;height: 400px;position: fixed;top: 30px;"></div></center>
      </div>

      <div class="weui-tabbar" style="height: 80px;position: fixed;">
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
              <p class="weui-tabbar__label" style="margin-top: 3px;color: #000000;font-size: 16px;">开始时间</p>
            <input id="hid1" type="hidden">
        </a>
         <a id="time-format2" class="weui-tabbar__item  weui-btn" style="margin-top: 0px;">
            <p class="weui-tabbar__label" style="margin-top: 8px;">
                <b style="color: #C54A2A;font-size: 15px;">请选择</b>
            </p> 
              <p class="weui-tabbar__label" style="margin-top: 3px;color: #000000;font-size: 16px;">结束时间</p>
            <input id="hid2" type="hidden">
        </a>
        
      </div>
    </div>

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
        $("#time-format").datetimePicker({
        title: '日期选择',
        yearSplit: '-',
        monthSplit: '-',
        dateSplit: '',
        times: function () {
          return [
            {
              divider: true,  // 这是一个分隔符
              content: ''
            }
          ];
        },
        /*format: "yyyy-mm-dd"，*/
        onClose: function (picker, values, displayValues) {
          $("#hid1").val($("#time-format").val());
          
        }
      });
    $("#time-format2").datetimePicker({
        title: '日期选择',
        yearSplit: '-',
        monthSplit: '-',
        dateSplit: '',
        times: function () {
          return [
            {
              divider: true,  // 这是一个分隔符
              content: ''
            }
          ];
        },
        /*format: "yyyy-mm-dd"，*/
        onClose: function (picker, values, displayValues) {
          
          $("#hid2").val($("#time-format2").val());
          (function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURI(r[2]); return null;
                }
            })(jQuery);
          var uon = $.getUrlParam('uon');
          $('#hid').val(uon);
          loadOneColumn();
        }
      });
    
$("#uon").on('click',function(){
    location.href="${pageContext.request.contextPath}/base/goURL/weixin/SelectUonMet"
});

function loadOneColumn() {
var pie1 = echarts.init(document.getElementById("pie1"));
pie1.setOption({
  color: ['#F70044', '#F6D600', '#11CD86', '#066FA5'],
  title : {
    text: "组织会议统计图",
    x: 'center'
  },
  
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        x: 'left',
        data:[]
    },
    series: [
        {
            name:'会议',
            type:'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[]
        }
    ]
});
pie1.showLoading();    //数据加载完之前先显示一段简单的loading动画
var names = [];    //类别数组（用于存放饼图的类别）党员大会，党代会，民主生活会，党课
var brower = [];
$.ajax({
  type:'post',
  url:'${pageContext.request.contextPath}/meeting/orgMeetingCount',
  data:{time1:$('#hid1').val(),time2:$('#hid2').val(),orgId:$('#hid').val()},
  dataType:'json',
  success:function(result){
      $.each(result.rows,function(index,item){
      	 if(item.type==1){
      	 	item.type="党员大会";
      	 }
      	 else if(item.type==2){
      	 	item.type="党代会";
      	 }
      	 else if(item.type==3){
      	 	item.type="民主生活会";
      	 }
      	 else if(item.type==4){
      	 	item.type="党课";
      	 }
         names.push(item.type);    //挨个取出类别并填入类别数组 
         brower.push({                    
                    value: item.count,
                    name: item.type
                    });
        });
       pie1.hideLoading();    //隐藏加载动画
       pie1.setOption({        //加载数据图表                
                legend: {
                    data: names
                },
                series: [{
                    data: brower
                }]
            });
  },
  error: function (errorMsg) {
            //请求失败时执行该函数
            /*alert("图表请求数据失败!");*/
            pie1.hideLoading();
        }
})

pie1.on('click',function(param){
  var index = param.dataIndex;
      if(index==0){
        $.ajax({
          type:'post',
        url:'${pageContext.request.contextPath}/meeting/orgMeetingCount',
        data:{time1:$('#hid1').val(),time2:$('#hid2').val(),orgId:$('#hid').val()},
        dataType:'json',
        success:function(data){
          $.each(data.rows,function(index,item){
            if(index==0){
              var type=item.type;
              var time1=$('#hid1').val();
              var time2=$('#hid2').val();
              var orgId=$('#hid').val();
              location.href="${pageContext.request.contextPath}/base/goURL/weixin/MetDYuon?type="+type+"&time1="+time1+"&time2="+time2+"&orgId="+orgId
            }
          })
        }
        })
      }
      else if(index==1){
        $.ajax({
          type:'post',
        url:'${pageContext.request.contextPath}/meeting/orgMeetingCount',
        data:{time1:$('#hid1').val(),time2:$('#hid2').val(),orgId:$('#hid').val()},
        dataType:'json',
        success:function(data){
          $.each(data.rows,function(index,item){
            if(index==1){
              var type=item.type;
              var time1=$('#hid1').val();
              var time2=$('#hid2').val();
              var orgId=$('#hid').val();
              location.href="${pageContext.request.contextPath}/base/goURL/weixin/MetDYuon?type="+type+"&time1="+time1+"&time2="+time2+"&orgId="+orgId
            }
          })
        }
        })
      }
      else if(index==2){
        $.ajax({
          type:'post',
        url:'${pageContext.request.contextPath}/meeting/orgMeetingCount',
        data:{time1:$('#hid1').val(),time2:$('#hid2').val(),orgId:$('#hid').val()},
        dataType:'json',
        success:function(data){
          $.each(data.rows,function(index,item){
            if(index==2){
              var type=item.type;
              var time1=$('#hid1').val();
              var time2=$('#hid2').val();
              var orgId=$('#hid').val();
              location.href="${pageContext.request.contextPath}/base/goURL/weixin/MetDYuon?type="+type+"&time1="+time1+"&time2="+time2+"&orgId="+orgId
            }
          })
        }
        })
      }
      else if(index==3){
        $.ajax({
          type:'post',
        url:'${pageContext.request.contextPath}/meeting/orgMeetingCount',
        data:{time1:$('#hid1').val(),time2:$('#hid2').val(),orgId:$('#hid').val()},
        dataType:'json',
        success:function(data){
          $.each(data.rows,function(index,item){
            if(index==3){
              var type=item.type;
              var time1=$('#hid1').val();
              var time2=$('#hid2').val();
              var orgId=$('#hid').val();
              location.href="${pageContext.request.contextPath}/base/goURL/weixin/MetDYuon?type="+type+"&time1="+time1+"&time2="+time2+"&orgId="+orgId
            }
          })
        }
        })
      }
})
}

    </script>
  </body>
</html>
