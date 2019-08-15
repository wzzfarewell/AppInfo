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

    List<Version> selectVersionsByAppId(Long id);

    int updateAppVersion(Version version);

    int deleteAppVersion(Long appId);

    int deleteApk(Long versionid);
}