package com.ncu.appinfo.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * AppVo
 *
 * @author Sean
 * @date 2019/8/9
 **/
public class AppVersionVo {
    private Long appId;

    private String appName;

    private String versionNo;

    private BigDecimal versionSize;

    private String statusName;

    private String downloadUrl;

    private Date updateTime;

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getVersionNo() {
        return versionNo;
    }

    public void setVersionNo(String versionNo) {
        this.versionNo = versionNo;
    }

    public BigDecimal getVersionSize() {
        return versionSize;
    }

    public void setVersionSize(BigDecimal versionSize) {
        this.versionSize = versionSize;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "AppVersionVo{" +
                "appName='" + appName + '\'' +
                ", versionNo='" + versionNo + '\'' +
                ", versionSize=" + versionSize +
                ", statusName='" + statusName + '\'' +
                ", downloadUrl='" + downloadUrl + '\'' +
                ", updateTime=" + updateTime +
                '}';
    }
}
