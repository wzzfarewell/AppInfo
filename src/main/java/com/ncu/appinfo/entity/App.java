package com.ncu.appinfo.entity;

import java.math.BigDecimal;
import java.util.Date;

public class App {
    private Long appId;

    private String appName;

    private String apkName;

    private String supportRom;

    private String language;

    private BigDecimal appSize;

    private String appInfo;

    private String logoPicPath;

    private Date onSaleTime;

    private Date offSaleTime;

    private Date createTime;

    private Date updateTime;

    public App(Long appId, String appName, String apkName, String supportRom, String language, BigDecimal appSize, String appInfo, String logoPicPath, Date onSaleTime, Date offSaleTime, Date createTime, Date updateTime) {
        this.appId = appId;
        this.appName = appName;
        this.apkName = apkName;
        this.supportRom = supportRom;
        this.language = language;
        this.appSize = appSize;
        this.appInfo = appInfo;
        this.logoPicPath = logoPicPath;
        this.onSaleTime = onSaleTime;
        this.offSaleTime = offSaleTime;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public App() {
        super();
    }

    public Long getAppId() {
        return appId;
    }

    public void setAppId(Long appId) {
        this.appId = appId;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName == null ? null : appName.trim();
    }

    public String getApkName() {
        return apkName;
    }

    public void setApkName(String apkName) {
        this.apkName = apkName == null ? null : apkName.trim();
    }

    public String getSupportRom() {
        return supportRom;
    }

    public void setSupportRom(String supportRom) {
        this.supportRom = supportRom == null ? null : supportRom.trim();
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language == null ? null : language.trim();
    }

    public BigDecimal getAppSize() {
        return appSize;
    }

    public void setAppSize(BigDecimal appSize) {
        this.appSize = appSize;
    }

    public String getAppInfo() {
        return appInfo;
    }

    public void setAppInfo(String appInfo) {
        this.appInfo = appInfo == null ? null : appInfo.trim();
    }

    public String getLogoPicPath() {
        return logoPicPath;
    }

    public void setLogoPicPath(String logoPicPath) {
        this.logoPicPath = logoPicPath == null ? null : logoPicPath.trim();
    }

    public Date getOnSaleTime() {
        return onSaleTime;
    }

    public void setOnSaleTime(Date onSaleTime) {
        this.onSaleTime = onSaleTime;
    }

    public Date getOffSaleTime() {
        return offSaleTime;
    }

    public void setOffSaleTime(Date offSaleTime) {
        this.offSaleTime = offSaleTime;
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