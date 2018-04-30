package com.zeng.zhdj.wy.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Warning {
    private Integer id;
    
    private Integer taskId;//对应任务id
    
    private Integer orgAdminId;//组织管理员Id
    
    private Integer warnOrgId;//设置预警的组织id
    
    private String warnOrgName;//设置预警的组织名称
    @JsonIgnore
    private int type;//会议类型

    private Integer orgId;//接受预警的组织id

    private String orgName;//接受预警的组织名称

    private String title;//预警标题
    @JsonIgnore
    private String module;
    @JsonIgnore
    private Date deadline;//预警日期
    
    private String deadLine;
    @JsonIgnore
    private Integer warnTimes;
    @JsonIgnore
    private String exceptionReason;
    
    private String handleWay;//处理方式
    
    private String result;
    
    private int handleStatus;
    @JsonIgnore
    private int timeStatus;
    @JsonIgnore
    private int sendStatus;
    
    private int userId;//用户id
    
    private String userName;
    
    private String userPhone;
    
    @JsonIgnore
    private Date createtime;//创建时间
    
    private String createTime;
   
    private int warnType;//1为总任务预警，0为个人任务预警
    
    private int taskWarnId;//总任务预警id
    
    
    
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getTaskWarnId() {
		return taskWarnId;
	}

	public void setTaskWarnId(int taskWarnId) {
		this.taskWarnId = taskWarnId;
	}

	public int getWarnType() {
		return warnType;
	}

	public void setWarnType(int warnType) {
		this.warnType = warnType;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getWarnOrgName() {
		return warnOrgName;
	}

	public void setWarnOrgName(String warnOrg) {
		this.warnOrgName = warnOrg;
	}

	public String getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}

	public Integer getOrgAdminId() {
		return orgAdminId;
	}

	public void setOrgAdminId(Integer orgAdminId) {
		this.orgAdminId = orgAdminId;
	}

	public Integer getTaskId() {
		return taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public int getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(int sendStatus) {
		this.sendStatus = sendStatus;
	}

	public int getTimeStatus() {
		return timeStatus;
	}

	public void setTimeStatus(int timeStatus) {
		this.timeStatus = timeStatus;
	}

	public Integer getWarnOrgId() {
		return warnOrgId;
	}

	public void setWarnOrgId(Integer warnOrgId) {
		this.warnOrgId = warnOrgId;
	}

	public int getHandleStatus() {
		return handleStatus;
	}

	public void setHandleStatus(int status) {
		this.handleStatus = status;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module == null ? null : module.trim();
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Integer getWarnTimes() {
        return warnTimes;
    }

    public void setWarnTimes(Integer warnTimes) {
        this.warnTimes = warnTimes;
    }

    public String getExceptionReason() {
        return exceptionReason;
    }

    public void setExceptionReason(String exceptionReason) {
        this.exceptionReason = exceptionReason == null ? null : exceptionReason.trim();
    }

    public String getHandleWay() {
        return handleWay;
    }

    public void setHandleWay(String handleWay) {
        this.handleWay = handleWay == null ? null : handleWay.trim();
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

	public Warning() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Warning(Integer orgAdminId, Integer orgId, Integer taskId, Integer warnOrgId, String title, String module, Date deadline,
			Integer warnTimes, String exceptionReason) {
		super();
		this.orgAdminId = orgAdminId;
		this.warnOrgId = warnOrgId;
		this.taskId = taskId;
		this.orgId = orgId;
		this.title = title;
		this.module = module;
		this.deadline = deadline;
		this.warnTimes = warnTimes;
		this.exceptionReason = exceptionReason;
	}

	@Override
	public String toString() {
		return "Warning [id=" + id + ", warnOrgId=" + warnOrgId + ", orgId="
				+ orgId + ", orgName=" + orgName + ", title=" + title
				+ ", module=" + module + ", deadline=" + deadline
				+ ", warnTimes=" + warnTimes + ", exceptionReason="
				+ exceptionReason + ", handleWay=" + handleWay + ", result="
				+ result + ", status=" + handleStatus + "]";
	}

	

	
    
    
}