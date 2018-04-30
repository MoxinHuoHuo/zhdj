package com.zeng.zhdj.wy.entity;

public class News {
    private Integer newId;

    private String newTitle;

    private String newHref;

    private String newsDate;

    private String imgs;

    public Integer getNewId() {
        return newId;
    }

    public void setNewId(Integer newId) {
        this.newId = newId;
    }

    public String getNewTitle() {
        return newTitle;
    }

    public void setNewTitle(String newTitle) {
        this.newTitle = newTitle == null ? null : newTitle.trim();
    }

    public String getNewHref() {
        return newHref;
    }

    public void setNewHref(String newHref) {
        this.newHref = newHref == null ? null : newHref.trim();
    }

    public String getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate) {
        this.newsDate = newsDate == null ? null : newsDate.trim();
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs == null ? null : imgs.trim();
    }
}