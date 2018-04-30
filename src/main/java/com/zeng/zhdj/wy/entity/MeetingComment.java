package com.zeng.zhdj.wy.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class MeetingComment {
	
    private Integer id;

    private Integer meetingId;//会议标题

    private String commentator;//评论人
   
    private String meetingTitle;//会议标题

    private String commentContent;//评论内容
    
    @JsonIgnore
    private Date commentTime;//评论时间
    
    private String commenttime;
    
    private int orgId;//组织id
    
    
    
	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public String getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(String commenttime) {
		this.commenttime = commenttime;
	}

	public String getMeetingTitle() {
		return meetingTitle;
	}

	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
    }

    public String getCommentator() {
        return commentator;
    }

    public void setCommentator(String commentator) {
        this.commentator = commentator == null ? null : commentator.trim();
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

	

	public MeetingComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MeetingComment(String commentator, String meetingTitle,
			String commentContent, Date commentTime) {
		super();
		this.commentator = commentator;
		this.meetingTitle = meetingTitle;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
	}

	@Override
	public String toString() {
		return "MeetingComment [id=" + id + ", meetingId=" + meetingId
				+ ", commentator=" + commentator + ", meetingTitle="
				+ meetingTitle + ", commentContent=" + commentContent
				+ ", commentTime=" + commentTime + "]";
	}

	
    
}