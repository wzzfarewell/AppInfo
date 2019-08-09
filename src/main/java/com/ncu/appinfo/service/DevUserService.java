package com.ncu.appinfo.service;

import com.github.pagehelper.PageInfo;
import com.ncu.appinfo.entity.DevUser;

public interface DevUserService {
    DevUser login(String username, String password);

    int insert(DevUser user);

    PageInfo<DevUser> listDevUser(int pageNum, int pageSize, String devName);

    DevUser getByDevId(Long id);

    int deleteDevById(Long id);
}
