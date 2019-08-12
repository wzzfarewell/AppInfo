package com.ncu.appinfo.vo;

/**
 * AppSearchVo
 *
 * @author wzzfarewell
 * @date 2019/8/7
 **/
public class AppSearchVo {

    private String appName;
    private String appStatus;
    private String appPlatform;
    private String firstCategory;
    private String secondCategory;
    private String thirdCategory;

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(String appStatus) {
        this.appStatus = appStatus;
    }

    public String getAppPlatform() {
        return appPlatform;
    }

    public void setAppPlatform(String appPlatform) {
        this.appPlatform = appPlatform;
    }

    public String getFirstCategory() {
        return firstCategory;
    }

    public void setFirstCategory(String firstCategory) {
        this.firstCategory = firstCategory;
    }

    public String getSecondCategory() {
        return secondCategory;
    }

    public void setSecondCategory(String secondCategory) {
        this.secondCategory = secondCategory;
    }

    public String getThirdCategory() {
        return thirdCategory;
    }

    public void setThirdCategory(String thirdCategory) {
        this.thirdCategory = thirdCategory;
    }

    @Override
    public String toString() {
        return "AppSearchVo{" +
                "appName='" + appName + '\'' +
                ", appStatus='" + appStatus + '\'' +
                ", appPlatform='" + appPlatform + '\'' +
                ", firstCategory='" + firstCategory + '\'' +
                ", secondCategory='" + secondCategory + '\'' +
                ", thirdCategory='" + thirdCategory + '\'' +
                '}';
    }
}
