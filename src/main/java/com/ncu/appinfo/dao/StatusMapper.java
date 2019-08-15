package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.Status;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatusMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Status record);

    int insertSelective(Status record);

    Status selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Status record);

    int updateByPrimaryKey(Status record);

    List<Status> listByAppId(Long appId);

    List<String> listStatusByCode(String typeCode);

    /**
     * 把指定id的App设置为指定的APP状态
     * @param appStatus Constant.AppStatus中的值
     * @param appId
     * @return
     */
    int updateAppStatus(@Param("appStatus")String appStatus, @Param("appId") Long appId);

    List<Status> listByVersionId(Long versionId);

    int addVersionStatus(@Param(value = "versionId") Long versionId,@Param(value = "statusId") Long statusId);

    int updateVersionStatus(@Param(value = "versionId") Long versionId,@Param(value = "statusId") Long statusId);

    Long findIdByStatusName(String statusName);

    int addAppStatus(@Param(value = "appId") Long appId,@Param(value = "statusId") Long statusId);

    int updateAppStatusByType(@Param(value = "appId") Long appId, @Param(value = "statusId") Long statusId,@Param(value = "typeCode") String typeCode);

    int deleteAppStatus(Long appId);

    String findAppStatus(@Param(value = "appId")Long appId,@Param(value = "typeCode")String typeCode);

}