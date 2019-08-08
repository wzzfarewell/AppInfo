package com.ncu.appinfo.service.impl;

import com.ncu.appinfo.dao.BackendUserMapper;
import com.ncu.appinfo.entity.BackendUser;
import com.ncu.appinfo.service.AdminService;
import com.ncu.appinfo.utils.MD5Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * AdminServiceImpl
 *
 * @author wzzfarewell
 * @date 2019/8/6
 **/
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private BackendUserMapper userMapper;

    @Override
    public BackendUser login(String name, String password) {
        BackendUser user = userMapper.selectByNameAndPwd(name, MD5Utils.MD5EncodeUtf8WithSalt(password));
        if(user != null){
            user.setPassword(StringUtils.EMPTY);
        }else{
            return null;
        }
        return user;
    }
}
