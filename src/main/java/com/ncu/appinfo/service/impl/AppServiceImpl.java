package com.ncu.appinfo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ncu.appinfo.dao.*;
import com.ncu.appinfo.entity.App;
import com.ncu.appinfo.entity.Category;
import com.ncu.appinfo.entity.Status;
import com.ncu.appinfo.entity.Version;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AppService;
import com.ncu.appinfo.vo.AppDetailVo;
import com.ncu.appinfo.vo.AppSearchVo;
import com.ncu.appinfo.vo.AppVersionVo;
import com.ncu.appinfo.vo.AppVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * AppServiceImpl
 *
 * @author wzzfarewell
 * @date 2019/8/7
 **/
@Service
public class AppServiceImpl implements AppService {
    private final AppMapper appMapper;
    private final VersionMapper versionMapper;
    private final CategoryMapper categoryMapper;
    private final StatusMapper statusMapper;
    private final DevUserMapper devUserMapper;

    @Autowired
    public AppServiceImpl(AppMapper appMapper, VersionMapper versionMapper, CategoryMapper categoryMapper, StatusMapper statusMapper, DevUserMapper devUserMapper) {
        this.appMapper = appMapper;
        this.versionMapper = versionMapper;
        this.categoryMapper = categoryMapper;
        this.statusMapper = statusMapper;
        this.devUserMapper = devUserMapper;
    }

    @Override
    public App selectByPrimaryKey(Long appId) {
        return appMapper.selectByPrimaryKey(appId);
    }

