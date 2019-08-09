package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.Version;

import java.util.List;

public interface VersionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Version record);

    int insertSelective(Version record);

    Version selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Version record);

    int updateByPrimaryKey(Version record);

    Version selectNewestByAppId(Long appId);

    List<Version> listByAppId(Long appId);
}