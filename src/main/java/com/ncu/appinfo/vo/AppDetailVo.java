package com.ncu.appinfo.vo;

import com.ncu.appinfo.entity.*;

import java.util.List;
import java.util.Map;

/**
 * AppDetailVo
 *
 * @author wzzfarewell
 * @date 2019/8/8
 **/
public class AppDetailVo {

    private App app;

    private Map<String, Category> categoryMap;

    private Map<String, Status> statusMap;

    private List<Version> versions;

    private List<DevUser> devUsers;

    public App getApp() {
        return app;
    }

    public void setApp(App app) {
        this.app = app;
    }

    public Map<String, Category> getCategoryMap() {
        return categoryMap;
    }

    public void setCategoryMap(Map<String, Category> categoryMap) {
        this.categoryMap = categoryMap;
    }

    public Map<String, Status> getStatusMap() {
        return statusMap;
    }

    public void setStatusMap(Map<String, Status> statusMap) {
        this.statusMap = statusMap;
    }

    public List<Version> getVersions() {
        return versions;
    }

    public void setVersions(List<Version> versions) {
        this.versions = versions;
    }

    public List<DevUser> getDevUsers() {
        return devUsers;
    }

    public void setDevUsers(List<DevUser> devUsers) {
        this.devUsers = devUsers;
    }
}
