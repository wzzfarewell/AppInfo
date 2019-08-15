package com.ncu.appinfo.dao;

import com.ncu.appinfo.entity.Category;
import org.apache.ibatis.annotations.Param;

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

    Long findIdByCategoryName(String categoryName);

    int addAppCategory(@Param(value = "appId") Long appId, @Param(value = "categoryId") Long categoryId);

    int updateAppCategory(@Param(value = "appId") Long appId, @Param(value = "categoryId") Long categoryId,@Param(value = "categoryCode") String categoryCode);

    int deleteAppCategory(Long appId);

    String findAppCategory(@Param(value = "appId")Long appId,@Param(value = "categoryCode")String categoryCode);
}