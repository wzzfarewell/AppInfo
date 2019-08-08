package com.ncu.appinfo.service.impl;

import com.ncu.appinfo.dao.DevUserMapper;
import com.ncu.appinfo.entity.DevUser;
import com.ncu.appinfo.service.DevUserService;
import com.ncu.appinfo.utils.MD5Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class DevUserServiceImpl implements DevUserService {

    @Autowired
    private DevUserMapper devUserMapper;

    @Override
    public DevUser login(String username, String password) {
        DevUser user=devUserMapper.selectByNameAndPwd(username, MD5Utils.MD5EncodeUtf8WithSalt(password));
        if(user != null){
            user.setDevPassword(StringUtils.EMPTY);
        }else{
            return null;
        }
        return user;
    }

    @Override
    public int insert(DevUser user) {
        user.setDevCode(UUID.randomUUID().toString());
        user.setDevPassword(MD5Utils.MD5EncodeUtf8WithSalt(user.getDevPassword()));
        return devUserMapper.insert(user);
    }
}
