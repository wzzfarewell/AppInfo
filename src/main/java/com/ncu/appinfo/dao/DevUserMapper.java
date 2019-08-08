package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.DevUser;

import java.util.List;

public interface DevUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DevUser record);

    int insertSelective(DevUser record);

    DevUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DevUser record);

    int updateByPrimaryKey(DevUser record);

    List<DevUser> listByAppId(Long appId);
}