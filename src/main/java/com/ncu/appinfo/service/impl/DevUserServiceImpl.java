package com.ncu.appinfo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ncu.appinfo.dao.DevUserMapper;
import com.ncu.appinfo.entity.DevUser;
import com.ncu.appinfo.service.DevUserService;
import com.ncu.appinfo.utils.MD5Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
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

    @Override
    public PageInfo<DevUser> listDevUser(int pageNum, int pageSize, String devName) {
        PageHelper.startPage(pageNum, pageSize);
        List<DevUser> devUsers = new ArrayList<>();
        if(StringUtils.isNotBlank(devName)){
            devUsers = devUserMapper.listByName("%" + devName + "%");
        }else{
            devUsers = devUserMapper.listAll();
        }
        for(DevUser devUser: devUsers){
            devUser.setDevPassword(StringUtils.EMPTY);
        }
        return new PageInfo<>(devUsers);
    }

    @Override
    public DevUser getByDevId(Long id) {
        DevUser user = devUserMapper.selectByPrimaryKey(id);
        user.setDevPassword(StringUtils.EMPTY);
        return user;
    }

    @Override
    public int deleteDevById(Long id) {
        return devUserMapper.deleteByPrimaryKey(id);
    }
}
