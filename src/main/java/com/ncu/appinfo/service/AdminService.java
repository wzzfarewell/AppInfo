package com.ncu.appinfo.service;

import com.ncu.appinfo.entity.BackendUser;

/**
 * AdminService
 *
 * @author wzzfarewell
 * @date 2019/8/6
 **/
public interface AdminService {

    BackendUser login(String name, String password);
}
