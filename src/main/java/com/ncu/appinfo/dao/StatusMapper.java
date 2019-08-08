package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.Status;

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
}