    @Override
    public PageInfo<AppVo> listAppByDevUser(int pageNum, int pageSize, Long dev_id, final AppSearchVo appSearchVo) {
        PageHelper.startPage(pageNum, pageSize);
        List<App> apps = appMapper.listByDevUser(dev_id);
        List<AppVo> appVos = new ArrayList<>();
        PageInfo pageInfo = new PageInfo(apps);
        // 组装AppVo对象
        for(App app : apps){
            AppVo appVo = new AppVo();
            // 基本信息
            appVo.setApkName(app.getApkName());
            appVo.setAppId(app.getAppId());
            appVo.setAppName(app.getAppName());
            appVo.setAppSize(app.getAppSize());
            // 版本信息
            appVo.setVersion(versionMapper.selectNewestByAppId(app.getAppId()));
            // 分类信息
            List<Category> categories = categoryMapper.listByAppId(app.getAppId());
            for(Category category : categories){
                if(category.getCategoryCode().equals(Constant.LEVEL1_CATEGORY)){
                    appVo.setFirstCategory(category.getCategoryName());
                }
                if(category.getCategoryCode().equals(Constant.LEVEL2_CATEGORY)){
                    appVo.setSecondCategory(category.getCategoryName());
                }
                if(category.getCategoryCode().equals(Constant.LEVEL3_CATEGORY)){
                    appVo.setThirdCategory(category.getCategoryName());
                }
            }
            // 状态信息
            List<Status> statuses = statusMapper.listByAppId(app.getAppId());
            for(Status status : statuses){
                if(status.getTypeCode().equals(Constant.APP_STATUS)){
                    appVo.setAppStatus(status.getStatusName());
                }
                if(status.getTypeCode().equals(Constant.APP_PLATFORM)){
                    appVo.setAppPlatform(status.getStatusName());
                }
                if(status.getTypeCode().equals(Constant.PUBLISH_STATUS)){
                    appVo.setPublishStatus(status.getStatusName());
                }
            }
            appVos.add(appVo);
        }
        // 根据搜索条件过滤
        if(appSearchVo != null){
            if(StringUtils.isNotBlank(appSearchVo.getAppName())){
                appVos.removeIf(appVo -> !appVo.getAppName().toLowerCase().contains(appSearchVo.getAppName().toLowerCase()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getAppStatus())){
                appVos.removeIf(appVo -> !appVo.getAppStatus().equals(appSearchVo.getAppStatus()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getAppPlatform())){
                appVos.removeIf(appVo -> !appVo.getAppPlatform().equals(appSearchVo.getAppPlatform()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getFirstCategory())){
                appVos.removeIf(appVo -> !appVo.getFirstCategory().equals(appSearchVo.getFirstCategory()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getSecondCategory())){
                appVos.removeIf(appVo -> !appVo.getSecondCategory().equals(appSearchVo.getSecondCategory()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getThirdCategory())){
                appVos.removeIf(appVo -> !appVo.getThirdCategory().equals(appSearchVo.getThirdCategory()));
            }
        }
        pageInfo.setList(appVos);
        return pageInfo;
    }

    @Override
    public PageInfo<AppVo> listUncheckedApp(int pageNum, int pageSize, final AppSearchVo appSearchVo) {
        PageHelper.startPage(pageNum, pageSize);
        // 待审核App列表
        List<App> apps = appMapper.listByStatus(Constant.AppStatus.UNCHECKED.getValue());
        List<AppVo> appVos = new ArrayList<>();
        PageInfo pageInfo = new PageInfo(apps);
        // 组装AppVo对象
        for(App app : apps){
            AppVo appVo = new AppVo();
            // 基本信息
            appVo.setApkName(app.getApkName());
            appVo.setAppId(app.getAppId());
            appVo.setAppName(app.getAppName());
            appVo.setAppSize(app.getAppSize());
            // 版本信息
            appVo.setVersion(versionMapper.selectNewestByAppId(app.getAppId()));
            // 分类信息
            List<Category> categories = categoryMapper.listByAppId(app.getAppId());
            for(Category category : categories){
                if(category.getCategoryCode().equals(Constant.LEVEL1_CATEGORY)){
                    appVo.setFirstCategory(category.getCategoryName());
                }
                if(category.getCategoryCode().equals(Constant.LEVEL2_CATEGORY)){
                    appVo.setSecondCategory(category.getCategoryName());
                }
                if(category.getCategoryCode().equals(Constant.LEVEL3_CATEGORY)){
                    appVo.setThirdCategory(category.getCategoryName());
                }
            }
            // 状态信息
            List<Status> statuses = statusMapper.listByAppId(app.getAppId());
            for(Status status : statuses){
                if(status.getTypeCode().equals(Constant.APP_STATUS)){
                    appVo.setAppStatus(status.getStatusName());
                }
                if(status.getTypeCode().equals(Constant.APP_PLATFORM)){
                    appVo.setAppPlatform(status.getStatusName());
                }
                if(status.getTypeCode().equals(Constant.PUBLISH_STATUS)){
                    appVo.setPublishStatus(status.getStatusName());
                }
            }
            appVos.add(appVo);
        }
        // 根据搜索条件过滤
        if(appSearchVo != null){
            if(StringUtils.isNotBlank(appSearchVo.getAppName())){
                appVos.removeIf(appVo -> !appVo.getAppName().toLowerCase().contains(appSearchVo.getAppName().toLowerCase()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getAppStatus())){
                appVos.removeIf(appVo -> !appVo.getAppStatus().equals(appSearchVo.getAppStatus()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getAppPlatform())){
                appVos.removeIf(appVo -> !appVo.getAppPlatform().equals(appSearchVo.getAppPlatform()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getFirstCategory())){
                appVos.removeIf(appVo -> !appVo.getFirstCategory().equals(appSearchVo.getFirstCategory()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getSecondCategory())){
                appVos.removeIf(appVo -> !appVo.getSecondCategory().equals(appSearchVo.getSecondCategory()));
            }
            if(StringUtils.isNotBlank(appSearchVo.getThirdCategory())){
                appVos.removeIf(appVo -> !appVo.getThirdCategory().equals(appSearchVo.getThirdCategory()));
            }
        }
        pageInfo.setList(appVos);
        return pageInfo;
    }

    @Override
    public List<String> listStatus(String typeCode) {
        return statusMapper.listStatusByCode(typeCode);
    }

    @Override
    public List<String> listCategory(String categoryCode) {
        return categoryMapper.listNameByCode(categoryCode);
    }

    @Override
    public AppDetailVo getAppDetail(Long appId) {
        AppDetailVo appDetailVo = new AppDetailVo();
        appDetailVo.setApp(appMapper.selectByPrimaryKey(appId));

        List<Category> categories = categoryMapper.listByAppId(appId);
        Map<String, Category> categoryMap = new HashMap<>();
        for(Category category : categories){
            if(category.getCategoryCode().equals(Constant.LEVEL1_CATEGORY)){
                categoryMap.put(Constant.LEVEL1_CATEGORY, category);
            }
            if(category.getCategoryCode().equals(Constant.LEVEL2_CATEGORY)){
                categoryMap.put(Constant.LEVEL2_CATEGORY, category);
            }
            if(category.getCategoryCode().equals(Constant.LEVEL3_CATEGORY)){
                categoryMap.put(Constant.LEVEL3_CATEGORY, category);
            }
        }
        appDetailVo.setCategoryMap(categoryMap);

        List<Status> statuses = statusMapper.listByAppId(appId);
        Map<String, Status> statusMap = new HashMap<>();
        for(Status status : statuses){
            if(status.getTypeCode().equals(Constant.APP_STATUS)){
                statusMap.put(Constant.APP_STATUS, status);
            }
            if(status.getTypeCode().equals(Constant.APP_PLATFORM)){
                statusMap.put(Constant.APP_PLATFORM, status);
            }
            if(status.getTypeCode().equals(Constant.PUBLISH_STATUS)){
                statusMap.put(Constant.PUBLISH_STATUS, status);
            }
        }
        appDetailVo.setStatusMap(statusMap);

        appDetailVo.setVersions(versionMapper.listByAppId(appId));
        appDetailVo.setDevUsers(devUserMapper.listByAppId(appId));
        return appDetailVo;
    }

    @Override
    public int checkedApp(Long appId) {
        return statusMapper.updateAppStatus(Constant.AppStatus.CHECKED_SUCCESS.getValue(), appId);
    }

    @Override
    public PageInfo<AppVersionVo> listAppVersion(int pageNum, int pageSize, Long id) {
        PageHelper.startPage(pageNum, pageSize);

        List<Version> versions =versionMapper.selectVersionsByAppId(id);
        List<AppVersionVo> appVersionVos=new ArrayList<>();
        PageInfo pageInfo = new PageInfo(versions);

        for (Version version : versions){
            AppVersionVo appVersionVo=new AppVersionVo();
            appVersionVo.setAppId(id);
            appVersionVo.setAppName(appMapper.selectByVersionId(version.getId()).getAppName());
            appVersionVo.setVersionNo(version.getVersionNo());
            appVersionVo.setVersionSize(version.getVersionSize());
            appVersionVo.setUpdateTime(version.getUpdateTime());
            appVersionVo.setDownloadUrl(version.getDownloadUrl());
            appVersionVo.setVersionInfo(version.getVersionInfo());
            appVersionVo.setApkFileName(version.getApkFileName());
            appVersionVo.setVersionId(version.getId());
            List<Status> statuses = statusMapper.listByVersionId(version.getId());
            for(Status status : statuses) {
                if(status.getTypeCode().equals(Constant.PUBLISH_STATUS)){
                    appVersionVo.setStatusName(status.getStatusName());
                }
            }
            appVersionVos.add(appVersionVo);
        }
        pageInfo.setList(appVersionVos);
        return pageInfo;
    }

    @Override
    public int addAppVersion(AppVersionVo appVersionVo) {
        int result=0;
        Version version=new Version();
        version.setVersionNo(appVersionVo.getVersionNo());
        version.setVersionSize(appVersionVo.getVersionSize());
        version.setVersionInfo(appVersionVo.getVersionInfo());
        version.setApkFileName(appVersionVo.getApkFileName());
        version.setDownloadUrl(appVersionVo.getDownloadUrl());

        result=versionMapper.insert(version);
        Long versionId=version.getId();
        Long statusId=9l;

        result+=appMapper.addAppVersion(appVersionVo.getAppId(),versionId);
        result+=statusMapper.addVersionStatus(versionId,statusId);

        return result;
    }

    @Override
    public int updateAppVersion(AppVersionVo appVersionVo) {

        if ("已发布".equals(appVersionVo.getStatusName())){
            return 0;
        }

        int result=0;
        Version version=new Version();

        version.setVersionSize(appVersionVo.getVersionSize());
        version.setVersionInfo(appVersionVo.getVersionInfo());
        version.setApkFileName(appVersionVo.getApkFileName());
        version.setDownloadUrl(appVersionVo.getDownloadUrl());
        version.setId(appVersionVo.getVersionId());

        Long statusId=9l;
        result+= versionMapper.updateAppVersion(version);
        result+= statusMapper.updateVersionStatus(version.getId(),statusId);

        return result;
    }

    @Override
    public int addAppDetail(AppVo appVo) {
        int result=0;
        App app = new App();
        app.setAppName(appVo.getAppName());
        app.setApkName(appVo.getApkName());
        app.setSupportRom(appVo.getSupportRom());
        app.setLanguage(appVo.getLanguage());
        app.setAppSize(appVo.getAppSize());
        app.setAppInfo(appVo.getAppInfo());
        result=appMapper.insertSelective(app);

        Long appId=app.getAppId();
        result+=categoryMapper.addAppCategoryMapper(appId,categoryMapper.findIdByCategoryName(appVo.getFirstCategory()));
        result+=categoryMapper.addAppCategoryMapper(appId,categoryMapper.findIdByCategoryName(appVo.getSecondCategory()));
        result+=categoryMapper.addAppCategoryMapper(appId,categoryMapper.findIdByCategoryName(appVo.getThirdCategory()));

        result+=statusMapper.addAppStatus(appId,statusMapper.findIdByStatusName(appVo.getAppPlatform()));
        /*添加待审核状态*/
        result+=statusMapper.addAppStatus(appId,new Long((long)1));
        result+=devUserMapper.addAppDev(appId,appVo.getDevId());

        return result;
    }

    public int putOnApp(Long id){
        Long statusId =4l;
        return appMapper.updateAppStatus(id,statusId);
    }
    public int putOffApp(Long id){
        Long statusId =5l;
        return appMapper.updateAppStatus(id,statusId);
    }

    @Override
    public AppVo getAppVo(Long appId) {
        App app=appMapper.selectByPrimaryKey(appId);
        String firstCategory=categoryMapper.findAppCategory(appId,"一级分类");
        String secondCategory=categoryMapper.findAppCategory(appId,"二级分类");
        String thirdCategory=categoryMapper.findAppCategory(appId,"三级分类");
        Version version=versionMapper.selectNewestByAppId(appId);
        Long devId=appMapper.selectDevUserByAppId(appId);
        String appStatus=statusMapper.findAppStatus(appId,"AppStatus");
        String appPlatform=statusMapper.findAppStatus(appId,"AppPlatform");
        String publishStatus=statusMapper.findAppStatus(appId,"PublishStatus");

        AppVo appVo = new AppVo(
                app.getAppId(),
                app.getAppName(),
                app.getApkName(),
                app.getSupportRom(),
                app.getAppSize(),
                firstCategory,
                secondCategory,
                thirdCategory,
                appStatus,
                appPlatform,
               publishStatus,
                version,
                app.getAppInfo(),
                app.getLanguage(),
                devId
        );
        return appVo;
    }
}
