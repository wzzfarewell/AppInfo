package com.ncu.appinfo.service;

import com.github.pagehelper.PageInfo;
import com.ncu.appinfo.vo.AppDetailVo;
import com.ncu.appinfo.vo.AppSearchVo;
import com.ncu.appinfo.vo.AppVo;

import java.util.List;

/**
 * AppService
 *
 * @author wzzfarewell
 * @date 2019/8/7
 **/
public interface AppService {

    PageInfo<AppVo> listUncheckedApp(int pageNum, int pageSize, AppSearchVo appSearchVo);

    PageInfo<AppVo> listAppByDevUser(int pageNum, int pageSize, Long dev_id, AppSearchVo appSearchVo);

    List<String> listStatus(String typeCode);

    List<String> listCategory(String categoryCode);

    AppDetailVo getAppDetail(Long appId);

    int checkedApp(Long appId);
}
