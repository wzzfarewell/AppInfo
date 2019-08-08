package com.ncu.appinfo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ncu.appinfo.dao.AppMapper;
import com.ncu.appinfo.dao.CategoryMapper;
import com.ncu.appinfo.dao.StatusMapper;
import com.ncu.appinfo.dao.VersionMapper;
import com.ncu.appinfo.entity.App;
import com.ncu.appinfo.entity.Category;
import com.ncu.appinfo.entity.Status;
import com.ncu.appinfo.global.Constant;
import com.ncu.appinfo.service.AppService;
import com.ncu.appinfo.vo.AppSearchVo;
import com.ncu.appinfo.vo.AppVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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

    @Autowired
    public AppServiceImpl(AppMapper appMapper, VersionMapper versionMapper, CategoryMapper categoryMapper, StatusMapper statusMapper) {
        this.appMapper = appMapper;
        this.versionMapper = versionMapper;
        this.categoryMapper = categoryMapper;
        this.statusMapper = statusMapper;
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
            appVo.setVersion(versionMapper.selectByAppId(app.getAppId()));
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
}
