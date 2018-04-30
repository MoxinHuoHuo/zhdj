package com.zeng.zhdj.wy.action;

import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.wy.entity.*;
import com.zeng.zhdj.wy.service.MeetingSignService;
import com.zeng.zhdj.wy.service.PartyMeetingService;
import com.zeng.zhdj.wy.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("lydStatistics")
public class lydStatistics {

    @Resource
    private PartyMeetingService partyMeetingService;

    @Resource
    private MeetingSignService signService;

    @Resource
    private UserService userService;

    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

    //这个方法太笨了，不可取
    /*//设置一个私有成员
    private List<meetRecords> assignAMeeting(List<MeetRecord> meetList) throws ParseException {

        List<meetRecords> meetRecordList= new ArrayList(){{add(null);add(null);add(null);add(null);add(null);add(null);add(null);add(null);add(null);add(null);add(null);add(null);}};

        meetRecords  meetRecords1=new meetRecords();
        meetRecords  meetRecords2=new meetRecords();
        meetRecords  meetRecords3=new meetRecords();
        meetRecords  meetRecords4=new meetRecords();
        meetRecords  meetRecords5=new meetRecords();
        meetRecords  meetRecords6=new meetRecords();
        meetRecords  meetRecords7=new meetRecords();
        meetRecords  meetRecords8=new meetRecords();
        meetRecords  meetRecords9=new meetRecords();
        meetRecords  meetRecords10=new meetRecords();
        meetRecords  meetRecords11=new meetRecords();
        meetRecords  meetRecords12=new meetRecords();

        for (MeetRecord meetRecord:meetList){

            Date date1=sdf.parse(meetRecord.getMeetTime());
            Calendar cal=Calendar.getInstance();
            cal.setTime(date1);

            Integer month=cal.get(Calendar.MONTH)+1;

            switch (month){
                case 1:meetRecords1.getMeetRecordList().add(meetRecord);break;
                case 2:meetRecords2.getMeetRecordList().add(meetRecord);break;
                case 3:meetRecords3.getMeetRecordList().add(meetRecord);break;
                case 4:meetRecords4.getMeetRecordList().add(meetRecord);break;
                case 5:meetRecords5.getMeetRecordList().add(meetRecord);break;
                case 6:meetRecords6.getMeetRecordList().add(meetRecord);break;
                case 7:meetRecords7.getMeetRecordList().add(meetRecord);break;
                case 8:meetRecords8.getMeetRecordList().add(meetRecord);break;
                case 9:meetRecords9.getMeetRecordList().add(meetRecord);break;
                case 10:meetRecords10.getMeetRecordList().add(meetRecord);break;
                case 11:meetRecords11.getMeetRecordList().add(meetRecord);break;
                case 12:meetRecords12.getMeetRecordList().add(meetRecord);break;
            }
        }

        if(meetRecords1.getMeetRecordList().size()!=0){
            meetRecordList.set(0,meetRecords1);
        }
        if(meetRecords2.getMeetRecordList().size()!=0){
            meetRecordList.set(1,meetRecords2);
        }
        if(meetRecords3.getMeetRecordList().size()!=0){
            meetRecordList.set(2,meetRecords3);
        }
        if(meetRecords4.getMeetRecordList().size()!=0){
            meetRecordList.set(3,meetRecords4);
        }
        if(meetRecords5.getMeetRecordList().size()!=0){
            meetRecordList.set(4,meetRecords5);
        }
        if(meetRecords6.getMeetRecordList().size()!=0){
            meetRecordList.set(5,meetRecords6);
        }
        if(meetRecords7.getMeetRecordList().size()!=0){
            meetRecordList.set(6,meetRecords7);
        }
        if(meetRecords8.getMeetRecordList().size()!=0){
            meetRecordList.set(7,meetRecords8);
        }
        if(meetRecords9.getMeetRecordList().size()!=0){
            meetRecordList.set(8,meetRecords9);
        }
        if(meetRecords10.getMeetRecordList().size()!=0){
            meetRecordList.set(9,meetRecords10);
        }
        if(meetRecords11.getMeetRecordList().size()!=0){
            meetRecordList.set(10,meetRecords11);
        }
        if(meetRecords12.getMeetRecordList().size()!=0){
            meetRecordList.set(11,meetRecords12);
        }


        return meetRecordList;
    }*/

