package com.zeng.zhdj.wy.entity;

public class MeetRecord {

    private int no;

    private String meetTitle;

    private String meetTime;

    private String principal;       //负责人

    private String joinName;        //参与会议姓名

    private String NojoinName;      //未参与会议姓名

    private int meetNumber;         //参与会议人数

    public MeetRecord(){

    }
    public MeetRecord(int no, String meetTitle, String meetTime,
                        String principal, String joinName,
                        String nojoinName, int meetNumber) {
        super();
        this.no = no;
        this.meetTitle = meetTitle;
        this.meetTime = meetTime;

        this.principal = principal;

        this.joinName = joinName;
        this.NojoinName = nojoinName;
        this.meetNumber = meetNumber;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getMeetTitle() {
        return meetTitle;
    }

    public void setMeetTitle(String meetTitle) {
        this.meetTitle = meetTitle;
    }

    public String getMeetTime() {
        return meetTime;
    }

    public void setMeetTime(String meetTime) {
        this.meetTime = meetTime;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getJoinName() {
        return joinName;
    }

    public void setJoinName(String joinName) {
        this.joinName = joinName;
    }

    public String getNojoinName() {
        return NojoinName;
    }

    public void setNojoinName(String nojoinName) {
        NojoinName = nojoinName;
    }

    public int getMeetNumber() {
        return meetNumber;
    }

    public void setMeetNumber(int meetNumber) {
        this.meetNumber = meetNumber;
    }

    @Override
    public String toString() {
        return "MeetRecord{" +
                "no=" + no +
                ", meetTitle='" + meetTitle + '\'' +
                ", meetTime='" + meetTime + '\'' +
                ", principal='" + principal + '\'' +
                ", joinName='" + joinName + '\'' +
                ", NojoinName='" + NojoinName + '\'' +
                ", meetNumber=" + meetNumber +
                '}';
    }
}
