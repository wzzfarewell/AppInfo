package com.ncu.appinfo.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Version {
    private Long id;

    private String versionNo;

    private String versionInfo;

    private String downloadUrl;

    private Long downloadCount;

    private BigDecimal versionSize;

    private String apkFileName;

    private String apkLocPath;

    private Date createTime;

    private Date updateTime;

    public Version(Long id, String versionNo, String versionInfo, String downloadUrl, Long downloadCount, BigDecimal versionSize, String apkFileName, String apkLocPath, Date createTime, Date updateTime) {
        this.id = id;
        this.versionNo = versionNo;
        this.versionInfo = versionInfo;
        this.downloadUrl = downloadUrl;
        this.downloadCount = downloadCount;
        this.versionSize = versionSize;
        this.apkFileName = apkFileName;
        this.apkLocPath = apkLocPath;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Version() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVersionNo() {
        return versionNo;
    }

    public void setVersionNo(String versionNo) {
        this.versionNo = versionNo == null ? null : versionNo.trim();
    }

    public String getVersionInfo() {
        return versionInfo;
    }

    public void setVersionInfo(String versionInfo) {
        this.versionInfo = versionInfo == null ? null : versionInfo.trim();
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl == null ? null : downloadUrl.trim();
    }

    public Long getDownloadCount() {
        return downloadCount;
    }

    public void setDownloadCount(Long downloadCount) {
        this.downloadCount = downloadCount;
    }

    public BigDecimal getVersionSize() {
        return versionSize;
    }

    public void setVersionSize(BigDecimal versionSize) {
        this.versionSize = versionSize;
    }

    public String getApkFileName() {
        return apkFileName;
    }

    public void setApkFileName(String apkFileName) {
        this.apkFileName = apkFileName == null ? null : apkFileName.trim();
    }

    public String getApkLocPath() {
        return apkLocPath;
    }

    public void setApkLocPath(String apkLocPath) {
        this.apkLocPath = apkLocPath == null ? null : apkLocPath.trim();
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