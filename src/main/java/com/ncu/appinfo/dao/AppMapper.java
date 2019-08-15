package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.App;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppMapper {
    int deleteByPrimaryKey(Long appId);

    int insert(App record);

    int insertSelective(App record);

    App selectByPrimaryKey(Long appId);

    int updateByPrimaryKeySelective(App record);

    int updateByPrimaryKey(App record);

    /**
     * 根据传入的状态名称（待审核，已审核...) 查询App
     * @param statusName Constant.AppStatus.value中的值
     * @return 按照app_id升序排列的APP列表
     */
    List<App> listByStatus(String statusName);

    /**
     * 根据传入的开发者id查询App
     * @param dev_id
     * @return 按照app_id升序排列的APP列表
     */
    List<App> listByDevUser(Long dev_id);

    App selectByVersionId(Long id);

    int addAppVersion(@Param(value = "appId") Long appId,@Param(value = "versionId") Long versionId);

    int updateAppStatus(@Param(value = "appId") Long appId,@Param(value = "statusId") Long statusId);

    Long selectDevUserByAppId(Long appId);
}