package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.DevUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DevUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DevUser record);

    int insertSelective(DevUser record);

    DevUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DevUser record);

    int updateByPrimaryKey(DevUser record);

    List<DevUser> listByAppId(Long appId);

    DevUser selectByNameAndPwd(@Param("name") String name, @Param("password") String password);

    List<DevUser> listAll();

    List<DevUser> listByName(String name);

    int addAppDev(@Param(value = "appId") Long appId, @Param(value = "devId") Long devId);
}