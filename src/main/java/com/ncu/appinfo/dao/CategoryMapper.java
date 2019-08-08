package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.Category;

import java.util.List;

public interface CategoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> listByAppId(Long appId);

    List<String> listNameByCode(String categoryCode);
}