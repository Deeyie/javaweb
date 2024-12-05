package com.servlet.model;

import java.util.Date;

public class User {
    private int id;
    private String username;
    private String email;
    private Date createdAt; // 新增字段
    private int age;
    private String gender;
    private String account;
    private boolean is_banned;
    private boolean is_admin;

    // 构造函数
    public User(int id, String username, String email, Date createdAt,
                int age, String gender, String account, boolean is_banned,boolean is_admin) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.createdAt = createdAt;
        this.age = age;
        this.gender = gender;
        this.account = account;
        this.is_banned = is_banned;
        this.is_admin = is_admin;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public boolean isBanned() {return is_banned;}

    public void setBanned(boolean banned) {
        this.is_banned = banned;
    }

    public boolean isAdmin() {return is_admin;}

    public void setAdmin(boolean admin) {this.is_admin = admin;}

    @Override
    public String toString() {
        return "User{" +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", createAt='" + createdAt + '\'' +
                '}';
    }
}
