package com.ncu.appinfo.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Size;
import java.util.Date;

public class DevUser {
    private Long id;

    private String devCode;

    @NotBlank(message = "用户名不能为空")
    @Size(max = 64, message = "用户名不超过64个字符")
    private String devName;

    @NotBlank(message = "密码不能为空")
    @Size(max = 16, min = 6, message = "密码长度应为6-16个字符")
    private String devPassword;

    @NotBlank(message = "邮箱不能为空")
    @Email(message = "请填写正确邮箱")
    private String devEmail;

    private String devInfo;

    private Date createTime;

    private Date updateTime;

    public DevUser(Long id, String devCode, String devName, String devPassword, String devEmail, String devInfo, Date createTime, Date updateTime) {
        this.id = id;
        this.devCode = devCode;
        this.devName = devName;
        this.devPassword = devPassword;
        this.devEmail = devEmail;
        this.devInfo = devInfo;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public DevUser() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDevCode() {
        return devCode;
    }

    public void setDevCode(String devCode) {
        this.devCode = devCode == null ? null : devCode.trim();
    }

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName == null ? null : devName.trim();
    }

    public String getDevPassword() {
        return devPassword;
    }

    public void setDevPassword(String devPassword) {
        this.devPassword = devPassword == null ? null : devPassword.trim();
    }

    public String getDevEmail() {
        return devEmail;
    }

    public void setDevEmail(String devEmail) {
        this.devEmail = devEmail == null ? null : devEmail.trim();
    }

    public String getDevInfo() {
        return devInfo;
    }

    public void setDevInfo(String devInfo) {
        this.devInfo = devInfo == null ? null : devInfo.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}