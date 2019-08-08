package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.DevUser;
import org.apache.ibatis.annotations.Param;

public interface DevUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DevUser record);

    int insertSelective(DevUser record);

    DevUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DevUser record);

    int updateByPrimaryKey(DevUser record);

    DevUser selectByNameAndPwd(@Param("name") String name, @Param("password") String password);
}