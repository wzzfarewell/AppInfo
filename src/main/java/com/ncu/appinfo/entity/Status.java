package com.ncu.appinfo.entity;

import java.util.Date;

public class Status {
    private Long id;

    private String typeCode;

    private String typeName;

    private Long statusId;

    private String statusName;

    private Date createTime;

    private Date updateTime;

    public Status(Long id, String typeCode, String typeName, Long statusId, String statusName, Date createTime, Date updateTime) {
        this.id = id;
        this.typeCode = typeCode;
        this.typeName = typeName;
        this.statusId = statusId;
        this.statusName = statusName;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Status() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode == null ? null : typeCode.trim();
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName == null ? null : statusName.trim();
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