    @RequestMapping("showMeetStatistics")
    public ModelAndView showMeetStatistics(HttpServletRequest request) throws ParseException {

        ModelAndView mav=new ModelAndView();
        List<PartyBranchMeeting> list = new ArrayList<PartyBranchMeeting>();

        Map<String, Object> map = new HashMap<String, Object>();

        String unit = request.getParameter("unit");
        String startTime = request.getParameter("startTime");

        map.put("orgId", unit);
        map.put("time1", startTime);

        list = partyMeetingService.GetOrgMeetingsByOrgId(map);// 获取该组织该事件端对应的会议

        List<MeetRecord> meetRecordList = new ArrayList<MeetRecord>();

        //获取开会的人
        for (int i = 0; i < list.size(); i++) {
            String nameString = "";// 参会者姓名
            String noNameString = "";// 没参会的姓名

            List<MeetingSignRecord> meetingSign = signService.selectBy(list
                    .get(i).getId());
            System.out.println("----------会议相关："+meetingSign.toString());
            System.out.println(meetingSign.size());
            for (int j = 0; j < meetingSign.size(); j++) {
                if (meetingSign.get(j).getStatus() > 0) {

                    nameString = meetingSign.get(j).getSignPeople() + ","
                            + nameString;

                }else if (meetingSign.get(j).getStatus() == 0) {

                    noNameString = meetingSign.get(j).getSignPeople() + ","
                            + noNameString;

                }
            }

            System.out.println("------------参加的人员名字"+nameString);
            System.out.println("-----------未参加的人员的名"+noNameString);

            User user = userService.getAdminMsgByTreeId(list.get(i).getOrgId());


            String orgName = user.getUserName();
            MeetRecord meetRecord = new MeetRecord(i + 1,
                    list.get(i).getMeetingTitle(), DateUnti.dateToStr(list.get(i).getStartTime(),11),
                    orgName, nameString, noNameString, meetingSign.size());

            meetRecordList.add(meetRecord);

        }
        System.out.println("瞧，我发现了这个---"+meetRecordList);

        /*List<meetRecords> meetRecordsList=assignAMeeting(meetRecordList);*/
        Map meetRecordMap=assignAMeeting2(meetRecordList);

        System.out.println("小老板把我搞得头皮发麻:"+meetRecordMap.toString());

        //mav.addObject("meetRecordsList",meetRecordsList);
        return mav;
    }


    //把任务分配到每个月(简洁版)
    private Map<Integer,List<MeetRecord>> assignAMeeting2(List<MeetRecord> meetList) throws ParseException {

        Map<Integer,List<MeetRecord>> meetRecordsMap=new HashMap<>();

        for (int i=0;i<12;i++)
            meetRecordsMap.put(i,new ArrayList<MeetRecord>());

        for (MeetRecord meetRecord:meetList){

            Date date1=sdf.parse(meetRecord.getMeetTime());
            Calendar cal=Calendar.getInstance();
            cal.setTime(date1);

            Integer month=cal.get(Calendar.MONTH)+1;

            switch (month){
                case 1:meetRecordsMap.get(0).add(meetRecord);break;
                case 2:meetRecordsMap.get(1).add(meetRecord);break;
                case 3:meetRecordsMap.get(2).add(meetRecord);break;
                case 4:meetRecordsMap.get(3).add(meetRecord);break;
                case 5:meetRecordsMap.get(4).add(meetRecord);break;
                case 6:meetRecordsMap.get(5).add(meetRecord);break;
                case 7:meetRecordsMap.get(6).add(meetRecord);break;
                case 8:meetRecordsMap.get(7).add(meetRecord);break;
                case 9:meetRecordsMap.get(8).add(meetRecord);break;
                case 10:meetRecordsMap.get(9).add(meetRecord);break;
                case 11:meetRecordsMap.get(10).add(meetRecord);break;
                case 12:meetRecordsMap.get(11).add(meetRecord);break;
            }
        }

        return meetRecordsMap;
    }
}


