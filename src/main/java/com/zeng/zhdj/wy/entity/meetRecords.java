package com.zeng.zhdj.wy.entity;

import java.util.ArrayList;
import java.util.List;

public class meetRecords {
    List<MeetRecord> meetRecordList;

    public meetRecords(){
        meetRecordList=new ArrayList<>();
    }

    public List<MeetRecord> getMeetRecordList() {
        return meetRecordList;
    }

    public void setMeetRecordList(List<MeetRecord> meetRecordList) {
        this.meetRecordList = meetRecordList;
    }

    @Override
    public String toString() {
        return "meetRecords{" +
                "meetRecordList=" + meetRecordList +
                '}';
    }
}
