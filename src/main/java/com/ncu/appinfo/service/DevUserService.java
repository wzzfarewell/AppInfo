package com.ncu.appinfo.service;

import com.ncu.appinfo.entity.DevUser;

public interface DevUserService {
    DevUser login(String username, String password);

    int insert(DevUser user);
}
