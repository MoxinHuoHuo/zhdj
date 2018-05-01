package com.zeng.zhdj.wy.entity;

import java.util.ArrayList;
import java.util.List;

public class MeetRecords {
    List<MeetRecord> meetRecordList;
    Integer meetingTimes;

    public MeetRecords(){
        meetRecordList=new ArrayList<>();
        meetingTimes=0;
    }

    public Integer getMeetingTimes() {
        return meetingTimes;
    }

    public void setMeetingTimes(Integer meetingTimes) {
        this.meetingTimes = meetingTimes;
    }

    public List<MeetRecord> getMeetRecordList() {
        return meetRecordList;
    }

    public void setMeetRecordList(List<MeetRecord> meetRecordList) {
        this.meetRecordList = meetRecordList;
    }

    @Override
    public String toString() {
        return "MeetRecords{" +
                "meetRecordList=" + meetRecordList +
                ", meetingTimes=" + meetingTimes +
                '}';
    }
}
