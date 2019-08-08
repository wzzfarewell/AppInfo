package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.BackendUser;
import org.apache.ibatis.annotations.Param;

public interface BackendUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BackendUser record);

    int insertSelective(BackendUser record);

    BackendUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BackendUser record);

    int updateByPrimaryKey(BackendUser record);

    BackendUser selectByNameAndPwd(@Param("name") String name, @Param("password") String password);
}