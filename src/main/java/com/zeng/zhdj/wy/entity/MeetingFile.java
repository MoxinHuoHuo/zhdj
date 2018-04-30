package com.zeng.zhdj.wy.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class MeetingFile {
	@JsonIgnore
    private Integer id;
	@JsonIgnore
    private Integer meetingId;//会议id
	@JsonIgnore
    private String meetingTitle;//会议标题

    private String file;//文件路径

    private String img;//图片路径
    @JsonIgnore
    private String signImg;
    @JsonIgnore
    private int userId;//用户id
    
    private String userName;//用户名
    
    private Date uploadtime;//上传时间
    
    private String uploadTime;
    
    
    

    public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	public Date getUploadtime() {
		return uploadtime;
	}

	public void setUploadTime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getSignImg() {
		return signImg;
	}

	public void setSignImg(String signImg) {
		this.signImg = signImg;
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

    public String getMeetingTitle() {
        return meetingTitle;
    }

    public void setMeetingTitle(String meetingTitle) {
        this.meetingTitle = meetingTitle == null ? null : meetingTitle.trim();
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file == null ? null : file.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }
}