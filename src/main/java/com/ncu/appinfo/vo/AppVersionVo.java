package com.ncu.appinfo.vo;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
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

    private Long versionId;

    public Long getVersionId() {
        return versionId;
    }

    public void setVersionId(Long versionId) {
        this.versionId = versionId;
    }

    @NotBlank(message = "软件名不能为空")
    private String appName;

    @NotBlank(message = "版本号能为空")
    private String versionNo;

    @NotNull(message = "版本大小不能为空")
    private BigDecimal versionSize;

    private String statusName;

    private String downloadUrl;

    public String getApkFileName() {
        return apkFileName;
    }

    public void setApkFileName(String apkFileName) {
        this.apkFileName = apkFileName;
    }

    private String apkFileName;

    private String versionInfo;

    public Long getAppId() {
        return appId;
    }

    public void setAppId(Long appId) {
        this.appId = appId;
    }

    public String getVersionInfo() {
        return versionInfo;
    }

    public void setVersionInfo(String versionInfo) {
        this.versionInfo = versionInfo;
    }

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
                "appId=" + appId +///////////////////////////////
                ", appName='" + appName + '\'' +////////////////////////
                ", versionNo='" + versionNo + '\'' +//////////////////////////
                ", versionSize=" + versionSize +////////////////////////////////
                ", statusName='" + statusName + '\'' +///////////////////////////
                ", downloadUrl='" + downloadUrl + '\'' +///////////////////
                ", apkFileName='" + apkFileName + '\'' +////////////////////
                ", versionInfo='" + versionInfo + '\'' +/////////////////////////
                ", updateTime=" + updateTime +///////////////////////
                '}';
    }
}
