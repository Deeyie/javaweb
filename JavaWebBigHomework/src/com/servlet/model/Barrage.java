package com.servlet.model;

import java.util.Date;

public class Barrage {
    private int id;
    private int userId;
    private String content;
    private Date createdAt;

    // 构造函数
    public Barrage() {
    }

    public Barrage(int id, int userId, String content, Date createdAt) {
        this.id = id;
        this.userId = userId;
        this.content = content;
        this.createdAt = createdAt;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSendTime() {
        return createdAt;
    }

    public void setSendTime(Date createdAt) {
        this.createdAt = createdAt;
    }
}
